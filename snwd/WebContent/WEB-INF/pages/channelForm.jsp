<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>频道</title>
    <meta name="menu" content="ht"/>
    <script type="text/javascript" charset="utf-8" src="<c:url value='/scripts/jquery-1.3.2.js'/>"></script>
    <script type="text/javascript">
	//保存
	function save_click(){
		var channelName = document.getElementById("channelName").value;
		if(channelName==''){
			alert("频道名称不能为空");
			return false;
		}else{
			document.saveChannel.action="saveChannel.html";
			document.saveChannel.submit();
		}
	}
</script>
</head>
<body>
<div>
	<s:form id="saveChannel" method="post">
		<table border="0">
		<s:hidden key="channel.channelCode" theme="simple"></s:hidden>
			<tr>
				<td>上级频道：</td><td><s:select list="channelMap" key="channel.superCode" theme="simple"/></td>
			</tr>
			<tr>
				<td>频道名称：</td><td><s:textfield key="channel.channelName" id="channelName" theme="simple"></s:textfield></td>
			</tr>
		</table>
		<input type="button" onclick="save_click();" value="保存"/> 
	</s:form>
</div>
</body>
</html>