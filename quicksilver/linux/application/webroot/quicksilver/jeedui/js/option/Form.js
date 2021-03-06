Jui.$define("Jui.option.Form",Jui.option.BackForm);
Jui.option.Form.getHtml=function(b,c,a){b=b||{};
return"<div"+Jui.$p({"class":"JuiForm",id:c,style:b.style})+"></div>";
};
Jui.option.Form.initialize=function(c,b,a){b=b||{};
a=a||this;
var d=this.superClass.initialize(c,b,a);
d._defaultTabTitle=b.defaultTabTitle;
d._titleWidth=b.titleWidth||118;
d._controlWidth=b.controlWidth;
d._columnCount=b.columnCount;
d._inputBoxEmptyAsNull=Jui.cast.toBool(b.inputBoxEmptyAsNull,false);
d._tabstrip=null;
d._subGroups=[];
d._itemMap={};
d._listButtonMap={};
d.boxChangeHandler=b.boxChangeHandler;
d.autoCompleteHandler=b.autoCompleteHandler;
d.entityBoxSelectHandler=b.entityBoxSelectHandler;
d.entityBoxViewHandler=b.entityBoxViewHandler;
d.entityBoxBeforeDropHandler=b.entityBoxBeforeDropHandler;
d.entityBoxPopupClickHandler=b.entityBoxPopupClickHandler;
d.multiEntityBoxSelectHandler=b.multiEntityBoxSelectHandler;
d.pictureBoxSelectHandler=b.pictureBoxSelectHandler;
d.pictureBoxViewHandler=b.pictureBoxViewHandler;
d.pictureBoxUrlFunction=b.pictureBoxUrlFunction;
c.setAttribute("compact",Jui.cast.toBool(b.compact));
return d;
};
Jui.option.Form.prototype.setColumnCount=function(b){var a=this;
a._columnCount=b;
};
Jui.option.Form.prototype.getTabStrip=function(){return this._tabstrip;
};
Jui.option.Form.prototype.hasTab=function(){return this.element.hasAttribute("HasTab");
};
Jui.option.Form.prototype.getFieldTitle=function(b){var a=this._itemMap[b];
if(a!=null){return a.firstChild.firstChild.innerText;
}};
Jui.option.Form.prototype.setFieldTitle=function(c,b){var a=this._itemMap[c];
if(a!=null){a.firstChild.firstChild.innerHTML=Jui.$h(b);
}};
Jui.option.Form.prototype.setFieldColor=function(c,a){var b=this._itemMap[c];
if(b!=null){b.firstChild.firstChild.style.color=a;
}};
Jui.option.Form.prototype.isFieldRequired=function(b){var a=this._itemMap[b];
return a.hasAttribute("Required")&&!a.hasAttribute("ReadOnly")&&!a._hidden;
};
Jui.option.Form.prototype.setFieldRequired=function(c,b){var a=this._itemMap[c];
if(a!=null){Jui.dom.tagAttribute(a,"Required",Jui.cast.toBool(b,true));
}};
Jui.option.Form.prototype.setFieldDisabled=function(d,b,a){var c=this._itemMap[d];
if(c!=null){b=Jui.cast.toBool(b,true);
Jui.dom.tagAttribute(c,"ReadOnly",b);
Jui.option.BackForm.prototype.setFieldDisabled.call(this,d,b);
if(!b&&a){this.setFieldRequired(d,true);
}}};
Jui.option.Form.prototype.setFieldEnabled=function(c,b,a){this.setFieldDisabled(c,!Jui.cast.toBool(b,true),a);
};
Jui.option.Form.prototype.isFieldVisible=function(b){var a=this._itemMap[b];
return !a._hidden;
};
Jui.option.Form.prototype.setFieldVisible=function(h,a,i){var f=this;
var j=f._itemMap[h];
if(j!=null){var a=Jui.cast.toBool(a,true);
j.style.display=a?"":"none";
j._hidden=!a;
if(a&&i){f.setFieldRequired(h,true);
}if(j._subGroupIndex!=null){var g=f._subGroups[j._subGroupIndex];
var c=false;
for(var d=g.nextSibling;
d!=null&&/JuiFormItem/.test(d.className);
d=d.nextSibling){if(!d._hidden){c=true;
break;
}}var b=g.style.display!="none";
if(c!=b){g.style.display=c?"":"none";
}}}};
Jui.option.Form.prototype.getControlByButton=function(a){var b=a.getArgValue("fieldName");
return this.getControl(b);
};
Jui.option.Form.prototype.load=function(a){this.loadTitle(a.title);
this.loadData(a.data||{});
};
Jui.option.Form.prototype.loadTitle=function(w){var F=this;
var c=Jui.theme["Form.RowHeight"];
var B=Jui.theme["Form.ColumnSpacing"];
var C=F._titleWidth+(F._controlWidth||200)+B;
var q=F._columnCount||Math.max(1,Math.floor(F.element.clientWidth/C));
var x=[];
var D={};
var t=[];
F.clearFields();
for(var v=0,r=w||[];
v<r.length;
++v){var o=r[v-1];
var b=r[v];
var s=r[v+1];
if(o==null||b.group1!=o.group1||b.group2!=o.group2){if(b.group2!=null){t.push("<div class=JuiFormGroup unselectable=on onselectstart='return false'");
if(b.group2Collapse){t.push(" _collapse=true");
}t.push(">");
t.push("<div class=JuiFormGroupLeft>");
t.push("<div class=JuiFormGroupLeftInner></div>");
t.push("</div>");
t.push("<div class=JuiFormGroupMain>");
t.push("<div class=JuiFormGroupMainInner>");
t.push("<div class=JuiFormGroupIcon onclick=Jui.option.Form.doGroupIconClick()></div>");
t.push("<div class=JuiFormGroupText>"+Jui.$h(b.group2)+"</div>");
t.push("</div>");
t.push("<div class=JuiFormGroupMainRight></div>");
t.push("</div>");
t.push("</div>");
}}var g=b.control=="List"?0:(b.rowSpan<=0?1:b.rowSpan);
var k=b.colSpan<=0?q:Math.min(q,b.colSpan||1);
D[b.name]=b;
var h=[];
if(b.control!="CheckBox"){h.push("width:100%");
}if(b.control=="TextBox"||b.control=="HtmlBox"||b.control=="PictureBox"){h.push("height:100%");
}b.style=Jui.$s(h.join(";"),b.style);
var n={};
n.width=(100*k/q)+"%";
n["padding-left"]=(F._titleWidth+B/2)+"px";
if(g>1){n.height=g*c+"px";
}if(b.isNewRow){n.clear="left";
}t.push("<div class=JuiFormItem name='"+b.name+"' style='"+Jui.$s(n)+"'");
if(!Jui.cast.toBool(b.hasTitle,b.control!="Label")){t.push(" NoTitle");
}t.push(">");
t.push("<div class=JuiFormItemTitle style='width:"+F._titleWidth+"px'>");
t.push("<span title='"+Jui.$h(b.hint)+"' style='color:"+(b.color||"")+"'>");
t.push(b.title);
t.push("</span>");
t.push("</div>");
t.push("<div class=JuiFormItemControl>");
t.push((Jui.basic[b.control]||Jui.option[b.control]).getHtml(b));
t.push("</div>");
t.push("</div>");
if(s==null||b.group1!=s.group1){var a=F._controlWidth==null?"100%":q*C+"px";
t.unshift("<div class=JuiFormPanel style='width:"+a+"'>");
t.push("<div style='clear:both'></div>");
t.push("</div>");
x.push({group:b.group1,id:b.groupId1,text:b.group1||F._defaultTabTitle,html:t.join("")});
t=[];
}}var f=[];
Jui.dom.removeAttribute(F.element,"HasTab");
if(x.length==0){F._tabstrip=null;
F.element.innerHTML="<label>"+Jui.i18n.getText("Jui.Form.NoField")+"</label>";
}else{if(x.length==1&&x[0].group==null){F._tabstrip=null;
F.element.innerHTML=x[0].html;
f.push(F.element.firstChild);
}else{Jui.dom.setAttribute(F.element,"HasTab",true);
var d={target:F.element,noIcon:true};
if(F._tabstrip==null){F._tabstrip=Jui.option.TabStrip.create(d);
}F._tabstrip.load(x);
for(var v=0;
v<x.length;
++v){var m=F._tabstrip.getBodyByIndex(v);
m.innerHTML=x[v].html;
f.push(m.firstChild);
}}}F._subGroups=[];
F._itemMap={};
F._listButtonMap={};
for(var v=0;
v<f.length;
++v){var E=null;
for(var u=0,p=f[v].children;
u<p.length;
++u){var z=p[u];
if(/JuiFormGroup/.test(z.className)){F._subGroups.push(z);
E=F._subGroups.length-1;
}else{if(/JuiFormItem/.test(z.className)){z._subGroupIndex=E;
var e=z.getAttribute("name");
var b=D[e];
var l=null;
if(b.control=="List"){l=F._initializeList(z.lastChild.firstChild,b);
}else{var A=Jui.basic[b.control]||Jui.option[b.control];
l=A.initialize(z.lastChild.firstChild,b);
}F._itemMap[e]=z;
F.$bind(l,b);
if(b.required){z.setAttribute("Required",true);
}if(b.disabled){z.setAttribute("ReadOnly",true);
}if(!(l instanceof Jui.option.List)){l.addEventListener("onsetfocus",Jui.option.Form.doBoxSetFocus);
if(F.boxChangeHandler!=null){l.addEventListener("onchange",F.boxChangeHandler);
}}if(l instanceof Jui.basic.InputBox){l.onautocomplete=l.onautocomplete||F.autoCompleteHandler;
if(!("emptyAsNull" in b)){l.setEmptyAsNull(F.inputBoxEmptyAsNull);
}}if(l instanceof Jui.basic.EntityBox){l.onselect=l.onselect||F.entityBoxSelectHandler;
l.onview=l.onview||F.entityBoxViewHandler;
l.onbeforedrop=l.onbeforedrop||F.entityBoxBeforeDropHandler;
l.onpopupclick=l.onpopupclick||F.entityBoxPopupClickHandler;
l.onautocomplete=l.onautocomplete||F.autoCompleteHandler;
}else{if(l instanceof Jui.basic.MultiEntityBox){l.onselect=F.multiEntityBoxSelectHandler;
}else{if(l instanceof Jui.basic.PictureBox){l.onselect=l.onselect||F.pictureBoxSelectHandler;
l.onview=l.onview||F.pictureBoxViewHandler;
if(F.pictureBoxUrlFunction!=null){l.setUrlFunction(F.pictureBoxUrlFunction);
}}}}}}}}var y=Jui.dom.getElementsByClassName(F.element,"JuiFormGroup");
for(var v=0;
v<y.length;
++v){if(y[v].hasAttribute("_collapse")){F._openSubGroup(y[v],false);
}}};
Jui.option.Form.prototype.getData=function(){var a=this;
var b=Jui.option.BackForm.prototype.getData.call(a);
for(var c in a._itemMap){if(!a.isFieldVisible(c)){b[c]=null;
}}return b;
};
Jui.option.Form.prototype.getListButton=function(c,a){var b=this._listButtonMap[c];
return b==null?null:b[a];
};
Jui.option.Form.doGroupIconClick=function(){var b=Jui.dom.getAncestorByClassName("JuiForm")._owner;
var c=Jui.dom.getAncestorByClassName("JuiFormGroup");
var a=c.hasAttribute("Collpased");
b._openSubGroup(c,a);
};
Jui.option.Form.doBoxSetFocus=function(){var f=this;
var e=Jui.dom.getAncestorByClassName("JuiForm",f.element)._owner;
if(e.hasTab()){var a=Jui.dom.getAncestorByClassName("JuiFormPanel",f.element).parentElement;
var b=e._tabstrip.getIndex();
if(e._tabstrip.getBodyByIndex(b)!=a){for(var c=0,g=e._tabstrip.size();
c<g;
++c){if(e._tabstrip.getBodyByIndex(c)==a){e._tabstrip.setIndex(c);
break;
}}}}var d=Jui.dom.getAncestorByClassName("JuiFormItem",f.element);
while(d!=null&&d.className!="JuiFormGroup"){d=d.previousSibling;
}if(d!=null){e._openSubGroup(d,true);
}};
Jui.option.Form.prototype._openSubGroup=function(c,a){if(a!=!c.hasAttribute("Collpased")){Jui.dom.tagAttribute(c,"Collpased",!a);
for(var b=c.nextSibling;
b!=null&&b.className=="JuiFormItem";
b=b.nextSibling){if(!b._hidden){b.style.display=a?"":"none";
}}}};
Jui.option.Form.prototype._initializeList=function(a,k){var h=this;
var c="<div class=JuiFormListButtonPanel"+(k.disabled?" style='display:none'":"")+"></div>";
var g=Jui.dom.insertHtml(a,"BeforeBegin",c);
if(!Jui.array.isEmpty(k.buttons)){if(h._listButtonMap[k.name]==null){h._listButtonMap[k.name]={};
}for(var b=0;
b<k.buttons.length;
++b){var e=Jui.object.merge({target:g,fieldName:k.name},k.buttons[b]);
var d=Jui.basic.Button.create(e);
d.setForm(h);
if(!Jui.string.isEmpty(e.name)){h._listButtonMap[k.name][e.name]=d;
}}}var j=Jui.object.merge({owner:h,border:"all",autoHeight:true,editable:!k.disabled,multiSelect:!k.disabled,multiPage:false,boxSetFocusHandler:Jui.option.Form.doBoxSetFocus,boxChangeHandler:h.boxChangeHandler,entityBoxSelectHandler:h.entityBoxSelectHandler,entityBoxViewHandler:h.entityBoxViewHandler,entityBoxBeforeDropHandler:h.entityBoxBeforeDropHandler,entityBoxPopupClickHandler:h.entityBoxPopupClickHandler,multiEntityBoxSelectHandler:h.multiEntityBoxSelectHandler,pictureBoxSelectHandler:h.pictureBoxSelectHandler,pictureBoxViewHandler:h.pictureBoxViewHandler},k);
var f=Jui.option.List.initialize(a,j);
f.loadTitle(k.titleJson);
return f;
};
