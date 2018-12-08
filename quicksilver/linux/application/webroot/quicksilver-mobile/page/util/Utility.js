var Utility =
{
	//-----------------------------------------------------------------------
	// server
	//-----------------------------------------------------------------------
	
	invoke: function(url, args, showAnimation, callback, options)
	{
		options 				= options || {};
		var callbackIsObject	= typeof(callback) == "object" && callback != null;
		var ajax 				= new Utility.Ajax(url, args);
		ajax.showAnimation 		= showAnimation;
		ajax.ignoreError 		= options.ignoreError;
		ajax.onsuccess 			= callbackIsObject ? callback.onsuccess : callback;
		if (callbackIsObject && "onfailure" in callback) {
			ajax.onfailure = callback.onfailure;
		}
		ajax.submit();
		return ajax;
	},

	syncInvoke: function(url, args, callback, options)
	{
		url 	= /\.data($|\?)/.test(url) ? url : url + ".data";
		var xhr = Utility.Ajax._createAndOpenXmlHttpRequest(url, false);
		try {
			xhr.send(JSON.stringify(args || {}));
		}
		catch (e) {
			if (options == null || !options.ignoreError) {
				if (Jui.string.isEmpty(e.message)) {
					Jui.message.alert($text("Qs.Ajax.ErrorWithoutMessage"));
				}
				else {
					Jui.message.alert(Utility.formatText("Qs.Ajax.ErrorWithMessage", e.message));
				}
				Utility.Ajax._logHttpError(xhr.status, url, e.description);
			}
			return;
		}
		var result = Utility.Ajax._parseXmlHttpRequestResponse(xhr);
		if (result.success) {
			if (callback != null) {
				callback(result.json);
			}
			return result.json;
		}
	},

	logToFile: function(level, message)
	{
		var args = {level:level, message:message};
		Utility.invoke("Qs.Misc.WriteLog", args, false, null, {ignoreError:true});
	},

	logToDb: function(level, name, description)
	{
		var args = {level:level, name:name, description:description};
		Utility.invoke("Qs.EventLog.Log", args, false, null, {ignoreError:true});
	},

	//-----------------------------------------------------------------------
	// text resource
	//-----------------------------------------------------------------------

	getText: function(key)
	{
		var value = Utility._textMap[key];
		if (value == null) {
			return key;
		}
		for (var i = 1; i < arguments.length; ++i) {
			var reg = new RegExp("\\$\\{" + (i - 1) + "\\}", "g");
			value = value.replace(reg, arguments[i]);
		}
		return value;
	},

	loadAllTexts: function(map)
	{
		Utility._textMap = map;
	},

	getFieldTitle: function(unitCode, fieldName)
	{
		var key = "fieldTitle." + unitCode.replace(/\./g, "-") + "." + fieldName;
		var value = Utility.getCacheItem(key);
		if (value == null) {
			var ret = Utility.syncInvoke("Qs.Field.getTitle", {unitCode:unitCode, fieldName:fieldName});
			value = ret == null ? unitCode + "." + fieldName : ret.fieldTitle;
			Utility.setCacheItem(key, value);
		}
		return value;
	},

	//-----------------------------------------------------------------------
	// cache
	//-----------------------------------------------------------------------

	getCacheItem: function(key)
	{
		return Utility._cacheManager.getItem(key);
	},

	setCacheItem: function(key, value)
	{
		Utility._cacheManager.setItem(key, value);
	},

	deleteCacheItem: function(key)
	{
		Utility._cacheManager.deleteItem(key);
	},

	getCacheItems: function(keys, prefix)
	{
		return Utility._cacheManager.getItems(keys, prefix);
	},

	setCacheItems: function(keys, values, prefix)
	{
		Utility._cacheManager.setItems(keys, values, prefix);
	},

	clearCache: function()
	{
		Utility._cacheManager.clearCache();
	},

	//-----------------------------------------------------------------------
	// page
	//-----------------------------------------------------------------------

	_pathToScriptCode: {},
	
	_scriptCodeToScript: {},

	_loadedCss: {},

	loadPageMetaData: function(properties, pages)
	{
		Utility._pageMap = {};
		for (var i = 0; i < pages.length; ++i) {
			var array = pages[i];
			var item = {};
			for (var j = 0; j < properties.length; ++j) {
				item[properties[j]] = array[j];
			}
			Utility._pageMap[item.code] = item;
		}
	},

	defineScript: function(scriptCode, script)
	{
		Utility._scriptCodeToScript[scriptCode] = script;
		var parts = scriptCode.split(".");
		var parent = window;
		for (var i = 0; i < parts.length - 1; ++i) {
			var part = parts[i];
			if (parent[part] == null) {
				parent[part] = {};
			}
			parent = parent[part];
		}
		parent[parts[parts.length - 1]] = script;
	},

	openPage: function(pageCode, args, options, callback)
	{
		if (pageCode != null) {
			var page = Utility._pageMap[pageCode];
			if (page == null) {
				options = {title:"Error", errorMessage:"page '" + pageCode + "' not found."};
			}
			else if (Jui.array.isEmpty(page.scripts)) {
				options = {title:"Error", errorMessage:"page '" + pageCode + "' has no script."};
			}
			else {
				options = Jui.object.merge({}, page, options, true);
			}
		}
		//without setTimeout, chrome may throw a TimeoutError(code=23)
		setTimeout(function() {
			Utility._openPage(options, args, callback);
		}, 0);
	},
	
	_openPage: function(options, args, callback)
	{
		var fixecCallback = null;
		if (options != null && options.fullScreen) {
			var pageContainer = $elem("PageContainer");
			if (!/FullScreen/.test(pageContainer.className)) {
				Jui.dom.addClass(pageContainer, "JuiPageContainerFullScreen");
				fixecCallback = function() {
					Jui.dom.removeClass(pageContainer, "JuiPageContainerFullScreen");
				};
			}
		}
		var page = Jui.basic.Page.open(options, callback, fixecCallback);
		Jui.basic.Page.setDataArguments(page, args);
		page.code = options.code;
		page.args = args || {};
		page.__onload	= [];
		page.__ondata	= [];
		page.__onunload	= [];
		var scriptPaths = options.scripts || [];
		var head = document.getElementsByTagName("head")[0];
		for (var i = 0; i < scriptPaths.length; ++i) {
			var path = scriptPaths[i];
			if (/\.css$/.test(path)) {
				if (!(path in Utility._loadedCss)) {
			        var elem = document.createElement("link");  
			        elem.rel = "stylesheet";  
			        elem.type = "text/css";  
			        elem.href = path;  
			        head.appendChild(elem);				
					Utility._loadedCss[path] = 1;
				}
			}
			else {
				var scriptCode = Utility._pathToScriptCode[path];
				if (scriptCode == null) {
					var text = Utility._getFileText(path);
					scriptCode = /Utility\.defineScript\s*\(\s*["']([^"']+)["']/.test(text) ? RegExp.$1 : null;
					if (scriptCode == null) {
						var body = Jui.basic.Page.getBody(Jui.basic.Page.getCurrentPage());
						body.innerHTML = path + "<br>" + text;
						break;
					}
					var elem = document.createElement("script");
					elem.type = "text/javascript"; 
					elem.text = text;
					head.appendChild(elem);
					head.removeChild(elem);
					elem = null;
					Utility._pathToScriptCode[path] = scriptCode;
				}
				var script = Utility._scriptCodeToScript[scriptCode];
				if (script != null) {
					for (var key in script) {
						if (key == "onload") {
							page.__onload.push(script[key]);
						}
						else if (key == "ondata") {
							page.__ondata.push(script[key]);
						}
						else if (key == "onunload") {
							page.__onunload.unshift(script[key]);
						}
						else {
							page[key] = script[key];
						}
					}
				}
			}
		}
		
		if (!Jui.string.isEmpty(options.errorMessage)) {
			var pageBody = Jui.basic.Page.getBody(page);
			pageBody.innerHTML	= "<div style='color:red;text-align:center;padding-top:20px'>"
								+ options.errorMessage
								+ "</div>";
		}
		for (var i = 0; i < page.__onload.length; ++i) {
			page.__onload[i].call(page);
		}
		if (!Jui.string.isEmpty(options.actionMethod)) {
			Utility._getData(options.actionMethod, args, function(data) {
				for (var i = 0; i < page.__ondata.length; ++i) {
					page.__ondata[i].call(page, data);
				}
			});
		}
	},
	
	_setPageTitle: function(title)
	{
		var page = Jui.basic.Page.getCurrentPage();
		Jui.basic.Page.setTitle(page, title);
	},

	//WEB 和 APP 会有所不同
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
	
	_getData: function(actionMethod, args, callback)
	{
		Utility.invoke(actionMethod, args, true, {
			onsuccess: function(json) {
				callback(json);
			},
			onfailure: function(event, result) {
				var message = "Get page data failed. ActionMethod=" + actionMethod;
				if (result != null) {
					message += " message:" + result.errorMessage;
				}
				alert(message);
			}
		});
	}
};

//-----------------------------------------------------------------------
// AJAX
//-----------------------------------------------------------------------

Utility.Ajax = function(url, args)
{
	this.url				= /\.data($|\?)/.test(url) ? url : url + ".data";
	this.args				= args;
	this.showAnimation		= false;
	this.onsuccess			= null;
	this.onfailure			= Utility.Ajax.defaultFailureHandler;
	this.onuploadprogress	= null;
	this._status			= Utility.Ajax.STATUS_NEW;
};

Utility.Ajax.STATUS_NEW		= 0;
Utility.Ajax.STATUS_SENDING = 1;
Utility.Ajax.STATUS_LOAD	= 2;
Utility.Ajax.STATUS_ERROR 	= 3;
Utility.Ajax.STATUS_ABORT 	= 4;
Utility.Ajax.STATUS_TIMEOUT	= 5;

Utility.Ajax.doLoad = function(event)
{
	var ajax = event.target._ajax;
	if (ajax.showAnimation && ajax._pageId != null) {
		Jui.basic.Page.hideWaitingAnimationById(ajax._pageId);
	}
	ajax._finish(event, Utility.Ajax.STATUS_LOAD);
};

Utility.Ajax.doError = function(event)
{
	event.target._ajax._finish(event, Utility.Ajax.STATUS_ERROR);
};

Utility.Ajax.doAbort = function(event)
{
	event.target._ajax._finish(event, Utility.Ajax.STATUS_ABORT);
};

Utility.Ajax.doTimeout = function(event)
{
	event.target._ajax._finish(event, Utility.Ajax.STATUS_TIMEOUT);
};

Utility.Ajax.doLoadEnd = function(event)
{
	event.target._ajax._cleanup();
};

Utility.Ajax.doUploadProgress = function(event)
{
	var xhr = event.target;
	var ajax = xhr._ajax;
	if (ajax.onuploadprogress != null) {
		var ratio = event.lengthComputable ? event.loaded / event.total : null; 
		ajax.onuploadprogress(event, ratio);
	}
};

Utility.Ajax._logHttpError = function(httpStatus, url, message)
{
	var description = "status:" + httpStatus
					+ ", browser:" + Jui.browser.type 
					+ ", url:" + url 
					+ ", message:" + message;
	Utility.logToDb("error", "HTTP failed", description);
};

Utility.Ajax._createAndOpenXmlHttpRequest = function(url, async)
{
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, async);
	xhr.setRequestHeader("Cache-Control", "no-store, no-cache");
	var page = Jui.basic.Page.getCurrentPage();
	if (page != null && page.code != null) {
		xhr.setRequestHeader("Qs-PageCode", page.code);
	}
	return xhr;
};

