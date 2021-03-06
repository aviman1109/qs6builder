Jui.$define("Jui.option.List",Jui.basic.Control);
Jui.option.List.getHtml=function(b,c,a){b=b||{};
return"<div"+Jui.$p({"class":"JuiList",id:c,style:b.style})+"><div class=JuiListZone0 unselectable onselectstart='return false'><table></table></div><div class=JuiListZone1 unselectable onselectstart='return false'><table></table></div><div class=JuiListZone2 unselectable onselectstart='return false'><table></table></div><div class=JuiListZone3><table></table></div><div class=JuiListBottomZone><table><tr><td class=JuiListTimeCost></td><td class=JuiListShowCount unselectable onselectstart='return false'><label class=JuiLink></label></td><td><div class=JuiListFirstPageButton></div></td><td><div class=JuiListPreviousPageButton></div></td><td><input value=0 class=JuiListPageIndex></td><td class=JuiListPageSplitter>/</td><td class=JuiListPageCount>0</td><td><div class=JuiListNextPageButton></div></td><td><div class=JuiListLastPageButton></div></td></tr></table></div><div class=JuiListBackFormZone></div><div class=JuiListColumnResizeShadow></div><div class=JuiListColumnResizeMask></div><div class=JuiListColumnResizer draggable=true></div></div>";
};
Jui.option.List.initialize=function(e,d,c){d=d||{};
c=c||this;
var f=this.superClass.initialize(e,d,c);
f._editable=Jui.cast.toBool(d.editable,false);
f._showRowNumber=Jui.cast.toBool(d.showRowNumber,true);
f._multiSelect=Jui.cast.toBool(d.multiSelect,true);
f._multiPage=Jui.cast.toBool(d.multiPage,true)&&!f._editable;
f._showZeroValue=Jui.cast.toBool(d.showZeroValue,true);
f._addEmptyTailColumn=Jui.cast.toBool(d.addEmptyTailColumn,false);
f._queryOnSort=Jui.cast.toBool(d.queryOnSort,false);
f._inputBoxEmptyAsNull=Jui.cast.toBool(d.inputBoxEmptyAsNull,false);
f._hScrollable=Jui.cast.toBool(d.hScrollable,Jui.option.List._hScrollable);
f._autoHeight=Jui.cast.toBool(d.autoHeight,false);
f._minVisibleRowCount=d.minVisibleRowCount||3;
f._maxVisibleRowCount=d.maxVisibleRowCount||20;
f._checkColumnTitle=d.checkColumnTitle;
f.setSortable(Jui.cast.toBool(d.sortable,true));
f.onclick=d.onclick;
f.ondoubleclick=d.ondoubleclick;
f.onselect=d.onselect;
f.onquery=d.onquery;
f.oneditrowchange=d.oneditrowchange;
f.boxChangeHandler=d.boxChangeHandler;
f.boxSetFocusHandler=d.boxSetFocusHandler;
f.entityBoxSelectHandler=d.entityBoxSelectHandler;
f.entityBoxViewHandler=d.entityBoxViewHandler;
f.entityBoxBeforeDropHandler=d.entityBoxBeforeDropHandler;
f.entityBoxPopupClickHandler=d.entityBoxPopupClickHandler;
f.multiEntityBoxSelectHandler=d.multiEntityBoxSelectHandler;
f.pictureBoxSelectHandler=d.pictureBoxSelectHandler;
f.pictureBoxViewHandler=d.pictureBoxViewHandler;
f._keyField=null;
f._nameField=null;
f._orderBy=null;
f._editIndex=-1;
f._colCount=0;
f._colInfos={};
f._backForm=Jui.option.BackForm.initialize(e.children[5],{owner:f});
f._pageIndex=1;
f._regions=e.children;
f._tables=e.getElementsByTagName("table");
f._regions[3].onscroll=Jui.option.List.doScroll;
f._columnResizeShadow=e.children[6];
f._columnResizeMask=e.children[7];
f._columnResizer=e.children[8];
f._columnResizer.ondragstart=Jui.option.List.doColumnResizeStart;
f._columnResizer.ondragend=Jui.option.List.doColumnResizeEnd;
var b=e.children[4].firstChild.rows[0].cells;
f._timeCostElem=b[0];
f._showPageCountElem=b[1].firstChild;
f._firstPageButton=b[2].firstChild;
f._previousPageButton=b[3].firstChild;
f._pageIndexElem=b[4].firstChild;
f._pageSplitterElem=b[5];
f._pageCountElem=b[6];
f._nextPageButton=b[7].firstChild;
f._lastPageButton=b[8].firstChild;
f._showPageCountElem.innerHTML=Jui.i18n.getText(f._showPageCount?"Jui.List.HidePageCount":"Jui.List.ShowPageCount");
f._showPageCountElem.onclick=Jui.option.List.doShowPageCountClick;
f._pageIndexElem.onkeydown=Jui.option.List.doPageIndexKeyDown;
f._firstPageButton.onclick=Jui.option.List.doPageButtonClick;
f._previousPageButton.onclick=Jui.option.List.doPageButtonClick;
f._nextPageButton.onclick=Jui.option.List.doPageButtonClick;
f._lastPageButton.onclick=Jui.option.List.doPageButtonClick;
var a=(f._showRowNumber?1:0)+(f._multiSelect?1:0);
if(a>0){e.setAttribute("fixedColumns",a==1?"one":"two");
}if(f._multiPage){e.setAttribute("MultiPage",true);
}if(d.border=="all"){e.setAttribute("Border",true);
}else{if(d.border=="top"){e.setAttribute("TopBorder",true);
}}f.setPageJumpEnabled(Jui.cast.toBool(d.pageJumpEnabled,true));
f.setShowPageCount(Jui.cast.toBool(d.showPageCount,false));
f.setShowPageCountVisible(Jui.cast.toBool(d.showPageCountVisible,true));
f._refreshPageButtons(false,false);
Jui.event.attach(window,"resize",function(){f.adjust();
});
return f;
};
Jui.option.List.setHScrollable=function(a){Jui.option.List._hScrollable=Jui.cast.toBool(a);
};
Jui.option.List.prototype.length=function(){return this._tables[2].rows.length;
};
Jui.option.List.prototype.clear=function(){this._setRowsHtml("","");
};
Jui.option.List.prototype.setSortable=function(a){this._sortable=Jui.cast.toBool(a,true);
};
Jui.option.List.prototype.getBackForm=function(){return this._backForm;
};
Jui.option.List.prototype.getControl=function(a){return this._backForm.getControl(a);
};
Jui.option.List.prototype.setFieldFocus=function(a){this._backForm.setFieldFocus(a);
};
Jui.option.List.prototype.getSelectedIndices=function(){var c=[];
for(var a=0,b=this._getSelectedRows();
a<b.length;
++a){c.push(b[a].rowIndex);
}return c;
};
Jui.option.List.prototype.deleteEditRow=function(){return this._editIndex!=-1&&this.deleteRowsByIndex([this._editIndex]);
};
Jui.option.List.prototype.deleteSelectedRows=function(){return this.deleteRowsByIndex(this.getSelectedIndices());
};
Jui.option.List.prototype.deleteRowsByKey=function(b){var e=[];
var d=this._getRowMap();
for(var a=0,c=Jui.array.make(b);
a<c.length;
++a){if(c[a] in d){e.push(d[c[a]].rowIndex);
}}return this.deleteRowsByIndex(e);
};
Jui.option.List.prototype.deleteRowsByIndex=function(b){var e=this;
var f=Jui.array.numericSort(Jui.array.make(b));
if(f.length==0){return false;
}for(var d=f.length-1;
d>=0;
--d){var b=f[d];
if(b==e._editIndex&&e._editable){e._endEdit(b);
}e._tables[2].deleteRow(b);
e._tables[3].deleteRow(b);
}if(Jui.array.contains(f,e._editIndex)){var a=e._tables[2].rows.length;
var c=e._editIndex<a?e._editIndex:a-1;
e._editIndex=-1;
e.setEditIndex(c);
}else{e._syncTopCheck();
}e._refreshRowNumber();
e.adjust();
return true;
};
Jui.option.List.prototype.getModifiedRows=function(){var a=[];
for(var b=0,c=this._tables[2].rows;
b<c.length;
++b){if(b==this._editIndex&&this._backForm.isModified()){a.push({index:b,data:this._backForm.getData()});
}else{if(this._isModified(b)){a.push({index:b,data:Jui.util.clone(c[b]._json)});
}}}return a;
};
Jui.option.List.prototype.clearModificationFlag=function(a){if(a==null){for(var b=0,d=this.length();
b<d;
++b){this._setModified(b,false);
}}else{for(var b=0,c=Jui.array.make(a);
b<c.length;
++b){this._setModified(c[b],false);
}}};
Jui.option.List.prototype.getEditIndex=function(){return this._editIndex;
};
Jui.option.List.prototype.setEditIndex=function(a,d){var e=this;
if(!e._editable){return;
}var c=e._tables;
if(e._editIndex!=-1){if(e._editable){if(e._backForm.isModified()){e._setModified(e._editIndex,true);
e._updateRow(e._backForm.getData(),e._editIndex);
}e._endEdit(e._editIndex);
}Jui.dom.removeClass(c[2].rows[e._editIndex],"JuiListEditRow");
Jui.dom.removeClass(c[3].rows[e._editIndex],"JuiListEditRow");
}if(a!=-1){if(e._editable){e._beginEdit(a);
e._backForm.loadData(c[2].rows[a]._json);
}Jui.dom.addClass(c[2].rows[a],"JuiListEditRow");
Jui.dom.addClass(c[3].rows[a],"JuiListEditRow");
}e._editIndex=a;
for(var b=0,f=e.length();
b<f;
++b){e._setSelected(b,b==a);
}e._syncTopCheck();
if(d!=false){e.fireEvent("oneditrowchange");
}};
Jui.option.List.prototype.getEventIndex=function(){var b=Jui.dom.getAncestorByTagName("TR");
var a=Jui.dom.getAncestorByTagName("TABLE",b);
return a==this._tables[2]||a==this._tables[3]?b.rowIndex:-1;
};
Jui.option.List.prototype.getCell=function(b,e){for(var a=0,c=this._tables[2].rows;
a<c.length;
++a){if(c[a]._json[this._keyField]==b){var d=this._colInfos[e];
return this._tables[3].rows[a].cells[d.cell.cellIndex];
}}};
Jui.option.List.prototype.getKeys=function(){var b=[];
for(var a=0,c=this._tables[2].rows;
a<c.length;
++a){b.push(c[a]._json[this._keyField]);
}return b;
};
Jui.option.List.prototype.getSelectedKeys=function(){var b=[];
for(var a=0,c=this._getSelectedRows();
a<c.length;
++a){b.push(c[a]._json[this._keyField]);
}return b;
};
Jui.option.List.prototype.getHoveringKey=function(){for(var a=0,b=this._tables[2].rows;
a<b.length;
++a){var c=b[a];
if(/JuiListMouseRow/.test(c.className)){return c._json[this._keyField];
}}return null;
};
Jui.option.List.prototype.getPairs=function(){var d=[];
for(var b=0,c=this._tables[2].rows;
b<c.length;
++b){var a=this._getRowData(c[b]);
d.push({id:a[this._keyField],name:a[this._nameField]});
}return d;
};
Jui.option.List.prototype.getSelectedPairs=function(){var d=[];
for(var b=0,c=this._getSelectedRows();
b<c.length;
++b){var a=this._getRowData(c[b]);
d.push({id:a[this._keyField],name:a[this._nameField]});
}return d;
};
Jui.option.List.prototype.getFieldTitle=function(a){return this._colInfos[a].cell.innerText;
};
Jui.option.List.prototype.getFieldValues=function(d){var a=[];
for(var b=0,c=this._tables[2].rows;
b<c.length;
++b){a.push(this._getRowData(c[b])[d]);
}return a;
};
Jui.option.List.prototype.sum=function(d){var a=0;
for(var b=0,c=this._tables[2].rows;
b<c.length;
++b){a+=parseFloat(this._getRowData(c[b])[d])||0;
}return a;
};
Jui.option.List.prototype.getEditFieldValue=function(b){var a=this._editIndex;
return a==-1?undefined:this._getRowData(this._tables[2].rows[a])[b];
};
Jui.option.List.prototype.setEditFieldValue=function(c,a,b){this.getControl(c).setValue(a,b);
};
Jui.option.List.prototype.getSelectedFieldValues=function(d){var a=[];
for(var b=0,c=this._getSelectedRows();
b<c.length;
++b){a.push(this._getRowData(c[b])[d]);
}return a;
};
Jui.option.List.prototype.getFieldValueByIndex=function(b,a){return this._getRowData(this._tables[2].rows[a])[b];
};
Jui.option.List.prototype.getData=function(){var c=[];
for(var a=0,b=this._tables[2].rows;
a<b.length;
++a){c.push(Jui.util.clone(this._getRowData(b[a])));
}return c;
};
Jui.option.List.prototype.getValue=Jui.option.List.prototype.getData;
Jui.option.List.prototype.getSelectedData=function(){var c=[];
for(var a=0,b=this._getSelectedRows();
a<b.length;
++a){c.push(Jui.util.clone(this._getRowData(b[a])));
}return c;
};
Jui.option.List.prototype.load=function(a){this.loadTitle(a.title);
this.loadData(a.data);
};
Jui.option.List.prototype.loadTitle=function(m){var g=this;
g._colorConditions=m.colorConditions;
if(g._editIndex!=-1){g._endEdit(g._editIndex);
g._editIndex=-1;
}m=Jui.array.isArray(m)?{fields:m}:m;
g._keyField=m.keyField;
g._nameField=m.nameField;
g._colCount=m.fields.length;
g._colInfos={};
g._keywordFields=Jui.array.toSet(m.keywordFields||[]);
var k=[];
var h=[];
k.push("<table class='JuiListTable JuiListHeadTable'><tr>");
h.push("<table class='JuiListTable JuiListHeadTable'><tr>");
if(g._showRowNumber){k.push("<td class=JuiListHeadRowNumberCell></td>");
}if(g._multiSelect){if(!Jui.string.isEmpty(g._checkColumnTitle)){k.push("<td class=JuiListHeadCheckCell>");
k.push("<span class=JuiListText>"+Jui.$h(g._checkColumnTitle)+"</span>");
}else{k.push("<td class=JuiListHeadCheckCell>");
k.push("<div class=JuiCheck onclick=Jui.option.List.doTopCheckClick()></div>");
}k.push("</td>");
}for(var e=0;
e<g._colCount;
++e){var j=m.fields[e];
var c=j.width==null?Jui.theme["List.DefaultColumnWidth"]:j.width;
h.push("<td style='width:"+c+"px' draggable=true>");
h.push("<span class=JuiListText>"+Jui.$h(j.title)+"</span></td>");
}if(g._addEmptyTailColumn){h.push("<td></td>");
}k.push("</tr></table>");
h.push("</tr></table>");
g._regions[0].innerHTML=k.join("");
g._regions[1].innerHTML=h.join("");
g._tables=g.element.getElementsByTagName("table");
g._tables[1].onclick=Jui.option.List.doTitleClick;
g._tables[1].onmousemove=Jui.option.List.doTitleMouseMove;
g._backForm.clearFields();
g._refreshPageButtons(false,false);
for(var e=0;
e<g._colCount;
++e){var j=m.fields[e];
j.control=j.control||"InputBox";
var f=j.control=="Html"?null:Jui.basic[j.control]||Jui.option[j.control];
var l=g._tables[1].rows[0].cells[e];
l._name=j.name;
var d={cell:l,width:j.width==null?Jui.theme["List.DefaultColumnWidth"]:j.width,align:j.align,controlType:j.control,control:f&&f.create(Jui.object.merge({target:"none",face:"List"+j.control},j)),isNumber:j.type=="int"||j.type=="bigint"||j.type=="double"||j.type=="percent",textField:j.textField,hasLink:(j.control=="EntityBox"||j.control=="PictureBox"||j.type=="email"||j.type=="url")&&j.hasLink!=false,acceptPureText:j.acceptPureText};
g._colInfos[j.name]=d;
if(d.control instanceof Jui.basic.InputBox&&!("emptyAsNull" in j)){d.control.setEmptyAsNull(g._inputBoxEmptyAsNull);
}else{if(d.control instanceof Jui.basic.EntityBox){d.control.onselect=d.control.onselect||g.entityBoxSelectHandler;
d.control.onview=d.control.onview||g.entityBoxViewHandler;
d.control.onpopupclick=d.control.onpopupclick||g.entityBoxPopupClickHandler;
if(!("onbeforedrop" in j)){d.control.onbeforedrop=g.entityBoxBeforeDropHandler;
}}else{if(d.control instanceof Jui.basic.MultiEntityBox){d.control.onselect=g.multiEntityBoxSelectHandler;
}else{if(d.control instanceof Jui.basic.PictureBox){d.control.onselect=g.pictureBoxSelectHandler;
d.control.onview=g.pictureBoxViewHandler;
}}}}if(d.control!=null){d.control.onchange=j.onchange;
if(g.boxChangeHandler!=null){d.control.addEventListener("onchange",g.boxChangeHandler);
}if(g.boxSetFocusHandler!=null){d.control.addEventListener("onsetfocus",g.boxSetFocusHandler);
}g._backForm.$bind(d.control,j);
}}g.loadData([]);
};
Jui.option.List.prototype.loadData=function(b,a){if(b==null){b=[];
}if(Jui.array.isArray(b)){b={pageIndex:1,pageCount:1,totalSize:b.length,records:b};
}this._loadData(b,a);
this.adjust();
};
Jui.option.List.prototype.setValue=Jui.option.List.prototype.loadData;
Jui.option.List.prototype.appendData=function(b){for(var a=0,c=Jui.array.make(b||{});
a<c.length;
++a){this._updateRow(Jui.util.clone(c[a]),this._appendRow());
}this.adjust();
};
Jui.option.List.prototype.appendDataAndEdit=function(c){var h=Jui.array.make(c||{});
var e=this._tables[2].rows;
for(var b=0;
b<h.length;
++b){var d=Jui.util.clone(h[b]);
delete d[this._keyField];
this._updateRow(d,this._appendRow());
this._setModified(e.length-1,true);
}this.adjust();
var a=e.length-h.length;
this.setEditIndex(a);
var g=this._regions[3];
var f=g.scrollHeight-g.clientHeight-1;
if(g.scrollTop<f){g.scrollTop=f;
}};
Jui.option.List.prototype.updateData=function(c,f){var d=this._getRowMap();
for(var b=0,e=Jui.array.make(c);
b<e.length;
++b){var a=e[b][this._keyField];
if(a in d){this._updateRow(Jui.util.clone(e[b]),d[a].rowIndex,true,f);
}}};
Jui.option.List.prototype.updateDataByIndex=function(c,a,f){for(var b=0,d=Jui.array.make(c),e=Jui.array.make(a);
b<e.length;
++b){this._updateRow(Jui.util.clone(d[b]),e[b],true,f);
}};
Jui.option.List.prototype.isShowPageCountVisible=function(){return this._showPageCountElem.style.display!="none";
};
Jui.option.List.prototype.setShowPageCountVisible=function(a){this._showPageCountElem.style.display=Jui.cast.toBool(a,true)?"":"none";
};
Jui.option.List.prototype.isShowPageCount=function(){return this._showPageCount;
};
Jui.option.List.prototype.setShowPageCount=function(a){var b=this;
b._showPageCount=a;
b._showPageCountElem.innerHTML=Jui.i18n.getText(a?"Jui.List.HidePageCount":"Jui.List.ShowPageCount");
b._pageSplitterElem.style.display=a?"":"none";
b._pageCountElem.style.display=a?"":"none";
};
Jui.option.List.prototype.isPageJumpEnabled=function(){return !this._pageIndexElem.readOnly;
};
Jui.option.List.prototype.setPageJumpEnabled=function(a){var b=this;
a=Jui.cast.toBool(a,true);
b._pageIndexElem.readOnly=!a;
b._lastPageButton.style.display=a?"":"none";
};
Jui.option.List.prototype.clearSortFlag=function(){var c=this;
c._orderBy=null;
for(var b=0,a=c._tables[1].rows[0].cells;
b<a.length;
++b){if(/FlagCell/.test(a[b].className)){a[b].className=a[b].className.replace(/(^| ).*FlagCell/,"");
}}};
Jui.option.List.prototype.refresh=function(a){var b={pageIndex:a?1:Math.max(1,this._pageIndex),isRefresh:true};
this._query(b);
};
Jui.option.List.prototype.validate=function(e){var c=this._backForm;
var d=this._tables[2].rows;
var a=this._editIndex;
if(a!=-1&&!c.validate(e)){return false;
}for(var b=0;
b<d.length;
++b){if(b!=a){this.setEditIndex(b);
if(!c.validate(e)){return false;
}}}if(a!=-1){this.setEditIndex(a);
}return true;
};
Jui.option.List.prototype.selectByKey=function(c,b){var f=Jui.array.make(c);
var e=Jui.array.toSet(this._multiSelect?f:f.slice(0,1));
for(var a=0,d=this._tables[2].rows;
a<d.length;
++a){if(d[a]._json[this._keyField] in e){this._setSelected(a,true);
}else{if(!this._multiSelect){this._setSelected(a,false);
}}}if(b){this.fireEvent("onselect");
}};
Jui.option.List.prototype.selectByIndex=function(a,c){var f=Jui.array.make(a);
var e=Jui.array.toSet(this._multiSelect?f:f.slice(0,1));
for(var b=0,d=this.length();
b<d;
++b){if(b in e){this._setSelected(b,true);
}else{if(!this._multiSelect){this._setSelected(b,false);
}}}if(c){this.fireEvent("onselect");
}};
Jui.option.List.prototype.moveUp=function(){var c=this._tables;
for(var b=0,d=this.getSelectedIndices();
b<d.length;
++b){var a=d[b];
if(a>b){Jui.dom.insertElement(c[2].rows[a-1],"BeforeBegin",c[2].rows[a]);
Jui.dom.insertElement(c[3].rows[a-1],"BeforeBegin",c[3].rows[a]);
}}this._refreshRowNumber();
};
Jui.option.List.prototype.moveDown=function(){var c=this._tables;
for(var b=0,e=this.length(),d=this.getSelectedIndices();
b<d.length;
++b){var a=d[d.length-b-1];
if(a<e-b-1){Jui.dom.insertElement(c[2].rows[a+1],"AfterEnd",c[2].rows[a]);
Jui.dom.insertElement(c[3].rows[a+1],"AfterEnd",c[3].rows[a]);
}}this._refreshRowNumber();
};
Jui.option.List.prototype.moveTop=function(){var c=this._tables;
for(var b=0,d=this.getSelectedIndices();
b<d.length;
++b){var a=d[b];
if(a>b){Jui.dom.insertElement(c[2].rows[b],"BeforeBegin",c[2].rows[a]);
Jui.dom.insertElement(c[3].rows[b],"BeforeBegin",c[3].rows[a]);
}}this._refreshRowNumber();
};
Jui.option.List.prototype.moveBottom=function(){var c=this._tables;
for(var b=0,e=this.length(),d=this.getSelectedIndices();
b<d.length;
++b){var a=d[d.length-b-1];
if(a<e-b-1){Jui.dom.insertElement(c[2].rows[e-b-1],"AfterEnd",c[2].rows[a]);
Jui.dom.insertElement(c[3].rows[e-b-1],"AfterEnd",c[3].rows[a]);
}}this._refreshRowNumber();
};
Jui.option.List.prototype.getTotalHeight=function(){return this._regions[0].scrollHeight+this._regions[2].scrollHeight+1;
};
Jui.option.List.prototype.adjust=function(){var s=this;
if(s._autoHeight){var h=s.element.offsetHeight-s.element.clientHeight;
var d=Math.min(s._maxVisibleRowCount,Math.max(s._minVisibleRowCount,s.length()));
var k=(d+1)*Jui.theme["List.RowHeight"]-1+h;
s.element.style.height=k+"px";
}var i=s._tables;
var j=s._regions;
var b=j[3].offsetHeight;
var c=i[3].offsetHeight-1;
var e=j[3].offsetWidth;
var g=0;
for(var a in s._colInfos){g+=s._colInfos[a].width;
}s._columnResizer.style.display="none";
if(e>0&&b>0&&i[1].rows.length>0){var p=Jui.browser.getScrollBarWidth();
var o=g>(c>b?e-p:e)&&s._hScrollable;
var q=c>(o?b-p:b);
j[1].style.overflowY=q?"scroll":"hidden";
j[2].style.overflowX=o&&i[3].rows.length>0?"scroll":"hidden";
j[3].style.overflowX=o?"auto":"hidden";
j[3].style.overflowY=q?"auto":"hidden";
var m=i[1].rows[0].lastChild;
var f=i[3].getElementsByTagName("col");
var l=f[f.length-1];
var n=s._colInfos[m._name];
m.style.width=o?(n==null?0:n.width+"px"):"auto";
l.style.width=o?(n==null?0:n.width+"px"):"auto";
Jui.dom.tagAttribute(s.element,"NoVscroll",!q);
}};
Jui.option.List.doScroll=function(){var a=Jui.$owner();
a._regions[1].scrollLeft=a._regions[3].scrollLeft;
a._regions[2].scrollTop=a._regions[3].scrollTop;
a._columnResizer.style.display="none";
};
Jui.option.List.doTitleClick=function(){var c=Jui.$owner();
if(c._sortable){var a=Jui.dom.getAncestorByTagName("td");
var b=!/Ascend/.test(a.className);
if(a._name in c._colInfos){if(c._queryOnSort){c.clearSortFlag();
a.className=b?"JuiListHeadAscendCell":"JuiListHeadDescendCell";
c._orderBy=[b?a._name:a._name+" desc"];
c.refresh(true);
}else{c._sort(a,b);
}}}};
Jui.option.List.doDataRowMouseOver=function(){var c=this;
var b=Jui.$owner(c);
Jui.dom.addClass(b._tables[2].rows[c.rowIndex],"JuiListMouseRow");
Jui.dom.addClass(b._tables[3].rows[c.rowIndex],"JuiListMouseRow");
if(event.srcElement.tagName=="LABEL"){var a=event.srcElement;
if(a.parentElement.tagName=="SPAN"){a.title=a.offsetWidth>a.parentElement.offsetWidth?a.innerText:"";
}}};
Jui.option.List.doDataRowMouseOut=function(){var b=this;
var a=Jui.$owner(b);
Jui.dom.removeClass(a._tables[2].rows[b.rowIndex],"JuiListMouseRow");
Jui.dom.removeClass(a._tables[3].rows[b.rowIndex],"JuiListMouseRow");
};
Jui.option.List.doDataRowClick=function(){var p=this;
var l=Jui.dom.getAncestorByTagName("TD");
if(l==null){return;
}var j=p.rowIndex;
var o=Jui.dom.getAncestorByTagName("TABLE",p);
var k=Jui.$owner(o);
var a=k._tables[1].rows[0].cells[l.cellIndex]._name;
if(k._editable&&j!=k._editIndex){k.setEditIndex(j);
if(o==k._tables[3]){var g=k._colInfos[a].control;
if(g!=null){g.focus();
}}}var c=event.srcElement;
var h=c.parentElement;
if(c.className=="JuiListLink"||h&&h.className=="JuiListLink"){var g=k._colInfos[a].control;
if(g instanceof Jui.basic.InputBox){if(!k._editable){g.setValue(l.innerText);
}g.fireEvent("onlinkclick");
}else{if(g instanceof Jui.basic.EntityBox||g instanceof Jui.basic.PictureBox){if(!k._editable){var m=k._tables[2].rows[j]._json;
g.setValue(m[a],l.innerText);
}g.fireEvent("onview");
}}}else{for(var f=0,b=k.length();
f<b;
++f){var e=k._isSelected(f);
if(e&&f!=j){k._setSelected(f,false);
}else{if(!e&&f==j){k._setSelected(f,true);
}}}k._syncTopCheck();
var m=k._getRowData(k._tables[2].rows[j]);
var d={index:j,id:m[k._keyField],name:m[k._nameField],data:Jui.util.clone(m)};
k.fireEvent("onclick",d);
k.fireEvent("onselect");
}};
Jui.option.List.doDataRowDoubleClick=function(){var d=this;
var c=Jui.$owner(d);
var b=c._getRowData(c._tables[2].rows[d.rowIndex]);
var a={id:b[c._keyField],name:b[c._nameField],data:Jui.util.clone(b),index:d.rowIndex};
Jui.event.stop();
c.fireEvent("ondoubleclick",a);
};
Jui.option.List.doTopCheckClick=function(){var d=event.srcElement;
var c=Jui.$owner();
var b=!d.hasAttribute("checked");
Jui.dom.tagAttribute(d,"checked",b,"full");
for(var a=0,e=c.length();
a<e;
++a){c._setSelected(a,b);
}c.fireEvent("onselect");
};
Jui.option.List.doCheckClick=function(){var d=Jui.$owner();
var b=Jui.dom.getAncestorByTagName("TR").rowIndex;
Jui.event.stop();
d._setSelected(b,!d._isSelected(b));
d._syncTopCheck();
var c=d._getRowData(d._tables[2].rows[b]);
var a={index:b,id:c[d._keyField],name:c[d._nameField],data:Jui.util.clone(c)};
d.fireEvent("onclick",a);
d.fireEvent("onselect");
};
Jui.option.List.doShowPageCountClick=function(){var a=Jui.$owner();
a.setShowPageCount(!a._showPageCount);
if(a._showPageCount){a.refresh();
}};
Jui.option.List.doPageButtonClick=function(){var c=Jui.$owner();
var b=this;
if(!b.hasAttribute("Forbidden")){var a={pageIndex:1};
if(b==c._previousPageButton){a.pageIndex=c._pageIndex-1;
}else{if(b==c._nextPageButton){a.pageIndex=c._pageIndex+1;
}else{if(b==c._lastPageButton){a.pageIndex=-1;
}}}c._query(a);
}};
Jui.option.List.doPageIndexKeyDown=function(){var b=event.keyCode;
if(b==13){var a={pageIndex:parseInt(this.value)||1};
Jui.$owner()._query(a);
}else{if(b!=8&&b!=9&&(b<48||b>57)){Jui.event.stop();
}}};
Jui.option.List.doTitleMouseMove=function(){var f=Jui.$owner();
var b=event.srcElement;
var c=event.offsetX<3;
var j=event.offsetX>b.offsetWidth-4;
var k=Jui.dom.getAncestorByTagName("td");
var e=k.cellIndex;
var a=f._tables[1].rows[0].cells.length;
if(b.tagName=="TD"&&(c&&e>0||j&&e<a-1)){if(c){k=k.previousSibling;
}var h=f.element.getBoundingClientRect();
var g=k.getBoundingClientRect();
var d=Jui.theme["List.ColumnResizerOffset"];
f._columnResizer.style.left=g.right-h.left-d+"px";
f._columnResizer.style.display="block";
f._columnResizeInfo={cellIndex:k.cellIndex,start:event.clientX};
}else{var l=e<a-1||!f._addEmptyTailColumn;
k.ondragstart=l?Jui.option.List.doTitleMoveStart:null;
k.ondragend=l?Jui.option.List.doTitleMoveEnd:null;
}};
Jui.option.List.doColumnResizeStart=function(){var d=Jui.$owner();
event.dataTransfer.effectAllowed="move";
if(event.dataTransfer.setDragImage){event.dataTransfer.setData("custom","column-resize");
}var a=d._tables[1].rows[0].cells[d._columnResizeInfo.cellIndex];
var c=d.element.getBoundingClientRect();
var b=a.getBoundingClientRect();
d._columnResizeShadow.style.left=b.left-c.left+"px";
d._columnResizeShadow.style.width=a.offsetWidth+"px";
d._columnResizeShadow.style.height=d._regions[0].offsetHeight+d._regions[2].offsetHeight+"px";
d._columnResizeShadow.style.display="block";
d._columnResizeMask.style.display="block";
d._columnResizeInfo.cellWidth=a.offsetWidth;
d._columnResizeInfo.draggerLeft=d._columnResizer.offsetLeft;
d.element.ondragover=Jui.option.List.doColumnResizeDragOver;
d.element.ondrop=Jui.option.List.doColumnResizeDrop;
};
Jui.option.List.doColumnResizeEnd=function(){var a=Jui.$owner();
a._columnResizeShadow.style.display="none";
a._columnResizeMask.style.display="none";
a.element.ondragover=null;
a.element.ondrop=null;
};
Jui.option.List.doColumnResizeDragOver=function(){var c=Jui.$owner();
var d=c._columnResizeInfo;
var b=Jui.theme["List.ClumonResizeMinWidth"];
var a=Math.max(b,d.cellWidth+event.clientX-d.start);
if(a!=d.lastWidth){d.lastWidth=a;
c._columnResizeShadow.style.width=a+"px";
}Jui.event.stop();
};
Jui.option.List.doColumnResizeDrop=function(){var e=Jui.$owner();
var f=e._columnResizeInfo;
var d=Jui.theme["List.ClumonResizeMinWidth"];
var c=Math.max(d,f.cellWidth+event.clientX-f.start);
var a=e._tables[1].rows[0].cells[f.cellIndex];
var b=e._tables[3].getElementsByTagName("col")[f.cellIndex];
a.style.width=c+"px";
b.style.width=c+"px";
e._columnResizer.style.left=f.draggerLeft+c-f.cellWidth+"px";
e._colInfos[a._name].width=c;
e.adjust();
};
Jui.option.List.doTitleMoveStart=function(){var b=Jui.$owner();
event.dataTransfer.effectAllowed="move";
if(event.dataTransfer.setDragImage){event.dataTransfer.setData("custom","column-move");
}var a=Jui.dom.getAncestorByTagName("td");
b._columnMoveInfo={cellIndex:a.cellIndex};
b._tables[1].ondragover=Jui.option.List.doColumnMoveDragOver;
b._tables[1].ondrop=Jui.option.List.doColumnMoveDrop;
};
Jui.option.List.doTitleMoveEnd=function(){var a=Jui.$owner();
a._tables[1].ondragover=null;
a._tables[1].ondrop=null;
};
Jui.option.List.doColumnMoveDragOver=function(){var b=Jui.$owner();
var a=Jui.dom.getAncestorByTagName("td");
var c=b._columnMoveInfo.cellIndex;
if(a.cellIndex!=c&&!(b._addEmptyTailColumn&&a.nextSibling==null)){Jui.event.stop();
}};
Jui.option.List.doColumnMoveDrop=function(){var h=Jui.$owner();
var k=Jui.dom.getAncestorByTagName("td");
var l=h._tables;
var g=h._columnMoveInfo.cellIndex;
var b=k.cellIndex;
var e=l[1].rows[0].cells.length-1;
if(b!=g&&!(h._addEmptyTailColumn&&k.nextSibling==null)){var d=b<g?"BeforeBegin":"AfterEnd";
var j=l[3].getElementsByTagName("col");
if(g==e||b==e){var f=l[1].rows[0].cells[e];
var a=h._colInfos[f._name].width+"px";
f.style.width=a;
j[e].style.width=a;
}Jui.dom.insertElement(k,d,l[1].rows[0].cells[g]);
Jui.dom.insertElement(j[b],d,j[g]);
for(var c=0,m=l[3].rows;
c<m.length;
++c){Jui.dom.insertElement(m[c].cells[b],d,m[c].cells[g]);
}h.adjust();
}};
Jui.option.List._hScrollable=true;
Jui.option.List.prototype._query=function(a){if(this._orderBy!=null){a.order=this._orderBy;
}this.fireEvent("onquery",{arguments:a});
};
Jui.option.List.prototype._getRowData=function(a){if(a.rowIndex==this._editIndex&&this._backForm.isModified()){return Jui.util.clone(this._backForm.getData());
}else{return a._json;
}};
Jui.option.List.prototype._getRowMap=function(){var d={};
for(var b=0,c=this._tables[2].rows;
b<c.length;
++b){var a=c[b]._json[this._keyField];
if(a!=null){d[a]=c[b];
}}return d;
};
Jui.option.List.prototype._getSelectedRows=function(){var c=[];
for(var a=0,b=this.length();
a<b;
++a){if(this._isSelected(a)){c.push(this._tables[2].rows[a]);
}}return c;
};
Jui.option.List.prototype._refreshRowNumber=function(){var b=this;
b._editIndex=-1;
for(var a=0,c=b._tables[2].rows;
a<c.length;
++a){if(b._showRowNumber){c[a].cells[0].innerHTML=a+1;
}if(/Edit/.test(c[a].className)){b._editIndex=a;
}}};
Jui.option.List.prototype._makeCellTextHtml=function(j,a,d){var g=this;
j=Jui.$h(j);
if(d!=null&&d.length>0&&j!=""){var f=j.toLowerCase();
var k=[];
for(var c=0;
c<d.length;
++c){k.push(d[c].toLowerCase());
}var e=g._getKeywordRange(f,k,0);
if(e!=null){var b=[j.substring(0,e.start)];
while(e!=null){b.push("<label class=JuiListTextHighlight>"+j.substring(e.start,e.end)+"</label>");
var h=e.end;
e=g._getKeywordRange(f,k,h);
b.push(j.substring(h,e==null?j.length:e.start));
}j=b.join("");
}}return a?"<label class=JuiListLink>"+j+"</label>":"<label>"+j+"</label>";
};
Jui.option.List.prototype._getKeywordRange=function(g,e,f){var c={start:-1,end:-1};
for(var d=0;
d<e.length;
++d){var b=e[d];
var h=g.indexOf(b,f);
var a=h==-1?-1:h+b.length;
if(h!=-1&&(c.start==-1||h<c.start||h==c.start&&a>c.end)){c={start:h,end:a};
}}return c.start==-1?null:c;
};
Jui.option.List.prototype._setRowsHtml=function(c,a){var b=this;
if(b._editIndex!=-1){b._endEdit(b._editIndex);
}b._regions[2].innerHTML="<table class='JuiListTable JuiListLeftTable'>"+c+"</table>";
b._regions[3].innerHTML="<table class='JuiListTable JuiListDataTable'>"+b._getColumnHtml()+a+"</table>";
b._tables=b.element.getElementsByTagName("table");
b._editIndex=-1;
};
Jui.option.List.prototype._getColumnHtml=function(){var d=this;
var a=[];
for(var c=0,b=d._tables[1].rows[0].cells;
c<b.length;
++c){var e=d._colInfos[b[c]._name];
a.push("<col style='width:"+(e==null?"auto":e.width+"px")+"'>");
}return a.join("");
};
Jui.option.List.prototype._isSelected=function(a){return/Selected/.test(this._tables[2].rows[a].className);
};
Jui.option.List.prototype._setSelected=function(a,b){var d=this;
Jui.dom.tagClass(d._tables[2].rows[a],"JuiListSelectedRow",b);
Jui.dom.tagClass(d._tables[3].rows[a],"JuiListSelectedRow",b);
if(d._multiSelect){var c=d._tables[2].rows[a].lastChild.firstChild;
Jui.dom.tagAttribute(c,"checked",b,"full");
}};
Jui.option.List.prototype._syncTopCheck=function(){var c=this;
if(c._multiSelect){var b=c._tables[0].rows[0].lastChild.firstChild;
var a=c.length()>0&&c.getSelectedIndices().length==c.length();
Jui.dom.tagAttribute(b,"checked",a,"full");
}};
Jui.option.List.prototype._isModified=function(a){return this._tables[2].rows[a]._modified;
};
Jui.option.List.prototype._setModified=function(b,a){this._tables[2].rows[b]._modified=a;
};
Jui.option.List.prototype._refreshPageButtons=function(a,c){var b=this;
Jui.dom.tagAttribute(b._firstPageButton,"Forbidden",!a);
Jui.dom.tagAttribute(b._previousPageButton,"Forbidden",!a);
Jui.dom.tagAttribute(b._nextPageButton,"Forbidden",!c);
Jui.dom.tagAttribute(b._lastPageButton,"Forbidden",!c);
};
Jui.option.List.prototype._beginEdit=function(b){var a=this._tables[1].rows[0].cells;
var e=this._tables[3].rows[b];
for(var c=0;
c<this._colCount;
++c){var d=this._colInfos[a[c]._name].control;
if(d!=null){Jui.dom.insertElement(e.cells[c],"AfterBegin",d.element);
}}};
Jui.option.List.prototype._endEdit=function(){var a=this._tables[1].rows[0].cells;
for(var b=0;
b<this._colCount;
++b){var c=this._colInfos[a[b]._name].control;
if(c!=null){this._backForm.element.appendChild(c.element);
}}};
Jui.option.List.prototype._checkCondition=function(a,b){if(b.operator=="HasData"){return !Jui.string.isEmpty(a);
}else{if(b.operator=="NotHasData"){return Jui.string.isEmpty(a);
}else{if(b.operator=="True"){return !!a;
}else{if(b.operator=="False"){return !a;
}else{if(b.operator=="Equal"){return a==b.value;
}else{if(b.operator=="NotEqual"){return a!=b.value;
}else{if(b.operator=="Great"){return a>b.value;
}else{if(b.operator=="GreatEqual"){return a>=b.value;
}else{if(b.operator=="Less"){return a==null||a<b.value;
}else{if(b.operator=="LessEqual"){return a==null||a<=b.value;
}}}}}}}}}}};
Jui.option.List.prototype._getColor=function(record){var me=this;
if(me._colorConditions==null){return null;
}var map=Jui.util.clone(record);
for(var key in me._colInfos){if(!(key in record)){map[key]=null;
}}for(var i=0;
i<me._colorConditions.length;
++i){var cd=me._colorConditions[i];
var color=cd.color;
if(!Jui.string.isEmpty(cd.expression)){var keySet=Jui.array.toSet(Jui.util.getIdentifiers(cd.expression));
var buffer=[];
for(var key in map){if(key in keySet){var value=map[key];
if(typeof value==="string"){value="'"+Jui.string.replaceForEval(value)+"'";
}buffer.push("var "+key+" = "+value);
}}buffer.push(cd.expression);
var expression=buffer.join(";");
try{if(!eval(expression)){color=null;
continue;
}}catch(e){console.error("Invalid list color expression: "+expression,e);
continue;
}}if(cd.conditions!=null){for(var j=0;
j<cd.conditions.length;
++j){var condition=cd.conditions[j];
if(!this._checkCondition(record[condition.fieldName],condition)){color=null;
break;
}}}if(color!=null){return color;
}}return null;
};
Jui.option.List.prototype._loadData=function(y,k){var E=this;
var D=[];
var B=[];
for(var w=0;
w<y.records.length;
++w){var q=y.records[w];
var C="";
var f=E._getColor(q);
if(f!=null){C=" style='background-color:"+f+"'";
}D.push("<tr"+C+">");
if(E._showRowNumber){D.push("<td class=JuiListRowNumberCell>"+(w+1)+"</td>");
}if(E._multiSelect){D.push("<td class=JuiListCheckCell onclick=Jui.option.List.doCheckClick()>");
D.push("<div class=JuiCheck></div>");
D.push("</td>");
}D.push("</tr>");
B.push("<tr"+C+">");
var g=B.length;
for(var t in E._colInfos){var z=E._colInfos[t];
if(t in q||(z.textField!=null&&z.textField in q)){var h=g+z.cell.cellIndex;
var x="";
if(z.align=="center"||z.align=="right"){x=" style='text-align:"+z.align+"'";
}if(z.controlType=="Html"){B[h]="<td"+x+">"+(q[t]==null?"":q[t])+"</td>";
}else{var m=z.control.toText(q[t],q[z.textField],E._showZeroValue);
var A=t in E._keywordFields?k:null;
var l=E._makeCellTextHtml(m,z.hasLink&&q[t]!=null,A);
B[h]="<td"+x+"><span>"+l+"</span></td>";
}}}for(var v=0,u=E._tables[1].rows[0].cells.length;
v<u;
++v){if(B[g+v]==null){B[g+v]="<td><span></span></td>";
}}B.push("</tr>");
}E._setRowsHtml(D.join(""),B.join(""));
E._regions[1].scrollLeft=0;
E._regions[2].scrollTop=0;
E._regions[3].scrollLeft=0;
E._regions[3].scrollTop=0;
if(y.timeCost==null){E._timeCostElem.innerHTML="";
}else{var o=Jui.cast.toStringWithDigitLength(y.timeCost/1000,2);
E._timeCostElem.innerHTML=Jui.i18n.getText("Jui.List.TimeCost").replace("${0}",o);
}var e=y.hasNextPage;
if(e==null){e=y.pageCount!=null&&y.pageIndex<y.pageCount;
}var c="";
if(y.pageCount!=null){c=y.pageCount+(y.totalSize==null?"":"("+y.totalSize+")");
}E._pageIndex=y.pageIndex;
E._pageIndexElem.value=y.pageIndex;
E._pageCountElem.innerHTML=c;
E._refreshPageButtons(y.pageIndex>1,e);
if(!E._queryOnSort){E.clearSortFlag();
}for(var w=0;
w<y.records.length;
++w){var d=E._tables[2].rows[w];
d._json=y.records[w];
E._initializeRow(d,E._tables[3].rows[w]);
}};
Jui.option.List.prototype._appendRow=function(){var d=this._tables;
var f=d[2].insertRow(-1);
if(this._showRowNumber){var a=f.insertCell(-1);
a.className="JuiListRowNumberCell";
a.innerHTML=d[2].rows.length;
}if(this._multiSelect){a=f.insertCell(-1);
a.className="JuiListCheckCell";
a.onclick=Jui.option.List.doCheckClick;
a.innerHTML="<div class=JuiCheck></div>";
}right=d[3].insertRow(-1);
for(var c=0,b=d[1].rows[0].cells;
c<b.length;
++c){var e=this._colInfos[b[c]._name];
a=right.insertCell(-1);
a.innerHTML="<span></span>";
if(e!=null&&(e.align=="center"||e.align=="right")){a.style.textAlign=e.align;
}}this._initializeRow(f,right);
return f.rowIndex;
};
Jui.option.List.prototype._initializeRow=function(b,a){b.onmouseover=Jui.option.List.doDataRowMouseOver;
b.onmouseout=Jui.option.List.doDataRowMouseOut;
b.onclick=Jui.option.List.doDataRowClick;
b.ondblclick=Jui.option.List.doDataRowDoubleClick;
a.onmouseover=Jui.option.List.doDataRowMouseOver;
a.onmouseout=Jui.option.List.doDataRowMouseOut;
a.onclick=Jui.option.List.doDataRowClick;
a.ondblclick=Jui.option.List.doDataRowDoubleClick;
};
Jui.option.List.prototype._updateRow=function(m,f,d,h){var g=this;
var n=g._tables;
if(f==null&&!Jui.string.isEmpty(m[g._keyField])){for(var e=0,r=n[2].rows;
e<r.length;
++e){if(r[e]._json[g._keyField]==m[g._keyField]){f=e;
break;
}}}var o=n[2].rows[f]._json;
if(Jui.cast.toBool(h,true)){m=Jui.object.merge({},m,o);
}n[2].rows[f]._json=m;
var l=n[3].rows[f].cells;
for(var b in g._colInfos){if(b in m){var c=g._colInfos[b];
var a=c.textField;
if(o==null||m[b]!=o[b]||c.acceptPureText&&m[a]!=o[a]){var j=l[c.cell.cellIndex];
if(c.controlType=="Html"){j.innerHTML=m[b]==null?"":m[b];
}else{if(b in m||c.acceptPureText&&a in m){var k=c.control.toText(m[b],m[a],g._showZeroValue);
j.lastChild.innerHTML=g._makeCellTextHtml(k,c.hasLink&&m[b]!=null);
}}}}}if(g._editIndex==f){g._backForm.updateData(m);
}if(d){g._setModified(f,false);
if(g._editIndex==f){g._backForm.clearModificationFlag();
}}};
Jui.option.List.prototype._sort=function(l,h){var f=this;
var m=f._tables;
var o=f._colInfos[l._name].isNumber;
var g=l.cellIndex;
f.clearSortFlag();
l.className=h?"JuiListHeadAscendCell":"JuiListHeadDescendCell";
var q=[];
var k=m[2].rows;
var e=m[3].rows;
for(var c=0,a=k.length;
c<a;
++c){var p={left:k[a-c-1],right:e[a-c-1]};
Jui.dom.removeElement(p.left);
Jui.dom.removeElement(p.right);
q.push(p);
p.value=q[c].right.cells[g].lastChild.innerText;
if(o){var d=parseFloat(p.value.replace(/\,/g,""));
p.value=isNaN(d)?Number.NEGATIVE_INFINITY:d;
}var b=c;
while(b>0&&f._compare(p.value,q[b-1].value,o,h)){--b;
}if(b!=c){q.splice(b,0,q.splice(c,1)[0]);
}}for(var c=0;
c<q.length;
++c){Jui.dom.insertElement(m[2].tBodies[0],"BeforeEnd",q[c].left);
Jui.dom.insertElement(m[3].tBodies[0],"BeforeEnd",q[c].right);
}f._refreshRowNumber();
};
Jui.option.List.prototype._compare=function(d,c,e,f){return d!=c&&(e&&f==(d<c)||!e&&f==(d.localeCompare(c)<0));
};
