<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	response.setHeader("X-XSS-Protection", "1");
	response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<script>
	location.href = "${Ets.Install.AppName}";
</script>
