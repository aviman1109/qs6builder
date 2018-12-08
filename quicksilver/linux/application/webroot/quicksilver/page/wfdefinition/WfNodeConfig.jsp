<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<%
	String type = result.getClientString("type"); 
%>

<c:html>
	<c:head import="TabStrip,Form,List">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfdefinition/WfNodeConfig.js"/>
		<c:css src="quicksilver/page/wfdefinition/WfNodeConfig.css"/>
	</c:head>
	<c:body onload="WfNodeConfig.doLoad()">
		<div id="BasicBody"></div>
		<% if (type.equals("Manual")) { %> 
			<div id="PageBody">
				<div id="PageFormPanel"></div>
				<div id="PageButtonPanel" class="QsRightButtonPanel"></div>
				<div id="ButtonListPanel"></div>
			</div>
			<div id="ParticipantBody">
				<div class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="ListRadio" name="ParticipantSource" value="List"/>
						<label for="ListRadio"><%=text("Wf.ParticipantSource.List")%></label>
					</div>
					<div id="ParticipantButtonCell" class="QsRightButtonPanel"></div>
				</div>
				<div id="ParticipantListRow"></div>
				<div class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="InitiatorRadio" name="ParticipantSource" value="Initiator"/>
						<label for="InitiatorRadio"><%=text("Wf.ParticipantSource.Initiator")%></label>
					</div>
				</div>
				<div id="ExecutorBoxRow" class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="ExecutorRadio" name="ParticipantSource" value="Executor"/>
						<label for="ExecutorRadio"><%=text("Wf.ParticipantSource.Executor")%></label>
					</div>
				</div>
				<div id="FieldBoxRow" class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="FieldRadio" name="ParticipantSource" value="Field"/>
						<label for="FieldRadio"><%=text("Wf.ParticipantSource.Field")%></label>
					</div>
				</div>
				<div id="RelevantDataBoxRow" class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="RelevantDataRadio" name="ParticipantSource" value="RelevantData"/>
						<label for="RelevantDataRadio"><%=text("Wf.ParticipantSource.RelevantData")%></label>
					</div>
				</div>
				<div id="JavaClassBoxRow" class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="JavaClassRadio" name="ParticipantSource" value="JavaClass"/>
						<label for="JavaClassRadio"><%=text("Wf.ParticipantSource.JavaClass")%></label>
					</div>
				</div>
				<div id="SqlBoxRow" class="ParticipantRow">
					<div class="RadioAndText">
						<input type="radio" id="SqlRadio" name="ParticipantSource" value="Sql"/>
						<label for="SqlRadio"><%=text("Wf.ParticipantSource.Sql")%></label>
					</div>
				</div>
			</div>
		<% } %>
		<% if (type.equals("Manual") || type.equals("Auto") || type.equals("End")) { %>
			<div id="EventBody" class="ButtonAndListPanel">
				<div id="EventButtonPanel" class="QsRightButtonPanel"></div>
				<div id="EventListPanel"></div>
			</div>
		<% } %>
	</c:body>
</c:html>
