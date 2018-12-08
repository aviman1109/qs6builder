/*
 * This file is deprecated in HTML5. How to send message to third-party page needs
 * more researching.
 * --------------------------------------
 *
 * if third-party page want to accept message from QS's broadcasting, import this
 * file and set the message handler. e.g.:
 * 
 * 	Jui.event.attach(window, "message", function(event) {
 *		var data = event.data;
 *		if (data.action == "showTime") {
 *			document.body.innerHTML = data.args.time;
 *		}
 *	});
 */
/*
(function() {
	if (window != window.top) {
		window.top.postMessage(JSON.stringify({action:"register"}), "*");
		window.addEventListener("onunload", function() {
			window.top.postMessage(JSON.stringify({action:"unregister"}), "*");
		});
	}
})();
*/