*** fix fortify issue
* FusionCharts.js
@ Dynamic Code Evaluation: Code injection [line 139]
solution: remove the following codes, since the codes are olny for the previous browsers.
if(typeof JSON.parse!=="function")JSON.parse=function(a,b){ ... }