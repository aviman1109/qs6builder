<%@page import="
	org.apache.commons.fileupload.*,
	com.jeedsoft.common.basic.util.*,
	com.jeedsoft.quicksilver.base.type.*,
	com.jeedsoft.quicksilver.attachment.*,
	com.jeedsoft.quicksilver.attachment.model.*
"%><%
	ActionContext ac = ActionContext.getThreadInstance();
	ServiceContext sc = ac.getServiceContext();
	FileItem item = ac.getFileItem();
	DiskFileModel diskFile = DiskFileHome.getService().write(sc, item, false);
	String path = diskFile.getPath() + "/" + diskFile.getName();
	int funcNum = RequestUtil.getInt(request, "CKEditorFuncNum");
	String url = "Qs.DiskFile.ViewImageByPath.file?path=" + path;
	out.write("<script>window.parent.CKEDITOR.tools.callFunction(" + funcNum + ", '" + url + "', '');</script>");
%>
