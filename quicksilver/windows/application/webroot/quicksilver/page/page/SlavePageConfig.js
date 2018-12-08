var SlavePageConfig =
{
};

DoubleSorter.leftTitle		= $text("Qs.Page.HiddenSlavePage");
DoubleSorter.rightTitle		= $text("Qs.Page.VisibleSlavePage");
DoubleSorter.loadMethod		= "Qs.Page.getSlavePages";
DoubleSorter.saveMethod		= "Qs.Page.setVisibleSlavePages";
DoubleSorter.extraArguments	= {isMobile:clientData.urlArgs.isMobile};
DoubleSorter.allowEmpty		= true;