var PageLoader =
{
	_pathToScriptCode: {},
	
	_scriptCodeToScript: {},
	
	defineScript: function(code, script)
	{
		PageLoader._scriptCodeToScript[code] = script;
	},
	
	load: function(page, args)
	{
		args = args || {};
		var scriptPaths = args.scripts || [];
		
		var head = document.getElementsByTagName("head")[0];
		for (var i = 0; i < scriptPaths.length; ++i) {
			var path = scriptPaths[i];
			if (!(path in PageLoader._pathToScriptCode)) {
				var text = PageLoader._getFileText(path);
				var scriptCode = /PageLoader\.defineScript\s*\(\s*["']([^"']+)["']/.test(text) ? RegExp.$1 : null;
				if (scriptCode == null) {
					Jui.basic.Page.getCurrentPage().getBody().innerHTML = path + "<br>" + text;
				}
				var elem = document.createElement("script");
				elem.type = "text/javascript"; 
				elem.text = text;
				head.appendChild(elem);
				head.removeChild(elem);
				elem = null;
				PageLoader._pathToScriptCode[path] = scriptCode;
			}
		}
		
		var object = new PageLoader._PageObject(page);
		for (var i = 0; i < scriptPaths.length; ++i) {
			var path = scriptPaths[i];
			var scriptCode = PageLoader._pathToScriptCode[path];
			var script = PageLoader._scriptCodeToScript[scriptCode];
			if (script != null) {
				for (var key in script) {
					if (key == "onload") {
						object.__onload.push(script[key]);
					}
					else if (key == "ondata") {
						object.__ondata.push(script[key]);
					}
					else if (key == "onunload") {
						object.__onunload.unshift(script[key]);
					}
					else {
						object[key] = script[key];
					}
				}
			}
		}
		
		for (var i = 0; i < object.__onload.length; ++i) {
			object.__onload[i].call(object);
		}
		if (!Jui.string.isEmpty(args.dataUrl)) {
			PageLoader._getData(args.dataUrl, function(data) {
				for (var i = 0; i < object.__ondata.length; ++i) {
					object.__ondata[i].call(object, data);
				}
			});
		}
	},
	
	_getFileText: function(url)
	{
		try {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", url, false);
			xhr.send();
			return xhr.responseText;
		}
		catch (e) {
			alert(e);
		}
	},
	
	_getData: function(url, callback)
	{
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			try {
				var data = JSON.parse(xhr.responseText);
				callback(data);
			}
			catch (e) {
				var body = Jui.basic.Page.getBody(Jui.basic.Page.getCurrentPage());
				body.innerHTML = url + "<br>" + xhr.responseText;
				throw e;
			}
		};
		xhr.onerror = xhr.onabort = xhr.ontimeout = function() {
			alert("error");
		};
		xhr.open("GET", url, true);
		xhr.send();
	},

	_PageObject: function(page)
	{
		this.__page		= page;
		this.__onload	= [];
		this.__ondata	= [];
		this.__onunload	= [];
		this.getPage	= PageLoader._getPage;
	},
	
	_getPage: function()
	{
		return this.__page;
	}
};
