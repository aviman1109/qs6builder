var Timeout = 
{
	doLoad: function()
	{
		window._ignoreError = true;
		window.setTimeout(Timeout.timeoutHandler, 3000);
	},

	timeoutHandler: function()
	{
		Utility.navigate(".?jumpCode=SessionInvalid", null, window.top);
	}
};