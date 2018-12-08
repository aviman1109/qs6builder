var Index = 
{
	setElementScrollable: function(element)
	{
		element.setAttribute("scrollable", "true");
		element.addEventListener("touchstart", Index.doTouchStart, false);
		//element.addEventListener("touchmove", Index.doTouchMove, false);
	},

	doTouchStart: function(event)
	{
		var elem = this;
		var startTopScroll = elem.scrollTop;
		if (startTopScroll <= 0) {
			elem.scrollTop = 1;
		}
		if (startTopScroll + elem.offsetHeight >= elem.scrollHeight) {
			elem.scrollTop = elem.scrollHeight - elem.offsetHeight - 1;
		}
	},

	doDocumentTouchMove: function(event)
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("scrollable") == "true") {
				return;
			}
			elem = elem.parentNode;
		}
	    event.preventDefault();
	},

	doTouchMove: function(event)
	{
		//event.stopPropagation();
		var elem = event.target;
		var scrollable = false;
		while (elem != null) {
			if (elem.getAttribute("scrollable") == "true") {
				
			}
			elem = elem.parentNode;
		}
	    if (!scrollable) {
		    event.preventDefault();
	    }
	}
};

document.addEventListener("touchmove", Index.doDocumentTouchMove, false);
