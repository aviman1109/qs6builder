var PageLoader = 
{
	map: {},
	
	load: function(pageCode, scripts)
	{
		if (map[pageCode] == null) {
			map[pageCode] = scripts;
		}
		for (var i = 0; i < scripts.length; ++i) {
			var script = scripts[i];
			var head = document.getElementsByTagName('head')[0]; 
			var elem = document.createElement("script"); 
			elem.type = "text/javascript"; 
			elem.src = script; 
			head.appendChild(elem); 			
		}
	},

	loadScript: function(script)
	{
		var head = document.getElementsByTagName('head')[0]; 
		var elem = document.createElement("script"); 
		elem.type = "text/javascript"; 
		elem.src = script; 
		head.appendChild(elem); 			
	},

	loadScriptSource: function(source)
	{
		var head = document.getElementsByTagName('head')[0]; 
		var elem = document.createElement("script"); 
		elem.type = "text/javascript"; 
		elem.text = source; 
		head.appendChild(elem); 			
	},

	unloadScript: function(script)
	{
		var elems = document.getElementsByTagName("script");
		for (var i = elems.length - 1; i >= 0; --i) {
			var elem = elems[i];
			if (elem.src == script || elem.src.indexOf("/" + script) == elem.src.length - script.length - 1) {
				elem.parentNode.removeChild(elem);
			}
		}
	}
};