Utility.Ajax._parseXmlHttpRequestResponse = function(xhr, status)
{
	var result			= {};
	var text 			= xhr.responseText;
	result.success		= false;
	result.httpStatus	= xhr.status;
	if (status == Utility.Ajax.STATUS_ABORT) {
		result.errorMessage = $text("Qs.Ajax.AbortAlert");
		console.warn("AJAX aborted. URL: %s", xhr._ajax.url);
	}
	else if (status == Utility.Ajax.STATUS_TIMEOUT) {
		result.errorMessage = $text("Qs.Ajax.TimeoutAlert");
	}
	else if (xhr.status == 200) {
		try {
			result.json = JSON.parse(text);
			result.success = !result.json._failed;
			if (!result.success) {
				result.errorMessage = result.json.message;
			}
		}
		catch (e) {
			result.errorMessage = Utility.formatText("Qs.Ajax.JsonFormatInvalid", text);
		}
	}
	else {
		if (/<\/html>/.test(text)) {
			result.errorMessage = $text("Qs.Ajax.ErrorWithHtml");
			result.errorHtml = text;
		}
		else if (!Jui.string.isEmpty(text)) {
			result.errorMessage = Utility.formatText("Qs.Ajax.ErrorWithMessage", text);
		}
		else {
			result.errorMessage = $text("Qs.Ajax.ErrorWithoutMessage");
		}
	}
	return result;
};

