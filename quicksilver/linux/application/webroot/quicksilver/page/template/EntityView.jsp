<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<%@page import="org.json.*"%>
<%@page import="com.jeedsoft.quicksilver.layout.type.*"%>
<%@page import="com.jeedsoft.quicksilver.application.taglib.util.*"%>

<%!
	@SuppressWarnings("unchecked")
	private String getHtml(Object handlers) throws Exception
	{
		StringBuilder sb = new StringBuilder();
		for (ViewItemHandler handler: (List<ViewItemHandler>)handlers) {
			if (!handler.isVisible()) {
				continue;
			}
			JSONObject block	= handler.getBlockInfo();
			JSONObject title	= handler.getTitle();
			JSONArray buttons	= handler.getButtons();
			String contentClass	= handler.getContentClass();
			String contentHtml	= handler.getContentHtml();
			boolean hasHeader	= title != null || buttons.length() > 0;
			boolean collpased	= block.optBoolean("collapsed");
			JsonUtil.put(block, "hasContent", !StringUtil.isEmpty(contentHtml));
			sb.append("<script>EntityView.generateBlockStartTag(").append(block).append(")</script>\n");
			if (hasHeader) {
				sb.append("<script>EntityView.generateBlockHeader(");
				sb.append(title).append(", ");
				sb.append(buttons).append(", ");
				sb.append("'").append(block.opt("type")).append("', ");
				sb.append(collpased);
				sb.append(")</script>\n");
			}
			sb.append("<div class='").append(contentClass).append("'");
			sb.append(" id='").append(block.opt("itemId")).append("-BlockContent'");
			if (collpased) {
				sb.append(" style='display:none'");
			}
			sb.append(">\n");
			if (StringUtil.isEmpty(contentHtml)) {
				sb.append("<script>");
				sb.append("EntityView.generateEmptyMessage('").append(block.opt("type")).append("')");
				sb.append("</script>\n");
			}
			else {
				sb.append(contentHtml).append("\n");
			}
			sb.append("</div>\n");
			sb.append("<script>EntityView.generateBlockEndTag()</script>\n\n");
		}
		return sb.toString();
	}
	
	@SuppressWarnings("unchecked")
	private String getScriptsHtml(ServletContext sc, Object handlers) throws Exception
	{
		StringBuilder sb = new StringBuilder();
		Set<String> scripts = new HashSet<String>();
		for (ViewItemHandler handler: (List<ViewItemHandler>)handlers) {
			if (handler.getImportScripts() != null) {
				for (String script: handler.getImportScripts()) {
					if (!scripts.contains(script)) {
						scripts.add(script);
						if (script.endsWith(".css")) {
							sb.append(ScriptHasher.getCssHtml(sc, script)).append("\n\t\t");
						}
						else {
							sb.append(ScriptHasher.getScriptHtml(sc, script)).append("\n\t\t");
						}
					}
				}
			}
		}
		return sb.toString().trim();
	}
%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/template/EntityView.js"/>
		<c:css src="quicksilver/page/template/EntityView.css"/>
		<%=getScriptsHtml(pageContext.getServletContext(), result.getServerValue("handlers"))%>
	</c:head>
	<body onload="EntityView.doLoad()">
		<%=getHtml(result.getServerValue("handlers"))%>
	</body>
</c:html>
