<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String formName=request.getParameter("formName");
String editorId=request.getParameter("editorId");
String myPath="/kindEditor/";
%>
	
		<textarea id="<%=editorId%>" name="<%=editorId%>" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
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