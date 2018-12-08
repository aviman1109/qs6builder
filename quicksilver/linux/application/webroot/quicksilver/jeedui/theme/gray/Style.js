Jui.theme["ListComboBox.PopupOffsetH"]				= 1;

Jui.theme["ListDateBox.PopupOffsetH"]				= 1;
Jui.theme["DateBox.PopupMinWidth"]					= 200;
Jui.theme["MonthDayBox.PopupMinWidth"]				= 200;

Jui.theme["Dialog.MinMargin"]						= 20;
Jui.theme["Dialog.OverlapX"]						= 30;
Jui.theme["Dialog.OverlapY"]						= 24;
Jui.theme["Dialog.PaddingX"]						= 16;
Jui.theme["Dialog.PaddingY"]						= 38;
Jui.theme["Dialog.DefaultWidth"]					= 900;
Jui.theme["Dialog.DefaultHeight"]					= 600;

Jui.theme["HtmlBox.MinHeight"]						= 120;

Jui.theme["Form.CellPadding"]						= 3;
Jui.theme["Form.ColumnSpacing"]						= 16;
Jui.theme["Form.RowHeight"]							= 34;
Jui.theme["Form.AutoShrinkPadding"]					= 8;

Jui.theme["Layout.ModuleDefaultHeight"]				= 120;
Jui.theme["Layout.ModuleAutoScrollMargin"]			= 80;

Jui.theme["List.DefaultColumnWidth"]				= 120;
Jui.theme["List.ColumnResizerOffset"]				= 4;
Jui.theme["List.ColumnResizerMinActive"]			= 20;
Jui.theme["List.ColumnResizerMaxActive"]			= 26;
Jui.theme["List.ClumonResizeMinWidth"]				= 20;
Jui.theme["List.RowHeight"]							= 25;

Jui.theme["ListEntityBox.PopupOffsetH"]				= 1;

Jui.theme["ListInputBox.PopupOffsetH"]				= 1;

Jui.theme["ListMultiCheckComboBox.PopupOffsetH"]	= 1;

Jui.theme["MultiRowTabStrip.TabOverLap"]			= 0;

Jui.theme["OutlookBar.HeadHeight"]					= 27;
Jui.theme["OutlookBar.PaddingTop"]					= 1;

Jui.theme["Popup.Margin"]							= 25;

Jui.theme["Sorter.LevelIndent"]						= 12;
Jui.theme["Sorter.LevelPadding"]					= 2;

Jui.theme["TabStrip.HorzTabOverLap"]				= 0;
Jui.theme["TabStrip.VertTabOverLap"]				= 6;
Jui.theme["TabStrip.CloseIconSize"]					= 17;

Jui.theme["Workflow.ArrowSize"]						= 7;
Jui.theme["Workflow.ArrowAngle"]					= 60 * Math.PI / 180;
Jui.theme["Workflow.GridColor"]						= "#E7E7E7";
Jui.theme["Workflow.GridSize"]						= 32;
Jui.theme["Workflow.LineDraggerWidth"]				= 12;
Jui.theme["Workflow.NodeTextDistance"]				= 6;

document.onreadystatechange = function(){
	if(document.readyState==='complete'){
		var mainFrame = document.querySelector('body.QsDarkBackground');
		//mainFrame Only
		if(mainFrame){
			setTimeout(function(){
			var nail = document.createElement('div'),
				menuZone = document.querySelector('.MenuZone'),
				menuBodyZone = menuZone.querySelectorAll('.JuiTabStripBodyZone')[0],
				menuBody = menuZone.querySelectorAll('.JuiTabStripBody'),
				menuTab = menuZone.querySelectorAll('.JuiTabStripTab'),
				tabZone = document.querySelector('.TabZone'),
				resizer = mainFrame.querySelectorAll('.JuiResizer')[0],
				resizerMask = mainFrame.querySelectorAll('.JuiResizerMask')[0],
				resizerDragger = mainFrame.querySelectorAll('.JuiResizerDragger')[0];
			
			var tabZoneLeftAtMenuHide = '45px',
				menuTabMaxHeight = 1/menuTab.length;
			
				nail.className='nail';
				nail.innerHTML='<div></div>';
				nail.setAttribute('status','active');
				$__insertAfter(resizer, menuBodyZone.childNodes[menuBodyZone.childNodes.length-1]);
				$__insertAfter(resizerMask, menuBodyZone.childNodes[menuBodyZone.childNodes.length-1]);
				$__insertAfter(resizerDragger, menuBodyZone.childNodes[menuBodyZone.childNodes.length-1]);
				//menuTab
				for(var i=0;i<menuTab.length;i++){
					menuTab[i].style.maxHeight = menuTabMaxHeight*100 + '%';
					(function(index){
						menuTab[i].addEventListener('click', function(){
							var _this = this;
							if(_this.getAttribute('status')!='active'){
								var width= parseInt(menuZone.offsetWidth);
								//force all menuBodys to hide by css
								for(var j=0;j<menuBody.length;j++){
									menuBody[j].setAttribute('status','inactive');
									menuTab[j].setAttribute('status','inactive');
								}
								//force the target menuBody to show by css
								menuBody[index].setAttribute('status','active');
								menuTab[index].setAttribute('status','active');
								menuTab[index].appendChild(nail);
								tabZone.style.left=width+'px';
								nail.setAttribute('status','active');
								nail.style.display='block';
								menuBodyZone.style.display='block';
							}else{
							//force all menuBodys to hide by css
								for(var j=0;j<menuBody.length;j++){
									menuBody[j].setAttribute('status','inactive');
									menuTab[j].setAttribute('status','inactive');
								}
								tabZone.style.left=tabZoneLeftAtMenuHide;
								nail.style.display='none';
								menuBodyZone.style.display='none';
							}
						},false);
						/*menuTab[i].addEventListener('mouseover', function(){
							//trigger click event
							var evt = document.createEvent('Events');
							evt.initEvent('click', true, true, window,
							    0, 0, 0, 0, 0, false, false, false, false, 0, null);
							this.dispatchEvent(evt);
						},false);*/
					})(i)
				}
				//tabZone
				/*tabZone.addEventListener('mouseover', function(){
					if(nail.getAttribute('status')=='inactive'){
						for(var i =0;i<menuBody.length;i++){
							menuBody[i].setAttribute('status','inactive');
							menuTab[i].setAttribute('status','inactive');
						}
						this.style.left=tabZoneLeftAtMenuHide;
						nail.style.display='none';
						menuBodyZone.style.display='none';
					}
				},false);*/
				//nail
				nail.addEventListener('click',function(){
					var _this = this;
					if(_this.getAttribute('status')=='active'){
						_this.setAttribute('status', 'inactive');
						resizer.style.display='none';
					}else{
						_this.setAttribute('status', 'active');
						resizer.style.display='block';
					}
				});
				
			},1);
		} 
	}
};
function $__insertAfter(newNode, referenceNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}
