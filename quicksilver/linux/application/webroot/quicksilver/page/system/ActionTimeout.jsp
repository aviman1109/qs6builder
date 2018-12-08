<%@page import="com.jeedsoft.common.basic.util.*"%>

{
	"message"	: "<%=StringUtil.escapeJs((String)request.getAttribute("reason"))%>"
}
