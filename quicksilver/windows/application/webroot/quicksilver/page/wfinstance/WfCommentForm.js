var WfCommentForm =
{
};

SimpleForm.formJson =
{
	title: [
	    {
			name	: "FEndTime",
			title	: $fieldTitle("Wf.WorkItem", "FEndTime"),
			control	: "DateBox",
			format	: "yyyy-MM-dd HH:mm"
	    },
	    {
			name	: "FName",
			title	: $fieldTitle("Wf.WorkItem", "FName"),
			control	: "InputBox"
	    },
	    {
			name	: "FParticipantName",
			title	: $fieldTitle("Wf.WorkItem", "FParticipantName"),
			control	: "InputBox"
	    },
	    {
			name	: "FResult",
			title	: $fieldTitle("Wf.WorkItem", "FResult"),
			control	: "InputBox"
	    },
	    {
			name	: "FComment",
			title	: $fieldTitle("Wf.WorkItem", "FComment"),
			control	: "TextBox",
			rowSpan	: 9,
			colSpan	: 0
	    }
    ],
	data:clientData.urlArgs.data
};
