/*
	版权所有 2009-2012 武汉命运科技有限公司 保留所有版权。
	邮箱:1085617561@qq.com
	描述:Word图片粘贴控件
	此文件实现上传后自动关闭上传窗口的功能
	更新记录：
		2012-07-04 增加对IE9的支持。
*/

//全局对象
var WordPasterManagerInstance = null; //全局实例
//系统错误
var WordPasterError = {
	"0": "连接服务器错误"
	, "1": "发送数据错误"
	, "2": "接收数据错误"
	, "3": "本地文件不存在"
	, "4": "不能读取本地文件"
	, "5": "公司未授权"
	, "6": "未设置IP"
	, "7": "域名未授权"
};

/*
	上传对象管理器
	关联HTML元素：
		文件上传列表：FilePostLister
		文件上传列表项模板：UploaderTemplate
		文件上传列表分隔线：FilePostLine
*/
function WordPasterManager(mgr)
{
	WordPasterManagerInstance = this;//全局实例
	this.Manager = mgr;//粘贴管理器
	this.ActiveX = mgr.ActiveX;
	this.Config = mgr.Config;
	this.Fields = mgr.Fields;
	this.Browser = mgr.Browser;
	this.BrowserVer = mgr.BrowserVer;
	this.WordParser = mgr.ctlWordParser;
	this.WordParser.Object = this;
	this.WordParser.AddWordImg = WordParser_AddImage;
	this.WordParser.Init();
	this.OpenDialog = mgr.OpenUploadFileDialog;
	this.CloseDialog = mgr.CloseUploadFileDialog;
	
	this.EditorContent = ""; //编辑器内容。当图片上传完后需要更新此变量值
	this.Editor = null; //编辑器
	this.CurrentUploader = null; //当前上传项。
	this.UploaderListDiv = $("#FilePostLister"); //上传列表层
	this.UploaderTemplateDiv = $("#UploaderTemplate"); //上传项信息层模板
	this.UploaderSplitLine = $("#FilePostLine"); //上传列表分割线
	this.UploaderList = new Object(); //上传项列表
	//已上传图片列表
	//模型：LocalUrl:ServerUrl
	this.UploadCompleteImage = new Array();
	this.UploaderListCount = 0; //上传项总数
	this.UnUploaderIdList = new Array(); //未上传项ID列表

	//photo regex
	this.ImgRegx = /<img width=\"\d+\" height=\"\d+\" alt=\"\S*\" src=\"file:\/\/\/(\S+)\"\ \/>/gi;
	this.ImgRegx2 = /<img src=\"file:\/\/\/(\S+)\" width=\d+ height=\d+>/gi;
	this.ShapeStyleRegexs = {
		wh: /(?:width: )(\S+)pt; (?:height: )(\S+)pt/i
	, w: /(?:width: )(\S+)pt;/i
	};
	this.StyleSrcRegx = /style=\"(.*)\"(?:.*)src=\"file:\/\/\/(\S+)\"/;
	this.imgSrcRegex = /(?:src=\"file:\/\/\/)(\S+)\"/;
	//<v:shape 样式提供给img标签使用
	this.styleRegx = /style=\"(.*?)\"/;
	this.ImgRegex = {
		word: /<v:imagedata o:title=\"\S*\" src=\"file:\/\/\/(\S+)\"><\/v:imagedata>/gi
		, word2: /src=\"file:\/\/\/(\S+)\"><\/v:imagedata>/gi
		, app: /<v:imagedata src=\"file:\/\/\/(\S+)\" o:href=\"(\S+)\"><\/v:imagedata>/gi
		, web: /<v:imagedata o:href=\"(\S+)\" src=\"file:\/\/\/(\S+)\"><\/v:imagedata>/gi
		, loc: /<v:imagedata src=\"file:\/\/\/(\S+)\" o:title=\"\S*\"><\/v:imagedata>/gi
		, wps: /<img width=\"\d+\" height=\"\d+\" alt=\"\S*\" src=\"file:\/\/\/(\S+)\" \/>/gi
		, wps2: /<img src=\"file:\/\/\/(\S+)\" width=\d+ height=\d+>/gi
	};

	//检查是否存在本地相同图片
	this.CompleteExist = function(localPath)
	{
		for (var i = 0, l = this.UploadCompleteImage.length; i < l; ++i)
		{
			if (this.UploadCompleteImage[i].localPath == localPath)
			{
				return true;
			}
		}
		return false;
	};

	//添加到已完成列表
	this.CompleteAdd = function(localPathStr, serverPathStr)
	{
		this.UploadCompleteImage.push({ localPath: localPathStr, serverPath: serverPathStr });
	};

	//清空已完成列表，关闭图片上传对话框时调用
	this.CompleteClear = function()
	{
		this.UploadCompleteImage.length = 0;
	};

	//获取已完成的图片地址
	this.CompleteGet = function(localPath)
	{
		for (var i = 0, l = this.UploadCompleteImage.length; i < l; ++i)
		{
			if (this.UploadCompleteImage[i].localPath == localPath)
			{
				return this.UploadCompleteImage[i].serverPath;
			}
		}
		return "";
	};

	//传送当前队列的第一个文件
	this.PostFirst = function()
	{
		if (this.UnUploaderIdList.length > 0)
		{
			var index = this.UnUploaderIdList.shift();
			this.UploaderList[index].Post();
		}
	};
	
	/*
	验证文件名是否存在
	参数:
		fileName 包含完整路径的文件名称
	*/
	this.Exist = function(fileName)
	{
		for (a in this.UploaderList)
		{
			if (this.UploaderList[a].LocalFile == fileName)
			{
				return true;
			}
		}
		return false;
	};

	/*
	根据ID删除上传任务
	参数:
	fileID
	*/
	this.Delete = function(fileID)
	{
		var obj = this.UploaderList[fileID];
		if (null == obj) return;

		var tbID = "item" + obj.FileID;
		var item = document.getElementById(tbID);
		if (item) document.removeChild(item); //删除
	};

	//检查剪帖板中是否包含WORD图片
	this.HasWordImages = function(html)
	{
		for (regName in this.ImgRegex)
		{
			var imgs = html.match(this.ImgRegex[regName]);
			if (null != imgs)
			{
				return true;
			}
		}
		return false;
	};
	
	//粘贴Word
	this.PasteWord = function()
	{
		this.EditorContent = this.WordParser.GetWord();
		//有图片
		if (this.WordParser.GetImages())
		{
			this.OpenDialog();
			this.PostFirst();
		} //没有图片
		else
		{
			this.Editor.insertHtml(this.EditorContent);
			//this.UpdateContent();
		}
	};
	
	//粘贴Excel
	this.PasteExcel = function()
	{ 
		this.EditorContent = this.WordParser.GetExcel();
		//有图片
		if (this.WordParser.GetImages())
		{
			this.OpenDialog();
			this.PostFirst();
		} //没有图片
		else
		{
			this.Editor.insertHtml(this.EditorContent);
			//this.UpdateContent();
		}
	};

	//匹配形状并自动上传
	this.MatchShape = function(data)
	{
		this.EditorContent = data;
		this.WordParser.Parse(this.EditorContent);
		this.MatchImgs(this.EditorContent);
		this.MatchImgs2(this.EditorContent);
		this.OpenDialog();
		this.PostFirst();
	};

	//配置img标签
	//<img width="553" height="217" alt="" src="file:///C:/Users/ADMINI~1/AppData/Local/Temp/ksohtml/wps_clip_image-12942.png" />
	this.MatchImgs = function(html)
	{
		var imgStyle = /width=\"(\d+)\" height=\"(\d+)\" alt=\"\S*\" src=\"file:\/\/\/(\S+)\"/;
		var imgs = html.match(this.ImgRegx);
		if (null != imgs)
		{
			for (var i = 0, l = imgs.length; i < l; ++i)
			{
				var style = imgStyle.exec(imgs[i]);
				if (style)
				{
					this.AddFile(RegExp.$3, imgs[i], RegExp.$1, RegExp.$1);
				}
			}
		}
	};

	//WPS标签
	//<IMG src="file:///C:/DOCUME~1/ADMINI~1/LOCALS~1/Temp/ksohtml/wps_clip_image-25006.png" width=301 height=849>
	this.MatchImgs2 = function(html)
	{
		var imgStyle = /src=\"file:\/\/\/(\S+)\" width=(\d+) height=(\d+)/;
		var imgs = html.match(this.ImgRegx2);
		if (null != imgs)
		{
			for (var i = 0, l = imgs.length; i < l; ++i)
			{
				var style = imgStyle.exec(imgs[i]);
				if (style)
				{
					this.AddFile(RegExp.$1, imgs[i], RegExp.$2, RegExp.$3);
				}
			}
		}
	};

	/*
		解析形状项
		参数：
			shapeTag 匹配成功的HTML字符串
			shapeStyle 形状样式字符串。"WIDTH: 600pt; HEIGHT: 450pt" id=_x0000_i1025 alt="" type="#_x0000_t75"
			imageSrc 图片本地地址。
	*/
	this.MatchShapeItem = function(shapeTag, shapeStyle, imageSrc)
	{
		var width = 0;
		var height = 0;
		var style = this.ShapeStyleRegexs.wh.exec(shapeStyle);
		//匹配高度和宽度
		if (style)
		{
			width = Math.round(RegExp.$1 * 1.3333);
			height = Math.round(RegExp.$2 * 1.3333);
			height = isNaN(height) ? 0 : height;
		} //只匹配宽度，由控件自动计算比例
		else
		{
			style = this.ShapeStyleRegexs.w.exec(shapeStyle);
			if (style)
			{
				width = Math.round(RegExp.$1 * 1.3333);
			}
		}
		this.AddFile(imageSrc, shapeTag, width, height);
	};
	
	//只匹配图片
	this.MatchImage = function()
	{
		var urlReg = /(?:src=\"file:\/\/\/)(\S+)(?:\")/;
		var data = this.Editor.GetClipboardHTML();
		this.EditorContent = data; //保存到图片上传管理器中

		for (regName in this.ImgRegex)
		{
			var imgs = data.match(this.ImgRegex[regName]);
			if (null != imgs)
			{
				var len = imgs.length;
				var url = "";

				for (var i = 0; i < len; i++)
				{
					url = urlReg.exec(imgs[i]);
					if (url)
					{
						this.AddFile(RegExp.$1, imgs[i]);
					}
				}
			}
		}
		this.OpenDialog();
		this.PostFirst();
	};
	
	//开始上传编辑器中所有的WORD图片
	this.UploadImages = function()
	{
		//测试代码。
		this.MatchShape();
	};

	//根据上传信息层模板创建层对象
	this.CreateUploaderDiv = function()
	{
		return this.UploaderTemplateDiv.clone();
	};

	/*
		添加到上传列表
		参数
			index 上传对象唯一标识
			uploaderObj 上传对象
	*/
	this.AppendToUploaderList = function(index, uploaderObj)
	{
		this.UploaderList[index] = uploaderObj;
		++this.UploaderListCount;
	};

	/*
		添加到上传列表层
		参数
			fid 文件ID
			div 上传信息层对象
			obj 上传对象
	*/
	this.AppendToListDiv = function(fid, div, obj)
	{
		var line = this.UploaderSplitLine.clone(true); //分隔线
		line.attr("id","FilePostLine" + fid);
		line.css("display","block");
		obj.Separator = line;

		this.UploaderListDiv.append(div);
		this.UploaderListDiv.append(line);
	};

	/*
		更新编辑器中的图片标签
		参数:
			0 原始图片标签
			1 新的图片地址
	*/
	this.ReplaceEditorImgTag = function(srcOld,srcNew)
	{
		var img = "<img src=\"";
		img += srcNew;
		img += "\"";

		//有style属性
		var style = this.styleRegx.exec(srcOld);
		if (style)
		{
			img += " style=\"" + RegExp.$1 + "\" ";
		}
		img += "/>";
		
		this.EditorContent = this.EditorContent.replace(srcOld, img);
		//this.Editor.SetData(this.EditorContent);
	};

	/*
		更新编辑器内容。
		在所有图片上传完后调用。
		在上传图片出现错误时调用。
	*/
	this.UpdateContent = function()
	{
		//var html = this.CleanWord(this.EditorContent, false, false);
		//this.Editor.insertHtml(html);
		this.Editor.insertHtml(this.EditorContent);
	};
	
	// This function will be called from the PasteFromWord dialog (fck_paste.html)
	// Input: oNode a DOM node that contains the raw paste from the clipboard
	// bIgnoreFont, bRemoveStyles booleans according to the values set in the dialog
	// Output: the cleaned string
	this.CleanWord = function(data, bIgnoreFont, bRemoveStyles)
	{
		var html = data;

		html = html.replace(/<o:p>\s*<\/o:p>/g, '');
		html = html.replace(/<o:p>[\s\S]*?<\/o:p>/g, '&nbsp;');

		// Remove mso-xxx styles.
		html = html.replace(/\s*mso-[^:]+:[^;"]+;?/gi, '');

		// Remove margin styles.
		html = html.replace(/\s*MARGIN: 0cm 0cm 0pt\s*;/gi, '');
		html = html.replace(/\s*MARGIN: 0cm 0cm 0pt\s*"/gi, "\"");

		html = html.replace(/\s*TEXT-INDENT: 0cm\s*;/gi, '');
		html = html.replace(/\s*TEXT-INDENT: 0cm\s*"/gi, "\"");

		html = html.replace(/\s*TEXT-ALIGN: [^\s;]+;?"/gi, "\"");

		html = html.replace(/\s*PAGE-BREAK-BEFORE: [^\s;]+;?"/gi, "\"");

		html = html.replace(/\s*FONT-VARIANT: [^\s;]+;?"/gi, "\"");

		html = html.replace(/\s*tab-stops:[^;"]*;?/gi, '');
		html = html.replace(/\s*tab-stops:[^"]*/gi, '');

		// Remove FONT face attributes.
		if (bIgnoreFont)
		{
			html = html.replace(/\s*face="[^"]*"/gi, '');
			html = html.replace(/\s*face=[^ >]*/gi, '');

			html = html.replace(/\s*FONT-FAMILY:[^;"]*;?/gi, '');
		}

		// Remove Class attributes
		html = html.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi, "<$1$3");

		// Remove styles.
		if (bRemoveStyles)
			html = html.replace(/<(\w[^>]*) style="([^\"]*)"([^>]*)/gi, "<$1$3");

		// Remove style, meta and link tags
		html = html.replace(/<STYLE[^>]*>[\s\S]*?<\/STYLE[^>]*>/gi, '');
		html = html.replace(/<(?:META|LINK)[^>]*>\s*/gi, '');

		// Remove empty styles.
		html = html.replace(/\s*style="\s*"/gi, '');

		html = html.replace(/<SPAN\s*[^>]*>\s*&nbsp;\s*<\/SPAN>/gi, '&nbsp;');

		html = html.replace(/<SPAN\s*[^>]*><\/SPAN>/gi, '');

		// Remove Lang attributes
		html = html.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi, "<$1$3");

		html = html.replace(/<SPAN\s*>([\s\S]*?)<\/SPAN>/gi, '$1');

		html = html.replace(/<FONT\s*>([\s\S]*?)<\/FONT>/gi, '$1');

		// Remove XML elements and declarations
		html = html.replace(/<\\?\?xml[^>]*>/gi, '');

		// Remove w: tags with contents.
		html = html.replace(/<w:[^>]*>[\s\S]*?<\/w:[^>]*>/gi, '');

		// Remove Tags with XML namespace declarations: <o:p><\/o:p>
		html = html.replace(/<\/?\w+:[^>]*>/gi, '');

		// Remove comments [SF BUG-1481861].
		html = html.replace(/<\!--[\s\S]*?-->/g, '');

		html = html.replace(/<(U|I|STRIKE)>&nbsp;<\/\1>/g, '&nbsp;');

		html = html.replace(/<H\d>\s*<\/H\d>/gi, '');

		// Remove "display:none" tags.fix bug:可能会将img标签也替换掉
		//html = html.replace(/<(\w+)[^>]*\sstyle="[^"]*DISPLAY\s?:\s?none[\s\S]*?<\/\1>/ig, '');

		// Remove language tags
		html = html.replace(/<(\w[^>]*) language=([^ |>]*)([^>]*)/gi, "<$1$3");

		// Remove onmouseover and onmouseout events (from MS Word comments effect)
		html = html.replace(/<(\w[^>]*) onmouseover="([^\"]*)"([^>]*)/gi, "<$1$3");
		html = html.replace(/<(\w[^>]*) onmouseout="([^\"]*)"([^>]*)/gi, "<$1$3");

		if (false)
		{
			// The original <Hn> tag send from Word is something like this: <Hn style="margin-top:0px;margin-bottom:0px">
			html = html.replace(/<H(\d)([^>]*)>/gi, '<h$1>');

			// Word likes to insert extra <font> tags, when using MSIE. (Wierd).
			html = html.replace(/<(H\d)><FONT[^>]*>([\s\S]*?)<\/FONT><\/\1>/gi, '<$1>$2<\/$1>');
			html = html.replace(/<(H\d)><EM>([\s\S]*?)<\/EM><\/\1>/gi, '<$1>$2<\/$1>');
		}
		else
		{
			html = html.replace(/<H1([^>]*)>/gi, '<div$1><b><font size="6">');
			html = html.replace(/<H2([^>]*)>/gi, '<div$1><b><font size="5">');
			html = html.replace(/<H3([^>]*)>/gi, '<div$1><b><font size="4">');
			html = html.replace(/<H4([^>]*)>/gi, '<div$1><b><font size="3">');
			html = html.replace(/<H5([^>]*)>/gi, '<div$1><b><font size="2">');
			html = html.replace(/<H6([^>]*)>/gi, '<div$1><b><font size="1">');

			html = html.replace(/<\/H\d>/gi, '<\/font><\/b><\/div>');

			// Transform <P> to <DIV>
			var re = new RegExp('(<P)([^>]*>[\\s\\S]*?)(<\/P>)', 'gi'); // Different because of a IE 5.0 error
			html = html.replace(re, '<div$2<\/div>');

			// Remove empty tags (three times, just to be sure).
			// This also removes any empty anchor
			html = html.replace(/<([^\s>]+)(\s[^>]*)?>\s*<\/\1>/g, '');
			html = html.replace(/<([^\s>]+)(\s[^>]*)?>\s*<\/\1>/g, '');
			html = html.replace(/<([^\s>]+)(\s[^>]*)?>\s*<\/\1>/g, '');
		}
		//<span style="font-family: 宋体; font-size: 12pt"><img alt="" src="/upload/2011-12-03_1119250937.jpg" /></span>
		html = html.replace(/<span[^>]*>(<img.+\/>)<\/span>/gi, '$1');
		//<div style="margin-top: 0pt; margin-bottom: 0pt"><img alt="" src="/upload/2012-01-08_2246370625.jpg" /></div>
		html = html.replace(/<div[^>]*>(<img.+\/>)<\/div>/gi, '$1<br/>');
		//<a name="OLE_LINK2"><span><img/><img/></a>
		html = html.replace(/<a[^>]*>((<span>)?(<img.+\/>).*)<\/a>/gi, '$3');
		return html;
	};
}

/*
	添加图片
	参数：
		obj
		alt
		width
		height
		src
		img
*/
function WordParser_AddImage(obj,alt,width,height,src,img)
{ 
	obj.AddFile(src, img, width, height);
}

/*
	添加一个文件到上传队列
	参数:
		[0] 文件名称
		[1] imgTag图片标记
		width 图片宽度
		heigth 图片高度
	返回值:
	文件上传对象
*/
WordPasterManager.prototype.AddFile = function(imgPath,imgHtml,width,height)
{
	//本地文件名称不存在
	//if (!this.Exist(arguments[0]))
	{
		var fileNameArray = imgPath.split("\\");
		var fileName = fileNameArray[fileNameArray.length - 1];
		var fid = this.UploaderListCount;
		this.UnUploaderIdList.push(fid); //添加到未上传列表
		
		var upFile = new FileUploader(fid, imgPath, this,width,height);
		var newTable = this.CreateUploaderDiv();
		newTable.css("display","block");
		newTable.attr("id","item" + fid);
		var divLeft = newTable.children().eq(0);
		var divRight = newTable.children().eq(1);
		var objFileName = divLeft.children().eq(0);
		objFileName.text(fileName);
		objFileName.attr("title",arguments[0]);
		upFile.pProcess = divLeft.children().eq(1).children().eq(0);
		upFile.pMsg = divLeft.children().eq(2);
		upFile.pMsg.text("");
		upFile.pButton = divRight.children().eq(0);
		upFile.pButton.attr("fid",fid);
		upFile.pButton.attr("domid","item" + fid);
		upFile.pButton.attr("lineid","FilePostLine" + fid);
		upFile.pButton.bind("onclick", BtnControlClick);
		upFile.pButton.bind("onclick",BtnControlClick);
		upFile.pPercent = divRight.children().eq(1);
		upFile.pPercent.text("0%");
		upFile.ImageTag = imgHtml; //图片标记
		upFile.InfDiv = newTable;//上传信息DIV

		//添加到上传列表层
		this.AppendToListDiv(fid, newTable,upFile);

		//添加到上传列表
		this.AppendToUploaderList(fid, upFile);
		//this.UpFileList.appendChild(newTable);
		//this.UpFileList.appendChild(line);
		//upFile.Post(); //开始上传
		upFile.Ready(); //准备
	}
}

/*
	添加本地文件
	参数:
		imgPath	本地图片文件路径
	返回值:
		文件上传对象
*/
WordPasterManager.prototype.AddLocalFile = function(imgPath)
{
	//本地文件名称不存在
	//if (!this.Exist(arguments[0]))
	{
		var fileNameArray = imgPath.split("\\");
		var fileName = fileNameArray[fileNameArray.length - 1];
		var fid = this.UploaderListCount;
		this.UnUploaderIdList.push(fid); //添加到未上传列表

		var upFile = new FileUploader(fid, imgPath, this, 0, 0);
		upFile.ATL.SetImageType(fileName.split(".")[1]);
		upFile.PostLocalFile = true; //标识是本地文件
		var newTable = this.CreateUploaderDiv(); //JQuery Object
		newTable.css("display", "block");
		newTable.attr("id", "item" + fid);
		var divLeft = newTable.children().eq(0);
		var divRight = newTable.children().eq(1);
		var objFileName = divLeft.children().eq(0);
		objFileName.text(fileName);
		objFileName.attr("title", arguments[0]);
		upFile.pProcess = divLeft.children().eq(1).children().eq(0);
		upFile.pMsg = divLeft.children().eq(2);
		upFile.pMsg.text("");
		upFile.pButton = divRight.children().eq(0);
		upFile.pButton.attr("fid", fid);
		upFile.pButton.attr("domid", "item" + fid);
		upFile.pButton.attr("lineid", "FilePostLine" + fid);
		upFile.pButton.attachEvent("onclick", BtnControlClick);
		upFile.pButton.bind("onclick", BtnControlClick);
		upFile.pPercent = divRight.children().eq(1);
		upFile.pPercent.text("0%");
		upFile.ImageTag = ""; //图片标记
		upFile.Manager = this;
		upFile.InfDiv = newTable; //上传信息DIV

		//添加到上传列表层
		this.AppendToListDiv(fid, newTable, upFile);

		//添加到上传列表
		this.AppendToUploaderList(fid, upFile);
		//this.UpFileList.appendChild(newTable);
		//this.UpFileList.appendChild(line);
		//upFile.Post(); //开始上传
		upFile.Ready(); //准备
	}
}

/*
	单击控制按钮
	参数:
		[0]
*/
function BtnControlClick() 
{
	var obj = $(this);//<a fid=""></a>
	var fid = obj.attr("fid");
	var objup = WordPasterManagerInstance.UploaderList[fid];

	switch (obj.innerText) 
	{
		//case "暂停":
		//case "停止":
		case $text("Qs.WordPaster.UploadDialog.Pause"):
		case $text("Qs.WordPaster.UploadDialog.Stop"):
			objup.Stop(obj.fid);
			break;
		//case "取消":
		case $text("Qs.WordPaster.UploadDialog.Cancel"):
			{
				objup.Remove();
			}
			break;
		//case "续传":
		//case "重试":
		case $text("Qs.WordPaster.UploadDialog.Continue"):
		case $text("Qs.WordPaster.UploadDialog.Retry"):
			objup.Post();
			break;
	}
}

var FileUploaderState = {
	Ready: 0,
	Posting: 1,
	Stop: 2,
	Error: 3,
	GetNewID: 4,
	Complete: 5,
	WaitContinueUpload: 6,
	None: 7,
	Waiting: 8
};

/*
	文件上传对象
	参数：
		fileID 文件唯一标识
		filePath 包含完整路径的本地文件名称。D:\Soft\QQ.exe
		width 图片宽度
		height 图片高度
	属性：
		pMsg		显示上传信息，进度信息
		pProcess	进度条
		pPercent	显示百分比文字
		pButton		按钮按钮
		LocalFile	本地文件路径。D:\Soft\QQ.exe
		ImageTag	图片标记。
		InfDiv		上传信息层。
		Separator	分隔线
*/
function FileUploader(fileID,filePath,mgr,width,height)
{
	var _this = this;
	_this.Manager = mgr;
	_this.Editor = mgr.Editor;
	_this.Config = mgr.Config;
	_this.ActiveX = mgr.ActiveX;
	_this.Fields = mgr.Fields;
	_this.Browser = mgr.Browser;
	_this.PostLocalFile = false;//是否上传本地文件

    //FileUploader Control
    _this.FileUploaderIE = 
    {
		"Com":null
		,"FileID":0
		,"Object":null		//调用者设置
		,"LocalFile":""		//调用者设置
		,"OnComplete":null	//调用者设置
		,"OnConnected":null	//调用者设置
		,"OnError":null		//调用者设置
		,"OnPost":null		//调用者设置
		,"Width":0			//调用者设置
		,"Height":0			//调用者设置
		//methods
		,"Init":function()
		{
			this.Com = new ActiveXObject(_this.ActiveX["Uploader"]);
			this.Com.Object = this.Object;
			this.Com.LocalFile = this.LocalFile;
			this.Com.FileID = this.FileID;
			this.Com.Width = this.Width;
			this.Com.Height = this.Height;
			this.Com.PostUrl = _this.Config["PostUrl"];
			this.Com.EncodeType = _this.Config["EncodeType"];
			this.Com.ImageType = _this.Config["PasteWordType"];
			this.Com.JpgQuality = _this.Config["JpgQuality"];
			this.Com.CompanyLicensed = _this.Config["Licensed"];
			this.Com.SetThumbSize(_this.Config["ThumbWidth"], _this.Config["ThumbHeight"]);
			
			this.Com.OnComplete = this.OnComplete;
			this.Com.OnPost = this.OnPost;
			this.Com.OnError = this.OnError;
			this.Com.OnConnected = this.OnConnected;
		}
		,"Dispose":function()
		{
			this.Com.Dispose();
		}
		,"Post":function()
		{
			this.Com.Post();
		}
		,"Stop":function()
		{
			this.Com.Stop();
		}
		,"AddField":function(fn,fv)
		{
			this.Com.AddField(fn,fv);
		}
		,"SetImageType":function(tp)
		{
			this.Com.ImageType = tp;
		}
		,"GetResponse" : function()
		{
			return this.Com.Response;
		}
    };
    _this.FileUploaderFF = 
    {
		"Com":null
		, "FileID": 0
		,"SignID":0
		,"Object":null		//调用者设置
		,"LocalFile":""		//调用者设置
		,"OnComplete":null	//调用者设置
		,"OnConnected":null	//调用者设置
		,"OnError":null		//调用者设置
		,"OnPost":null		//调用者设置
		,"Width":0			//调用者设置
		,"Height":0			//调用者设置
		//methods
		,"Init":function()
		{
			this.Com = _this.Browser.GetPlugin();
			this.SignID = this.Com.FileUploader_AddFile();
			
			this.Com.FileUploader_SetObject(this.SignID,this.Object);
			this.Com.FileUploader_SetLocalFile(this.SignID,this.LocalFile);
			this.Com.FileUploader_SetPostUrl(this.SignID,_this.Config["PostUrl"]);
			this.Com.FileUploader_SetCompany(this.SignID,_this.Config["Licensed"]);
			this.Com.FileUploader_SetEncodeType(this.SignID,_this.Config["EncodeType"]);
			this.Com.FileUploader_SetImageType(this.SignID,_this.Config["PasteWordType"]);
			this.Com.FileUploader_SetJpgQuality(this.SignID,_this.Config["JpgQuality"]);
			this.Com.FileUploader_SetWidth(this.SignID,this.Width);
			this.Com.FileUploader_SetHeight(this.SignID,this.Height);
			this.Com.FileUploader_SetThumbSize(this.SignID,_this.Config["ThumbWidth"], _this.Config["ThumbHeight"]);
			
			this.Com.FileUploader_SetOnComplete(this.SignID,this.OnComplete);
			this.Com.FileUploader_SetOnConnected(this.SignID,this.OnConnected);
			this.Com.FileUploader_SetOnError(this.SignID,this.OnError);
			this.Com.FileUploader_SetOnPost(this.SignID,this.OnPost);
		}
		,"Dispose":function()
		{
			this.Com.FileUploader_DelFile(this.SignID);
		}
		,"Post":function()
		{
			this.Com.FileUploader_Post(this.SignID);
		}
		,"Stop":function()
		{
			this.Com.FileUploader_Stop(this.SignID);
		}
		,"AddField":function(fn,fv)
		{
			this.Com.FileUploader_AddField(this.SignID,fn,fv);
		}
		,"SetImageType":function(tp)
		{
			this.Com.FileUploader_SetImageType(this.SignID,tp);
		}
		,"GetResponse" : function()
		{
			return this.Com.FileUploader_GetResponse(this.SignID);
		}
    };
    _this.ATL = _this.FileUploaderIE;
    if (mgr.BrowserVer == BrowserVersion.Firefox
		|| mgr.BrowserVer == BrowserVersion.Chrome)
    {
    	_this.ATL = _this.FileUploaderFF;
    }
    
	_this.ATL.OnComplete = HttpUploader_Complete;
	_this.ATL.OnPost = HttpUploader_Process;
	_this.ATL.OnError = HttpUploader_Error;
	_this.ATL.OnConnected = HttpUploader_Connected;
	_this.ATL.Object = this;
	_this.ATL.LocalFile = filePath;
	_this.ATL.Width = width;
	_this.ATL.Height = height;
	_this.ATL.Init();
	
	//添加附加字段
	var pname;
	for (pname in _this.Fields)
	{
		_this.ATL.AddField(pname, _this.Fields[pname]);
	}

	_this.State = FileUploaderState.None;
	_this.LocalFile = filePath;
	_this.FileID = fileID;
	_this.ImageTag = ""; //图片标记，在图片上传完后需要替换此标记

	//方法-准备
	_this.Ready = function()
	{
		//this.pButton.style.display = "none";
		//_this.pMsg.text("正在上传队列中等待...");
		_this.pMsg.text($text("Qs.WordPaster.UploadDialog.Waiting"));
		_this.State = FileUploaderState.Ready;
	};

	//方法-开始传输
	this.Post = function()
	{
		//存在相同图片项
		if (_this.ExistSameImage()) return;
		
		_this.pButton.css("display","");
		//_this.pButton.text("停止");
		_this.pButton.text($text("Qs.WordPaster.UploadDialog.Stop"));
		_this.State = FileUploaderState.Posting;
		_this.ATL.Post();
	};

	//存在相同项，本地图片地址相同
	_this.ExistSameImage = function()
	{
		//已上传列表中存在相同项
		if (this.Manager.CompleteExist(this.LocalFile))
		{
			var url = _this.Manager.CompleteGet(this.LocalFile);
			_this.pButton.text("");
			_this.pProcess.css("width","100%");
			_this.pPercent.text("100%");
			//_this.pMsg.text("上传完成");
			_this.pMsg.text($text("Qs.WordPaster.UploadDialog.Finished"));
			_this.State = FileUploaderState.Complete;

			//从上传列表中清除
			_this.Remove();
			//更新编辑器中的图片标签
			_this.ReplaceEditorImgTag(url);
			_this.PostNext();
			return true;
		}
		return false;
	};

	//从上传列表中删除
	_this.Remove = function()
	{
		//删除信息层
		_this.InfDiv.remove();
		//删除分隔线
		_this.Separator.remove();
		//清空本地文件名称
		_this.LocalFile = "";
	};

	//方法-启动下一个传输
	_this.PostNext = function()
	{
		if (_this.Manager.UnUploaderIdList.length > 0)
		{
			var index = _this.Manager.UnUploaderIdList.shift();
			var obj = _this.Manager.UploaderList[index];

			//空闲状态
			if (FileUploaderState.Ready == obj.State)
			{
				obj.Post();
			}
		} //所有文件上传完毕
		else
		{
			//上传Word图片时才替换内容
			if (!_this.PostLocalFile)
			{
				_this.Manager.UpdateContent();
			}
			_this.Manager.CloseDialog();
		}
	};
	
	//停止传输
	_this.Stop = function(fid)
	{
		var obj = _this.Manager.UploaderList[fid];
		obj.ATL.Stop();
		obj.State = FileUploaderState.Stop;
		//obj.pButton.text("重试");
		obj.pButton.text($text("Qs.WordPaster.UploadDialog.Retry"));
	};

	//替换编辑器中的图片标签
	_this.ReplaceEditorImgTag = function(imgSrc)
	{
		_this.Manager.ReplaceEditorImgTag(this.ImageTag, imgSrc);
	};

	//本地图片文件上传完毕
	_this.LocalFileComplete = function(imgSrc)
	{
		var img = '<img src="' + imgSrc + '"/>';
		_this.Editor.insertHtml(img);
	};

	//文件上传完毕
	_this.FilePostComplete = function(imgSrc)
	{
		//上传的本地文件
		if (_this.PostLocalFile)
		{
			_this.LocalFileComplete(imgSrc);
		} //上传的Word中的图片
		else
		{
			_this.ReplaceEditorImgTag(imgSrc);
		}
	};
}

//连接成功
function HttpUploader_Connected(obj)
{
	obj.pMsg.text("服务器连接成功");
}

//传输完毕
function HttpUploader_Complete(obj)
{
	obj.pButton.text("");
	obj.pProcess.css("width","100%");
	obj.pPercent.text("100%");
	//obj.pMsg.text("上传完成");
	obj.pMsg.text($text("Qs.WordPaster.UploadDialog.Finished"));
	obj.State = FileUploaderState.Complete;

	//添加到已上传列表
	obj.Manager.CompleteAdd(obj.LocalFile, obj.ATL.GetResponse());
	//从上传列表中清除
	obj.Remove();
	//更新编辑器中的图片标签
	obj.FilePostComplete(obj.ATL.GetResponse());
	obj.PostNext();
}

//传输进度
function HttpUploader_Process(obj, speed, postedLen, percent, time)
{
	//var msg = "已上传:" + postedLen + " 速度:" + speed + " 剩余时间:" + time;
	var msg = $text("Qs.WordPaster.UploadDialog.Progress", postedLen, speed, time);
	obj.pMsg.text(msg);
	obj.pPercent.text(percent);
	obj.pProcess.css("width",percent);
}

//伟输错误
function HttpUploader_Error(obj, err)
{
	obj.pMsg.text( WordPasterError[err]);
	//obj.pButton.text("重试");
	obj.pButton.text($text("Qs.WordPaster.UploadDialog.Retry"));
	obj.State = FileUploaderState.Error;
	obj.PostNext(); //继续传输下一个
}

/*
	图片粘贴器。负责从剪帖板中获取图片数据，并自动上传到WEB服务器中。
	参数:
	[0] 显示粘贴信息的层
	属性
	InfoDiv 提示信息层，用来显示图片粘贴器的处理进度信息。
	关联HTML元素：
		粘贴信息层：PasterMessager
*/
function ImagePasterManager(mgr)
{
	this.StateType = {
		Posting: 0
		, Stop: 1
		, Error: 2
		, Complete: 3
		, None: 4
	};

	this.Manager = mgr;
	this.Editor = mgr.Editor;
	this.Config = mgr.Config;
	this.Fields = mgr.Fields;
	this.ActiveX = mgr.ActiveX;
	//打开图片上传窗口
	this.OpenDialog = mgr.OpenPasteFileDialog;
	//关闭图片上传窗口
	this.CloseDialog = mgr.ClosePasteFileDialog;
	
	this.InfoDiv = $("#PasterMessager"); //提示信息层
	this.InfoIco = $("#infIco");//信息图标
	this.Message = this.InfoDiv.children().eq(1);
	this.Progress = this.InfoDiv.children().eq(2);
	this.State = this.StateType.None;
	this.Editor = null;

	//初始化，在页面加载完后调用
	this.Init = function()
	{
		this.Com = mgr.ctlImagePaster;
		this.Com.Object = this;
		//this.Com.WebDocument = document;//必须放在后面设置
		//连接事件
		this.Com.OnConnected = ImagePaster_Connected;
		this.Com.OnComplete = ImagePaster_Complete;
		this.Com.OnPost = ImagePaster_OnProcess;
		this.Com.OnError = ImagePaster_OnError;
		this.Com.Init();
	};
	
	this.IsBitmap = function()
	{
		return this.Com.IsBitmap();
	};

	this.IsFile = function()
	{
		return this.Com.IsFile();
	};

	this.IsPosting = function()
	{
		return this.State == this.StateType.Posting;
	};

	//粘贴
	this.Paste = function()
	{
		//清空附加字段
		this.Com.ClearFields();
		var item = null, fields = this.Fields;
		for (item in fields)
		{
			this.Com.AddField(item, fields[item]);
		}

		this.State = this.StateType.Posting;
		this.OpenDialog();
		this.Com.Paste();
	};

	//粘贴多张图片
	this.PasteFiles = function()
	{
		this.Manager.OpenUploadFileDialog();
		var files = this.Com.GetFiles();
		for (var i = 0, l = files.length(); i<l; ++i)
		{
			this.Manager.WordPaster.AddLocalFile(files[i]);
			this.Manager.WordPaster.PostFirst();
		}
	};
}

//服务器连接成功
function ImagePaster_Connected(obj)
{
	obj.InfoDiv.css("display","block");
	obj.Progress.text("10%");
	obj.State = obj.StateType.Posting;
}

//图片上传完毕
function ImagePaster_Complete(obj)
{
	obj.Progress.text("100%");
	//obj.Message.text("上传完成");
	obj.Message.text($text("Qs.WordPaster.UploadDialog.Finished"));
	obj.State = obj.StateType.Complete;
	//obj.InfoDiv.style.display = "none"; //隐藏信息层

	//插入到编辑器
	var img = "<img src=\"";
	img += obj.Com.GetResponse();
	img += "\" />";
	// Insert as plain text.
	obj.Editor.insertHtml(img);
	//关闭窗口
	obj.CloseDialog();//关闭上传窗口
}

/*
事件-传输中....
参数:
obj JS对象
speed	传输速度
length 已传输长度。1Byte,1KB,1MB,1GB
percent 上传百分比
time 剩余时间
*/
function ImagePaster_OnProcess(obj, speed, length, percent, time)
{
	obj.Progress.text(percent);
}

//事件-传输停止。暂时未使用
function ImagePaster_Stop(obj)
{
	obj.Com.Stop();
	obj.State = obj.StateType.Stop;
}
/*
事件-传输错误
参数:
obj JS对象
err 错误码
*/
function ImagePaster_OnError(obj, ert)
{
	obj.Message.innerText = WordPasterError[ert];
	obj.InfoIco.src = obj.Config["IcoPath"] + "error.png";
	obj.Progress.innerText = "";
	obj.State = obj.StateType.Error;
}

//浏览器版本
var BrowserVersion = {
	IE: 0
	, IE64: 1
	, Firefox: 2
	, Chrome: 3
};
//粘贴管理器
function PasterManager(args)
{
	var _this = this;
	_this.Editor = null;
	_this.Domain = "http://" + document.location.host + "/";
	_this.Fields = {}; //符加信息
	_this.UploadDialogCreated = false;
	_this.PasteDialogCreated = false;
	this.BrowserVer = BrowserVersion.IE;
	
	args = args || {};
	var config = args.config || {};
	var activeX = args.activeX || {};

	//配置信息
	_this.Config = {
		"EncodeType"		: "GB2312"
		, "Licensed"		: "Chainsea"
		, "PasteWordType"	: ""	//粘贴WORD的图片格式。JPG/PNG/GIF/BMP，推荐使用JPG格式，防止出现大图片。
		, "PasteImageType"	: ""	//粘贴文件，剪帖板的图片格式，为空表示本地图片格式。JPG/PNG/GIF/BMP
		, "JpgQuality"		: 100	//JPG质量。0~100
		, "ThumbWidth"		: 0		//缩略图宽度。0表示不使用缩略图
		, "ThumbHeight"		: 0		//缩略图高度。0表示不使用缩略图
		, "ClsidImagePaster": config["ClsidImagePaster"]	|| "DC4A6931-3570-44b4-842D-C13EE637BBC1"
		, "ClsidUploader"	: config["ClsidUploader"] 		|| "26CFEDE7-789D-4077-B49D-C7F1D7150B93"
		, "ClsidParser"		: config["ClsidParser"]			|| "1832A49E-09D5-470E-AA4B-BE8F28034218"
		, "AppPath"			: ""
		, "CabPath"			: config["CabPath"]				|| "http://www.ncmem.com/products/word-imagepaster/WordPaster.cab#version=1,4,64,65381"
		, "IcoPath"			: config["IcoPath"]				|| "http://www.ncmem.com/products/word-imagepaster/fckeditor2461/WordPaster/upload.gif"
		, "PostUrl"			: config["PostUrl"]				|| "http://www.ncmem.com/products/word-imagepaster/fckeditor2461/asp.net/upload.aspx"
		//x64
		, "ClsidImagePaster64"	: "04496806-5926-4682-89E6-95ADAA3DF6CE"
		, "ClsidUploader64"		: "E98D2D8B-61F0-44c4-87C6-830D309A874B"
		, "ClsidParser64"		: "9446FA60-55DB-44e9-8FA3-CA485441526A"
		, "CabPath64"			: "http://www.ncmem.com/products/word-imagepaster/WordPaster64.cab#version=1,4,70,20568"
		//Firefox
		, "MimeType"	: "application/npWordPaster"
		, "XpiPath"		: "http://www.ncmem.com/products/word-imagepaster/WordPaster.xpi"
		//Chrome
		, "CrxName"		: config["CrxName"] 	|| "chrWordPaster"
		, "MimeTypeChr"	: config["MimeTypeChr"] || "application/chrWordPaster"
		, "CrxPath"		: config["CrxPath"] 	|| "http://www.ncmem.com/products/word-imagepaster/WordPaster.crx"
	};

	_this.ActiveX = {
		"Uploader"		: activeX["Uploader"]		|| "Xproer.ImageFileUploader"
		, "ImagePaster"	: activeX["ImagePaster"]	|| "Xproer.ImagePaster"
		, "WordParser"	: activeX["WordParser"]		|| "Xproer.WordParser"
		//x64
		, "Uploader64"		: "Xproer.ImageFileUploader64"
		, "ImagePaster64"	: "Xproer.ImagePaster64"
		, "WordParser64"	: "Xproer.WordParser64"
	};

	/*
	console.log("ClsidImagePaster: " + _this.Config.ClsidImagePaster);
	console.log("ClsidUploader: " + _this.Config.ClsidUploader);
	console.log("ClsidParser: " + _this.Config.ClsidParser);
	console.log("CabPath: " + _this.Config.CabPath);
	console.log("IcoPath: " + _this.Config.IcoPath);
	console.log("PostUrl: " + _this.Config.PostUrl);
	console.log("CrxName: " + _this.Config.CrxName);
	console.log("MimeTypeChr: " + _this.Config.MimeTypeChr);
	console.log("CrxPath: " + _this.Config.CrxPath);
	console.log("Uploader: " + _this.ActiveX.Uploader);
	console.log("ImagePaster: " + _this.ActiveX.ImagePaster);
	console.log("WordParser: " + _this.ActiveX.WordParser);
	*/
	
	//FireFox浏览器信息管理对象
	_this.BrowserFF = {
		"GetHtml": function()
		{
			var html = '<embed type="' + _this.Config["MimeType"] + '" pluginspage="' + _this.Config["CabPath"] + '" width="1" height="1" id="objWordPaster"/>';
			return html;
		}
		, "GetPlugin": function()
		{
			return document.getElementById("objWordPaster");
		}
	    , "NeedUpdate": function ()
        {
             var obj = this.GetPlugin();
             var ver = "0";
             try
             {
                 ver = obj.Version;
             }
             catch (e) { }
             //return ver == _this.Config["Version"];
             return false;
        } //检查插件是否已安装
		, "Check": function()
		{
			var mimetype = navigator.mimeTypes[_this.Config["MimeType"]];
			if (mimetype)
			{
				return mimetype.enabledPlugin;
			}
			return mimetype;
		} //安装插件
		, "Setup": function()
		{
			var xpi = new Object();
			xpi["Calendar"] = _this.Config["XpiPath"];
			InstallTrigger.install(xpi, function(name, result) { });
		}
		, "Init": function() { }
	};
	//Chrome浏览器信息管理对象
	_this.BrowserChrome =
	{
		"GetHtml": function()
		{
			var html = '<embed type="' + _this.Config["MimeTypeChr"] + '" pluginspage="' + _this.Config["CabPath"] + '" width="1" height="1" id="objWordPaster"/>';
			return html;
		}
		, "GetPlugin": function()
		{
			return document.getElementById("objWordPaster");
		}
		, "NeedUpdate": function ()
        {
            var obj = this.GetPlugin();
            var ver = "0";
            try
            {
                ver = obj.Version;
            }
            catch (e)
            { }
            //return ver == _this.Config["Version"];
            return false;
        } //检查插件是否已安装
		, "Check": function()
		{
			for (var i = 0, l = navigator.plugins.length; i < l; i++)
			{
				if (navigator.plugins[i].name == _this.Config["CrxName"])
				{
					return true;
				}
			}
			return false;
		} //安装插件
		, "Setup": function()
		{
			document.write('<iframe style="display:none;" src="' + _this.Config["CabPath"] + '"></iframe>');
		}
		, "Init": function()
		{ }
	};
	//IE浏览器信息管理对象
	_this.BrowserIE = {
		"GetHtml": function()
		{
			/*ActiveX的静态加载方式，如果在框架页面中使用此控件，推荐使用静态加截方式。
			<div style="display: none">
			<object id="Paster" classid="clsid:1832A49E-09D5-470E-AA4B-BE8F28034218" codebase="http://www.ncmem.com/products/screencapture/demo/ScreenCapture.cab#version=1,6,26,54978" width="1" height="1"></object>
			</div>
			*/
			var acx = '<div style="display: none">';
			//Word图片粘贴
			acx += ' <object id="objImagePaster" classid="clsid:' + _this.Config["ClsidImagePaster"] + '"';
			acx += ' codebase="' + _this.Config["CabPath"] + '"';
			acx += ' width="1" height="1" ></object>';
			//Word图片上传控件
			acx += ' <object id="objFileUploader" classid="clsid:' + _this.Config["ClsidUploader"] + '"';
			acx += ' codebase="' + _this.Config["CabPath"] + '"';
			acx += ' width="1" height="1" ></object>';
			//Word解析组件
			acx += ' <object id="objWordParser" classid="clsid:' + _this.Config["ClsidParser"] + '"';
			acx += ' codebase="' + _this.Config["CabPath"] + '"';
			acx += ' width="1" height="1" ></object>';
			acx += '</div>';
			return acx;
		}
		, "GetPlugin": function()
		{
			return document.getElementById("objWordPaster");
		}
		, "NeedUpdate": function ()
        {
            var obj = this.GetPlugin();
            var ver = "0";
            try
            {
                ver = obj.Version;
            }
            catch (e) { }
            //return ver == _this.Config["Version"];
            return false;
        } //检查插件是否已安装
		, "Check": function()
		{
			try
			{
				var com = new ActiveXObject(_this.Config["ProjID"]);
				return true;
			}
			catch (e) { return false; }
		}
		, "Init": function()
		{ }
	};
	_this.Browser = _this.BrowserIE;
	//WordParser Control
	_this.WordParserIE =
	{
		"Com": null
		, "Object": null//调用者设置
		, "AddWordImg": null//调用者设置
		, "Init": function()
		{
			this.Com = document.getElementById("objWordParser");
			this.Com.Object = this.Object;
			this.Com.AddWordImg = this.AddWordImg;
		}
		, "Parse": function() { }
		, "IsWord": function()
		{
			return this.Com.IsWord();
		}
		, "IsExcel": function ()
		{
			return this.Com.IsExcel();
		}
		, "GetWord": function()
		{
			return this.Com.GetWord();
		}
		, "GetImages": function()
		{
			return this.Com.GetImages();
		}
		, "GetExcel": function()
		{
			return this.Com.GetExcel();
		}
	};
	_this.WordParserFF =
	{
		"Com": null
		, "Object": null//调用者设置
		, "AddWordImg": null//调用者设置
		, "Init": function()
		{
			this.Com = document.getElementById("objWordPaster");
			this.Com.WordParser_Object = this.Object;
			this.Com.WordParser_AddWordImg = this.AddWordImg;
		}
		, "Parse": function() { }
		, "IsWord": function()
		{
			return this.Com.WordParser_IsWord();
		}
		, "IsExcel": function ()
		{
			return this.Com.WordParser_IsExcel();
		}
		, "GetWord": function()
		{
			return this.Com.WordParser_GetWord();
		}
		, "GetImages": function()
		{
			return this.Com.WordParser_GetImages();
		}
		, "GetExcel": function()
		{
			return this.Com.WordParser_GetExcel();
		}
	};
	_this.ctlWordParser = _this.WordParserIE;
    //ImagePaster Control
    //IE(x86)
	_this.ImagePasterIE = {
		"Com": null
    	, "Object": null//调用者设置
    	, "OnComplete": null//调用者设置
    	, "OnConnected": null//调用者设置
    	, "OnPost": null//调用者设置
    	, "OnStop": null//调用者设置
    	, "OnError": null//调用者设置
    	, "Init": function()
    	{
    		this.Com = document.getElementById("objImagePaster");
    		this.Com.Object = this.Object;
    		this.Com.ImageType = _this.Config["PasteImageType"];
    		this.Com.PostUrl = _this.Config["PostUrl"];
    		this.Com.Licensed = _this.Config["Licensed"];
    		this.Com.EncodeType = _this.Config["EncodeType"];
    		this.Com.SetThumbSize(_this.Config["ThumbWidth"], _this.Config["ThumbHeight"]);
    		//event
    		this.Com.OnConnected = this.OnConnected;
    		this.Com.OnComplete = this.OnComplete;
    		this.Com.OnPost = this.OnPost;
    		this.Com.OnError = this.OnError;
    	}
    	, "ClearFields": function() { this.Com.ClearFields(); }
    	, "AddField": function(fn, fv) { this.Com.AddField(fn, fv); }
    	, "Stop": function() { this.Com.Stop(); }
    	, "Paste": function() { this.Com.Paste(); }
    	, "IsBitmap": function() { return this.Com.IsBitmap(); }
    	, "IsFile": function() { return this.Com.IsFile(); }
    	, "GetFiles": function()
    	{
    		var arr = new Array();
    		var files = this.Com.GetFiles();
    		for (var i = files.lbound(1); i <= files.ubound(1); i++)
    		{
    			arr.push(files.getItem(i));
    		}
    		return arr;
    	}
    	, "GetResponse": function() { return this.Com.Response; }
	};
    //Firefox
	_this.ImagePasterFF = {
		"Com": null
    	, "Object": null//调用者设置
    	, "OnComplete": null//调用者设置
    	, "OnConnected": null//调用者设置
    	, "OnPost": null//调用者设置
    	, "OnStop": null//调用者设置
    	, "OnError": null//调用者设置
    	, "Init": function()
    	{
    		this.Com = document.getElementById("objWordPaster");
    		this.Com.ImgPst_Object = this.Object;
    		this.Com.ImgPst_PostUrl = _this.Config["PostUrl"];
    		this.Com.ImgPst_Licensed = _this.Config["Licensed"];
    		this.Com.ImgPst_EncodeType = _this.Config["EncodeType"];
    		this.Com.ImgPst_ImageType = _this.Config["PasteImageType"];
    		this.Com.ImgPst_SetThumbSize(_this.Config["ThumbWidth"], _this.Config["ThumbHeight"]);
    		//event
    		this.Com.ImgPst_OnComplete = this.OnComplete;
    		this.Com.ImgPst_OnConnected = this.OnConnected;
    		this.Com.ImgPst_OnPost = this.OnPost;
    		this.Com.ImgPst_OnError = this.OnError;
    	}
    	, "ClearFields": function() { this.Com.ImgPst_ClearFiles(); }
    	, "AddField": function(fn, fv) { this.Com.ImgPst_AddField(fn, fv); }
    	, "Stop": function() { this.Com.ImgPst_Stop(); }
    	, "Paste": function() { this.Com.ImgPst_Paste(); }
    	, "IsBitmap": function() { return this.Com.ImgPst_IsBitmap(); }
    	, "IsFile": function() { return this.Com.ImgPst_IsFile(); }
    	, "GetFiles": function() { return this.Com.ImgPst_GetFiles(); }
    	, "GetResponse": function() { return this.Com.ImgPst_Response; }
	};
    _this.ctlImagePaster = _this.ImagePasterIE;
    
	var browserName = navigator.userAgent.toLowerCase();
	this.ie = browserName.indexOf("msie") > 0;
	this.firefox = browserName.indexOf("firefox") > 0;
	this.chrome = browserName.indexOf("chrome") > 0;
	
	if ( this.ie )
	{
		//Win64
		if (window.navigator.platform == "Win64")
		{
			_this.BrowserVer = BrowserVersion.IE64;
			_this.Config["ClsidImagePaster"] = this.Config["ClsidImagePaster64"];
			_this.Config["ClsidUploader"] = this.Config["ClsidUploader64"];
			_this.Config["ClsidParser"] = this.Config["ClsidParser64"];
			_this.Config["CabPath"] = this.Config["CabPath64"];
			//ActiveX
			_this.ActiveX["Uploader"] = this.ActiveX["Uploader64"];
			_this.ActiveX["ImagePaster"] = this.ActiveX["ImagePaster64"];
			_this.ActiveX["WordParser"] = this.ActiveX["WordParser64"];
		}
	}//Firefox
	else if ( this.firefox )
	{
		_this.BrowserVer = BrowserVersion.Firefox;
		_this.Config["CabPath"] = _this.Config["XpiPath"];
		_this.Browser = this.BrowserFF;
		_this.ctlImagePaster = _this.ImagePasterFF;
		_this.ctlWordParser = _this.WordParserFF;
		if (!_this.Browser.Check()) {_this.Browser.Setup();}
	}//chrome
	else if ( this.chrome )
	{
		_this.BrowserVer = BrowserVersion.Chrome;
		_this.Config["CabPath"] = _this.Config["CrxPath"];
		_this.Config["MimeType"] = _this.Config["MimeTypeChr"];
		_this.Browser = this.BrowserChrome;
		_this.ctlImagePaster = _this.ImagePasterFF;
		_this.ctlWordParser = _this.WordParserFF;
		if (!_this.Browser.Check()) {_this.Browser.Setup();}
    }
	
	//初始化路径
	this.InitPath = function()
	{
		this.Config["AppPath"] = this.Config["AppPath"].replace("/", "");
		if (this.Config["AppPath"].length > 0)
		{
			//http://www.ncmem.com/AppPath/
			this.Domain += this.Config["AppPath"] + "/";
		}
		this.Config["CabPath"] = this.Domain + this.Config["CabPath"];
		this.Config["PostUrl"] = this.Domain + this.Config["PostUrl"];
		this.Config["IcoPath"] = this.Domain + this.Config["IcoPath"];
	};
	
	//加载控件及HTML元素
	this.Load = function()
	{
		//Word图片粘贴
		var acx = "";
		/*
			静态加截控件代码，在复杂WEB系统中或者框架页面中请静态方式加截Word解析组件(Xproer.WordParser)。
			<object id="objWordParser" classid="clsid:1832A49E-09D5-470E-AA4B-BE8F28034218"	width="1" height="1" ></object>
		*/
		acx += _this.Browser.GetHtml();
		//
		acx += '<div style="display: none;">';
		
		acx += '<div id="PasterMessager">';
		//acx += '<img id="infIco" alt="进度图标" src="' + this.Config["IcoPath"] + 'upload.gif" /><span>图片上传中...</span><span>10%</span>';
		acx += '<img id="infIco" src="' + this.Config["IcoPath"] + 'upload.gif" /><span>Uploading...</span><span>10%</span>';
		acx += '</div>';

		//文件上传列表项模板
		acx += '<div class="UploaderItem" id="UploaderTemplate">';
		acx += '<div class="UploaderItemLeft">';
		//acx += '<div class="FileName top-space">HttpUploader程序开发.pdf</div>';
		acx += '<div class="FileName top-space">Test.pdf</div>';
		acx += '<div class="ProcessBorder top-space">';
		acx += '<div class="Process"></div>';
		acx += '</div>';
		//acx += '<div class="PostInf top-space">已上传:15.3MB 速度:20KB/S 剩余时间:10:02:00</div>';
		acx += '<div class="PostInf top-space"></div>';
		acx += '</div>';
		acx += '<div class="UploaderItemRight">';
		//acx += '<a class="Btn" href="javascript:void(0)">取消</a>';
		acx += '<a class="Btn" href="javascript:void(0)">' + $text("Qs.WordPaster.UploadDialog.Cancel") + '</a>';
		acx += '<div class="ProcessNum">35%</div>';
		acx += '</div>';
		acx += '</div>'; //template end
		//分隔线
		acx += '<div class="Line" id="FilePostLine"></div>';
		//上传列表
		acx += '<div id="ImageUploadDialog" title="' + $text("Qs.WordPaster.UploadDialog.Title") + '">';
		acx += '<div id="FilePostLister"></div>';
		acx += '</div>';

		//hide div end
		acx += '</div>';

		document.write(acx);
	};
	
	//打开图片上传对话框
	this.OpenUploadFileDialog = function()
	{
		if (!this.UploadDialogCreated)
		{
			var buttons = {};
			buttons[$text("Qs.WordPaster.UploadDialog.Exit")] = function() {
				$(this).dialog("close");
			};
			// 定义图片上传对话框
			$('#ImageUploadDialog').dialog({
				autoOpen: false,
				resizable: false,
				width: 480,
				buttons: buttons
//				buttons: {
//					"退出": function()
//					{
//						$(this).dialog("close");
//					}
//				}
			});
			this.UploadDialogCreated = true;
		}

		$('#ImageUploadDialog').dialog('open');
	};
	this.CloseUploadFileDialog = function()
	{
		$('#ImageUploadDialog').dialog('close');
		this.CompleteClear(); //清空图片缓存
	};
	
	//打开粘贴图片对话框
	this.OpenPasteFileDialog = function()
	{
		if (!this.PasteDialogCreated)
		{
			//图片粘贴上传对话框
			$('#PasterMessager').dialog({
				autoOpen: false,
				resizable: false,
				width: 300,
				height: 200
			});
			this.PasteDialogCreated = true;
		}
		$('#PasterMessager').dialog('open');
	};
	this.ClosePasteFileDialog = function()
	{
		$('#PasterMessager').dialog('close');
	};

	//一般在FCKeditor_OnComplete()中调用
	this.Init = function(edt)
	{		
		_this.WordPaster = new WordPasterManager(this);
		_this.ImagePaster = new ImagePasterManager(this);

		_this.SetEditor(edt);
		_this.ImagePaster.Init();
		_this.LoadPasteEvent(edt);
	};

	//在FCKeditor_OnComplete()中调用
	_this.SetEditor = function(edt)
	{
		_this.Editor = edt;
		_this.WordPaster.Editor = edt;
		_this.ImagePaster.Editor = edt;
	};

	//单击按钮粘贴
	_this.Paste = function (evt)
	{
		//上传WORD图片
		if (_this.ctlWordParser.IsWord())
		{
			evt.cancel(); //取消系统处理
			_this.WordPaster.PasteWord();
		}
		else if (_this.ctlWordParser.IsExcel())
		{
			evt.cancel(); //取消系统处理
			_this.WordPaster.PasteExcel();
		}//粘贴图片文件，剪帖板文件
		else if (_this.ImagePaster.IsBitmap())
		{
			//空闲
			if (!_this.ImagePaster.IsPosting())
			{
				evt.cancel(); //取消系统处理
				_this.ImagePaster.Paste();
			}
		} //是图片文件
		else if (_this.ImagePaster.IsFile())
		{
			evt.cancel(); //取消系统处理
			_this.ImagePaster.PasteFiles();
		}
	};
	
	//粘贴EXCEL
	this.PasteExcel = function()
	{
		if (_this.ctlWordParser.IsExcel())
		{
			_this.WordPaster.PasteExcel();
		}
	};
	
	//手动粘贴
	_this.PasteManual = function ()
	{
		//上传WORD图片
		if (_this.ctlWordParser.IsWord())
		{
			_this.WordPaster.PasteWord();
		}
		else if (_this.ctlWordParser.IsExcel())
		{
			_this.WordPaster.PasteExcel();
		} //粘贴图片文件，剪帖板文件
		else if (_this.ImagePaster.IsBitmap())
		{
			//空闲
			if (!_this.ImagePaster.IsPosting())
			{
				_this.ImagePaster.Paste();
			}
		} //是图片文件
		else if (_this.ImagePaster.IsFile())
		{
			_this.ImagePaster.PasteFiles();
		} //普通文本
		else
		{
			_this.Editor.execCommand('paste');
		}
	};

	//加载粘贴事件	
	this.LoadPasteEvent = function(edt)
	{
		edt.on('paste', function(evt)
		{
			_this.Paste(evt);
		});
	};
}