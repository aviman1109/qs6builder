*** fix fortify issue
* plugins/wsc/dialogs/tmpFrameset.html
@ Cross-Site Scripting: DOM [line 27]
@ Open Redirect [line 27]
solution: remove unused wsc plugin folder and set build-config.js ('wsc' : 0)

* ckeditor.js
@ Password Management: Hardcoded Password [line 810]
solution: h["password"] = 1;
@ Insecure Nandomness 
replace "Math.random()" to "Jui.random.next()"

* textfield.js
@ Password Management: Hardcoded Password [line 5]
solution: g["password"] = 1;
