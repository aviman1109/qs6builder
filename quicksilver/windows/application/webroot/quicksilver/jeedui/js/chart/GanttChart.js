Jui.chart.GanttChart=new Jui.Class(Jui.Control);
Jui.chart.GanttChart.getHtml=function(c,d,b){c=c||{};
var a="<div"+Jui.$p({"class":"JuiGanttChart",id:d,style:c.style})+" unselectable=on onselectstart='return false'></div>";
return a;
};
Jui.chart.GanttChart.initialize=function(c,b,a){b=b||{};
a=a||this;
var d=this.superClass.initialize(c,b,a);
d._maxColumnCount=b._maxColumnCount||36;
d._nameWidth=b._nameWidth||100;
d._nameTitle=b._nameTitle||"阶段";
b=b||{};
return d;
};
Jui.chart.GanttChart.prototype.clear=function(a){this.element.innerHTML="";
};
Jui.chart.GanttChart.prototype.load=function(v){v=v||{};
var o=Jui.util.clone(v.items);
if(o==null||o.length==0){this.clear();
return;
}var x=this._getRangeAndStep(o);
var h=[];
var g=[];
var b=x.step==1?30:360;
var a=x.step==1?1:x.step<=30?30:0;
var A=null;
var w=null;
var s=0;
var q=0;
for(var u=0;
u<x.columnCount;
++u){var B=new Date(x.mRange1+u*x.step*86400000);
var n=x.step==1?B.getFullYear():Math.floor((x.iRange1+u*x.step)/360);
var r=x.step==1?B.getMonth():Math.floor((x.iRange1+u*x.step)/30)%12;
var l=b==360?n:Jui.util.cast(new Date(n,r,1),"yyyy-MM");
var k=a==1?B.getDate():a==30?r+1:null;
if(A!=l){if(A!=null){h.push("<td colspan="+s+">"+A+"</td>");
}A=l;
s=0;
}if(w!=k){if(w!=null){g.push("<td colspan="+q+">"+w+"</td>");
}w=k;
q=0;
}++s;
++q;
}h.push("<td colspan="+s+">"+A+"</td>");
g.push("<td colspan="+q+">"+w+"</td>");
var f=[];
var c=[];
var p=a==0?1:2;
f.push("<table class=JuiGanttChartTable>");
f.push("<col width="+this._nameWidth+">");
f.push("<tr class=JuiGanttChartHeadRow>");
f.push("<td rowspan="+p+">"+this._nameTitle+"</td>");
f.push(h.join(""));
f.push("</tr>");
if(a!=0){f.push("<tr class=JuiGanttChartHeadRow>");
f.push(g.join(""));
f.push("</tr>");
}c.push("<div class=JuiGanttChartBarPane style='top:"+p*30+"px;left:"+this._nameWidth+"px'>");
for(var u=0;
u<o.length;
++u){var z=o[u];
f.push("<tr>");
f.push("<td class=JuiGanttChartNameCell>"+z.name+"</td>");
for(var t=0;
t<x.columnCount;
++t){f.push("<td></td>");
}f.push("</tr>");
for(var t=0;
t<z.dates.length;
++t){var e=z.dates[t];
c.push("<div class=JuiGanttChartBar style='");
c.push("left:"+this._getHorzPosition(e[0],true,x)+"%;");
c.push("right:"+(100-this._getHorzPosition(e[1],false,x))+"%;");
c.push("top:"+100*(u+0.2)/o.length+"%;");
c.push("height:"+60/o.length+"%;");
c.push("'></div>");
if(e.length>=4){c.push("<div class=JuiGanttChartInnerBar style='");
c.push("left:"+this._getHorzPosition(e[2],true,x)+"%;");
c.push("right:"+(100-this._getHorzPosition(e[3],false,x))+"%;");
c.push("top:"+100*(u+0.35)/o.length+"%;");
c.push("height:"+30/o.length+"%;");
c.push("'></div>");
}}}f.push("</table>");
c.push("</div>");
this.element.innerHTML=f.join("")+c.join("");
};
Jui.chart.GanttChart.prototype._intToDate=function(a){return new Date(Math.floor(a/360),Math.floor(a/30)%12,a%30+1);
};
Jui.chart.GanttChart.prototype._dateToInt=function(a){return a.getFullYear()*360+a.getMonth()*30+Math.min(29,a.getDate()-1);
};
Jui.chart.GanttChart.prototype._getRangeAndStep=function(r){var o=null;
var n=null;
for(var w=0;
w<r.length;
++w){var x=r[w];
x.dates=r.dates||[x.date];
for(var u=0,f=x.dates;
u<f.length;
++u){for(var t=0;
t<f[u].length;
++t){var y=Jui.util.cast(f[u][t],"date");
f[u][t]=y;
o=o==null||y<o?y:o;
n=n==null||y>n?y:n;
}}}var b=this._dateToInt(o);
var a=this._dateToInt(n);
var s=[1,5,10,15,30,60,90,120,180,360];
var h=s.length-1;
for(var w=0;
w<s.length;
++w){if(Math.floor(a/s[w])-Math.floor(b/s[w])<this._maxColumnCount){h=w;
break;
}}var g=s[h];
var v=g;
for(var w=h+1;
w<s.length;
++w){if(s[w]%g==0){v=s[w];
break;
}}var e=g<30?30:360;
var m=(Math.floor(b/e)+1)*e-v;
var l=Math.floor(a/e)*e+v;
var d=Math.min(m,g*Math.floor(b/g));
var c=Math.max(l,g*(Math.floor(a/g)+1));
var q=this._intToDate(d);
var p=this._intToDate(c);
var z=g>1?(c-d)/g:(p.getTime()-q.getTime())/86400000;
return{iRange1:d,iRange2:c,dRange1:q,dRange2:p,mRange1:q.getTime(),mRange2:p.getTime(),step:g,columnCount:z};
};
Jui.chart.GanttChart.prototype._getHorzPosition=function(d,a,c){if(!a){d=new Date(d.getTime()+86400000);
}if(c.step==1){return 100*(d.getTime()-c.mRange1)/(c.mRange2-c.mRange1);
}var f=this._dateToInt(new Date(d));
var g=c.step<=30?30:360;
var e=g*Math.floor(f/g)+(g-c.step);
var b=c.iRange2-c.iRange1;
if(f<=e){return 100*(f-c.iRange1)/b;
}var i=this._intToDate(e).getTime();
var h=this._intToDate(e+c.step).getTime();
return 100*(e-c.iRange1+c.step*(d.getTime()-i)/(h-i))/b;
};
