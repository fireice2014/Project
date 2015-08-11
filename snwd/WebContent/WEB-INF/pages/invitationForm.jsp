<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>帖子发布</title>
</head>
<body>
<div>
	<s:form id="saveInvitation" method="post">
		<table border="0">
		<s:hidden key="invitation.invitationCode" theme="simple"></s:hidden>
			<tr>
				<td>标题：</td><td><s:textfield key="invitation.invitationTitle" theme="simple"></s:textfield></td>
			</tr>
			<tr>
				<td>内容</td><td><s:textfield key="invitation.invitationContent" theme="simple"></s:textfield></td>
			</tr>
		</table>
		<button onclick="save_click()">保存</button>   
	</s:form>
</div>
<script type="text/javascript">
	//保存
	function save_click(){
		document.saveInvitation.action="saveInvitation.html?channelCode=<c:out value='${param.channelCode}'/>";
		document.saveInvitation.submit();
	}
</script>
</body>
</html>