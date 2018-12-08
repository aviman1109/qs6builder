<%@page import="
	org.apache.commons.fileupload.*,
	com.jeedsoft.quicksilver.base.type.*,
	com.jeedsoft.quicksilver.attachment.*,
	com.jeedsoft.quicksilver.attachment.model.*
"%><%
	ActionContext ac = ActionContext.getThreadInstance();
	ServiceContext sc = ac.getServiceContext();
	FileItem item = ac.getFileItem();
	DiskFileModel diskFile = DiskFileHome.getService().write(sc, item, false);
	String path = diskFile.getPath() + "/" + diskFile.getName();
	out.write("Qs.DiskFile.ViewImageByPath.file?path=" + path);
%>