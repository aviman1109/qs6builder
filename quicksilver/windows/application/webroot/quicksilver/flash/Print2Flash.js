/*
 * This file is provided by Print2Flash
 * With some minor modification to remove eclipse JavsScript warnings. 
 */

var requiredMajorVersion = 10;
var requiredMinorVersion = 0;
var requiredRevision = 0;

var appVersion=navigator.appVersion.toLowerCase();
var isIE  = (appVersion.indexOf("msie") != -1) ? true : false;
var isWin = (appVersion.indexOf("win") != -1) ? true : false;
var isMac = /mac/.test(appVersion);
var isSafari = /webkit/.test(appVersion);
var isOpera = /opera/.test(appVersion);
var safariVersion = (appVersion.match(/version\/((?:\d|\.)+)/) || [])[1];

function JSGetSwfVer(i)
{
    if (navigator.plugins != null && navigator.plugins.length > 0) {
        if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
            var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
            var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
            descArray = flashDescription.split(" ");
            tempArrayMajor = descArray[2].split(".");
            versionMajor = tempArrayMajor[0];
            versionMinor = tempArrayMajor[1];
            if ( descArray[3] != "" ) tempArrayMinor = descArray[3].split("r"); else tempArrayMinor = descArray[4].split("r");
            versionRevision = tempArrayMinor[1] > 0 ? tempArrayMinor[1] : 0;
            flashVer = versionMajor + "." + versionMinor + "." + versionRevision;
        } else flashVer = -1;
    }
    else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1) flashVer = 4;
    else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1) flashVer = 3;
    else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 2;
    else flashVer = -1;
    return flashVer;
} 
 
function DetectFlashVer(reqMajorVer, reqMinorVer, reqRevision) 
{
    reqVer = parseFloat(reqMajorVer + "." + reqRevision);
    for (var i=25;i>0;i--) {       
        versionStr = JSGetSwfVer(i);              
        if (versionStr == -1) return false;
        else if (versionStr != 0) {
            versionArray      = versionStr.split(".");
            versionMajor      = versionArray[0];
            versionMinor      = versionArray[1];
            versionRevision   = versionArray[2];
            versionString     = versionMajor + "." + versionRevision;   
            versionNum        = parseFloat(versionString);
            if (versionMajor > reqMajorVer && versionNum >= reqVer) return true; else return ((versionNum >= reqVer && versionMinor >= reqMinorVer) ? true : false );    
        }
    }          
    return (reqVer ? false : 0.0);
}
 
function GetDoc(movieName)
{
    var isIE = navigator.appName.indexOf("Microsoft") != -1;
    return (isIE) ? window[movieName] : document[movieName];
}    

var P2FDocs=new Array();

function AddP2FDoc(P2FDoc)
{
    P2FDocs.push(P2FDoc);
}

var oldonmousewheel=document.onmousewheel;

function mousewheel(event)
{
    for (var i=0;i<P2FDocs.length;i++) {
	    if(event.target==P2FDocs[i]) {
		    var delta = 0;
		    if (event.wheelDelta) delta = event.wheelDelta / (isOpera ? 12 : 120);
		        else if (event.detail) delta = -event.detail;
		    if (event.preventDefault) event.preventDefault();
		    try {
		        P2FDocs[i].scrollLine(delta);
		    }
		    catch(e) {
		    }
		    return true;
	    }
	}
	return oldonmousewheel(event);
}
		
if(isMac || isWin && isSafari && safariVersion<"4.0")
{
	if (typeof window.addEventListener != "undefined") window.addEventListener("DOMMouseScroll", mousewheel, false);
	window.onmousewheel = document.onmousewheel = mousewheel;
}	

var Print2Flash = 
{
	writeHtml: function (url)
	{
		var alternateContent = 'This content requires the Adobe Flash Player. It either has not been installed yet or is prohibited by your browser security settings. Either'
	 	+ ' <a href="http://www.macromedia.com/go/getflash/">click here to get Flash</a> or loosen your browser security restrictions';
		if(isIE && isWin) alternateContent += ' and then <a href="javascript:document.location.reload()">Refresh</a> this page';
		alternateContent += '.';
		var name = "Print2FlashDoc";
		if(isIE && isWin) {
	     var oeTags = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'
	     + ' style="width:100%;height:100%" width="100%" height="100%" align="Middle" id="Print2FlashDoc"'
	     + ' codebase="quicksilver/flash/swflash.cab#version=10,0,0,0">'
	     + '<param name="movie" value="'+url+'" /><param name="quality" value="best" />'
	     + '<param name="allowFullScreen" value="true" />'
	     + '<param name="allowScriptAccess" value="sameDomain" />'
	     + '<param name="FlashVars" value="extName=Print2FlashDoc"/>'
	     + alternateContent
	     + '</object>';
	     document.write(oeTags);
	     AddP2FDoc(GetDoc(name));
	   } else if(DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision)) {
	     var oeTags = '<embed src="'+url+'" quality="best"'
	     + ' width="100%" height="100%" align="Middle" name="Print2FlashDoc"'
	     + ' play="true" loop="false" quality="best" allowScriptAccess="sameDomain" allowFullScreen="true" type="application/x-shockwave-flash"'
	     + ' pluginspage="http://www.macromedia.com/go/getflashplayer" '
	     + ' FlashVars="extName=Print2FlashDoc">'
	     + '</embed>';
	     document.write(oeTags);
	     AddP2FDoc(GetDoc(name));
	   } else {
		   return alternateContent;
	   }
	}
};
