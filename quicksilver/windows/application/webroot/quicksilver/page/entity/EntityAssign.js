var EntityAssign =
{
	doLoad: function()
	{
		EntityAssign.userBox = Jui.basic.EntityBox.create({
			target			: "UserBoxCell",
			entityType		: "Qs.User",
			clearOnDisable	: true,
			style			: "width:100%",
			onselect		: CommonBusiness.doEntityBoxSelect,
			onview			: CommonBusiness.doEntityBoxView,
			onbeforedrop	: CommonBusiness.doEntityBoxBeforeDrop
		});
		var unit = Utility.getUnit(clientData.urlArgs.unitCode);
		EntityAssign.commentBox = Jui.basic.TextBox.create({
			target			: "CommentBoxCell",
			clearOnDisable	: true,
			disabled		: !unit.supportBusinessLog,
			style			: "width:700px;height:180px;"
		});
		EntityAssign.doRadioClick();
	},
	
	doConfirm: function()
	{
		var userId = $elem("SelfRadio").checked ? clientData.userId : EntityAssign.userBox.getValue();
		if (Jui.string.isEmpty(userId)) {
			Jui.message.alert($text("Qs.EntityAssign.SelectUserAlert"));
			return;
		}
		var comment = EntityAssign.commentBox.getValue();
		Utility.closeDialog({FUserId:userId, FComment$:comment});
	},
	
	doRadioClick: function()
	{
		EntityAssign.userBox.setDisabled($elem("SelfRadio").checked);
	}
};
