<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String formName=request.getParameter("formName")==null?"form1":request.getParameter("formName");
String editorId=request.getParameter("editorId")==null?"content":request.getParameter("editorId");
String eWidth=request.getParameter("eWidth")==null?"700":request.getParameter("eWidth");
String eHeight=request.getParameter("eHeight")==null?"200":request.getParameter("eHeight");
%>
	
		<textarea id="<%=editorId%>" name="<%=editorId%>" cols="100" rows="8" style="width:<%=eWidth %>px;height:<%=eHeight %>px;visibility:hidden;"></textarea>
		<br />
    
	<script type="text/javascript">
		KE.show({
			id : '<%=editorId%>',
			imageUploadJson : '../../jsp/upload_json.jsp',
			fileManagerJson : '../../jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function(id) {
				KE.event.ctrl(document, 13, function() {
					KE.util.setData(id);
					document.forms['<%=formName%>'].submit();
				});
				KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
					KE.util.setData(id);
					document.forms['<%=formName%>'].submit();
				});
			}
		});
	</script>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>