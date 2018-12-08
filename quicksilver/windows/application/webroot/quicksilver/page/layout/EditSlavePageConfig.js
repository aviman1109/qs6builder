var EditSlavePageConfig =
{
};

DoubleSorter.leftTitle		= $text("Qs.Page.HiddenSlavePage");
DoubleSorter.rightTitle		= $text("Qs.Page.VisibleSlavePage");
DoubleSorter.loadMethod		= "Qs.Edit.getSlavePages";
DoubleSorter.saveMethod		= "Qs.Edit.setVisibleSlavePages";
DoubleSorter.extraArguments	= {isMobile:clientData.urlArgs.isMobile};
DoubleSorter.allowEmpty		= true;