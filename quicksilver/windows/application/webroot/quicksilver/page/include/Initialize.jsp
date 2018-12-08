<%@page isELIgnored="true"%>
<%@page import="java.util.*"%>
<%@page import="com.jeedsoft.common.basic.util.*"%>
<%@page import="com.jeedsoft.quicksilver.base.type.*"%>
<%@taglib prefix="c" uri="/WEB-INF/taglib/Computer.tld"%>

<%!
	public ActionContext getActionContext()
	{
		return ActionContext.getThreadInstance();
	}

	public ServiceContext getServiceContext()
	{
		return ActionContext.getThreadInstance().getServiceContext();
	}

	public DaoContext getDaoContext()
	{
		return ActionContext.getThreadInstance().getDaoContext();
	}
	
	public String text(String key)
	{
		return com.jeedsoft.quicksilver.i18n.TextResourceHome.getText(key);
	}
	
	public String escapeHtml(String text)
	{
		return StringUtil.escapeHtml(text);
	}

	public String fieldTitle(String unitCode, String fieldName)
	{
		//Use full package and class name, instead of "page import" in this and some following methods. Because
		//"page import" will implicitly add imports to all pages that include Initialize.jsp. This is a kind of
		//pollution. We don't want these classes be imported, except for the commonly used classes in our JSP -
		//java.util.*, com.jeedsoft.common.basic.util.*, com.jeedsoft.quicksilver.base.type.*
		com.jeedsoft.quicksilver.unit.dao.FieldDao fieldDao;
		fieldDao = com.jeedsoft.quicksilver.unit.FieldHome.getDao();
		return fieldDao.getFieldTitle(getDaoContext(), unitCode, fieldName);
	}

	public String unitName(String unitCode)
	{
		com.jeedsoft.quicksilver.unit.dao.UnitDao unitDao;
		unitDao = com.jeedsoft.quicksilver.unit.UnitHome.getDao();
		return unitDao.getItem(getDaoContext(), unitCode).getName();
	}

	public org.json.JSONArray comboBoxItems(java.util.UUID dictId)
	{
		com.jeedsoft.quicksilver.dictionary.service.DictionaryService dictionaryService;
		dictionaryService = com.jeedsoft.quicksilver.dictionary.DictionaryHome.getService();
		return dictionaryService.getComboBoxItemsJson(getServiceContext(), dictId);
	}

	public org.json.JSONArray comboBoxItems(String unitCode, String fieldName)
	{
		com.jeedsoft.quicksilver.unit.dao.UnitDao unitDao;
		com.jeedsoft.quicksilver.unit.dao.FieldDao fieldDao;
		com.jeedsoft.quicksilver.dictionary.service.DictionaryService dictionaryService;
		unitDao				= com.jeedsoft.quicksilver.unit.UnitHome.getDao();
		fieldDao			= com.jeedsoft.quicksilver.unit.FieldHome.getDao();
		dictionaryService	= com.jeedsoft.quicksilver.dictionary.DictionaryHome.getService();
		UUID unitId			= unitDao.getItem(getDaoContext(), unitCode).getId();
		UUID dictionaryId	= fieldDao.getItem(getDaoContext(), unitId, fieldName).getDictionaryId();
		return dictionaryService.getComboBoxItemsJson(getServiceContext(), dictionaryId);
	}
%>

<%
	response.setContentType("text/html; charset=UTF-8");
	PageResult result = (PageResult)request.getAttribute("result");
%>