Utility.Ajax.showError = function(result)
{
	if (result.json != null) {
		alert(result.json);
		console.log(result.json);
	}
	else if (result.errorHtml != null) {
		Jui.message.alert(result.errorHtml); //TODO HTML5 show HTML content
	}
	else if (result.errorMessage != null) {
		Jui.message.alert(result.errorMessage);
	}
},

Utility.Ajax.defaultFailureHandler = function(event)
{
	Utility.Ajax.showError(this.result);
},

Utility.Ajax.prototype = 
{
	submitFile: function(file)
	{
		var data = new FormData();
		data.append("args", JSON.stringify(this.args || {}));
		data.append("file", file);
		this.submit(data);
	},

	submit: function(data)
	{
		var ajax 				= this;
		var xhr 				= Utility.Ajax._createAndOpenXmlHttpRequest(ajax.url, true);
		var page 				= Jui.basic.Page.getCurrentPage();
		ajax._xhr				= xhr;
		ajax._pageId			= page.getId();
		xhr._ajax				= ajax;
		xhr.upload._ajax		= ajax;
		xhr.onload 				= Utility.Ajax.doLoad;
		xhr.onerror 			= Utility.Ajax.doError;
		xhr.onabort 			= Utility.Ajax.doAbort;
		xhr.ontimeout			= Utility.Ajax.doTimeout;
		xhr.upload.onprogress	= Utility.Ajax.doUploadProgress;
		if (ajax.showAnimation) {
			if (page != null) {
				Jui.basic.Page.showWaitingAnimation(page);
			}
		}
		if (data == null) {
			xhr.send(JSON.stringify(this.args || {}));
		}
		else {
			xhr.send(data);
		}
		ajax._status = Utility.Ajax.STATUS_SENDING;
	},

	abort: function()
	{
		this._xhr.abort();
	},
	
	isLoad: function()
	{
		return this._status == Utility.Ajax.STATUS_LOAD;
	},

	isError: function()
	{
		return this._status == Utility.Ajax.STATUS_ERROR;
	},

	isAbort: function()
	{
		return this._status == Utility.Ajax.STATUS_ABORT;
	},

	isTimeout: function()
	{
		return this._status == Utility.Ajax.STATUS_TIMEOUT;
	},
	
	_finish: function(event, status)
	{
		var ajax 		= this;
		var xhr 		= ajax._xhr;
		ajax._status	= status;
		if (ajax._progressBar != null) {
			ajax._progressBar.close();
			ajax._progressBar = null;
		}
		ajax.result = Utility.Ajax._parseXmlHttpRequestResponse(xhr, status);
		if (ajax.result != null && ajax.result.success) {
			if (ajax.onsuccess != null) {
				ajax.onsuccess(ajax.result.json);
			}
		}
		else if (!ajax.ignoreError) {
			try {
				if (ajax.onfailure != null) {
					ajax.onfailure(event, ajax.result);
				}
			}
			finally {
				if (xhr.status != 200) {
					Utility.Ajax._logHttpError(xhr.status, ajax.url, xhr.responseText);
				}
			}
		}
	},
	
	_cleanup: function()
	{
		var ajax			= this;
		var xhr 			= ajax._xhr;
		xhr._ajax			= null;
		ajax._xhr			= null;
		xhr.upload._ajax	= null;
	}
};

