Utility.defineScript("Wf.Process.MobileDetail",
{
	ondata: function(data)
	{
		var titleFields = [
		    {control:"InputBox",	name:"FName"},
		    {control:"DateBox",		name:"FEndTime", isNewRow:true},
		    {control:"InputBox",	name:"FParticipantName"},
		    {control:"InputBox",	name:"FResult"},
		    {control:"InputBox",	name:"FComment"}
		];
		var body = Jui.basic.Page.getBody(this);
		var list = Jui.option.List.create({
			target: body
		});
		list.loadTitle({icon:"quicksilver/image/unit/WorkItem-64.png", fields:titleFields});
		list.loadData(data.listData);
	}
});