//-----------------------------------------------------------------------
// UrlBuilder
//-----------------------------------------------------------------------

Utility.UrlBuilder = function(url)
{
	this.url = url;
};

Utility.UrlBuilder.prototype = 
{
	set: function(key, value)
	{
		this.url = Utility.setUrlParam(this.url, key, value);
		return this;
	},

	remove: function(key)
	{
		this.url = Utility.removeUrlParam(this.url, key);
		return this;
	},

	toString: function()
	{
		return this.url;
	}
};

//-----------------------------------------------------------------------
// cache
//-----------------------------------------------------------------------

Utility.ClientCache = function()
{
	this._map = {};
};

Utility.ClientCache.prototype =
{
	getItem: function(key)
	{
		var keyParts = key.split(".");
		var hash = this._getItemHash(keyParts);
		return hash && hash[keyParts[keyParts.length - 1] + "__"];
	},

	setItem: function(key, value)
	{
		var keyParts = key.split(".");
		var hash = this._getItemHash(keyParts, true);
		hash[keyParts[keyParts.length - 1] + "__"] = value;
	},

	deleteItem: function(key)
	{
		var keyParts = key.split(".");
		var hash = this._getItemHash(keyParts);
		if (hash != null) {
			delete hash[keyParts[keyParts.length - 1] + "__"];
		}
	},

	getItems: function(keys, prefix)
	{
		var ret = [];
		for (var i = 0; i < keys.length; ++i) {
			var key = prefix == null ? keys[i] : prefix + keys[i];
			ret.push(this.getItem(key));
		}
		return ret;
	},

	setItems: function(keys, values, prefix)
	{
		for (var i = 0; i < keys.length; ++i) {
			var key = prefix == null ? keys[i] : prefix + keys[i];
			this.setItem(key, values[i]);
		}
	},

	clear: function()
	{
		this._map = {};
	},

	_getItemHash: function(keyParts, createIfNotExists)
	{
		var hash = this._map;
		for (var i = 0; i < keyParts.length - 1; ++i) {
			var keyPart = keyParts[i];
			if (!(keyPart in hash)) {
				if (createIfNotExists) {
					hash[keyPart] = {};
				}
				else {
					return null;
				}
			}
			hash = hash[keyPart];
		}
		return hash;
	}
};

//-----------------------------------------------------------------------
// alias/shortcuts
//-----------------------------------------------------------------------

var $text = Utility.getText;

var $fieldTitle = Utility.getFieldTitle;

var $elem = function(key)
{
	if (typeof(key) === "object") {
		return key;
	}
	else if (typeof(key) === "string") {
		return document.getElementById(key); 
	}
};

//-----------------------------------------------------------------------
// initialize
//-----------------------------------------------------------------------

(function() {
	Utility._cacheManager = new Utility.ClientCache();
	Jui.i18n.setTextGetter(Utility.getText);
	var scripts 	= document.getElementsByTagName("script");
	var script 		= scripts[scripts.length - 1];
	var language	= /\?language=(.*)/.test(script.src) ? RegExp.$1 : "zh-cn"; //TODO
	var args 		= "{mobile:true,language:\"" + language + "\"}";
	document.write("<script src='Qs.TextResource.GetFullScript.script?args=" + args + "'></script>");
	document.write("<script src='Qs.Page.GetFullScript.script?args=" + args + "'></script>");
	//document.write("<script src='Qs.Unit.GetFullScript.script?args=" + args + "'></script>");
})();
