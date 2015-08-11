<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>帖子列表</title>
    <style type="text/css">
    	.fencelTable{
    		border-right: 1px solid #666666;
    		border-bottom: 1px solid #666666;
    	}
    	.fencelTable td{
    		border-top: 1px solid #666666;
    		border-left: 1px solid #666666;
    	}
    </style>
</head>
<body>
<div>
	<button onclick="insert_click()">新增</button>    
	<div>
		<table class="fencelTable" width="100%">
			<tr>
				<td>标题</td>
				<td>内容</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
				<td><c:out value="${list.invitationTitle}"/>&nbsp;</td>
				<td><c:out value="${list.invitationContent}"/>&nbsp;</td>
				<td>显示</td>
				<td><a href="editInvitation.html?invitationCode=<c:out value='${list.invitationCode}'/>&channelCode=<c:out value='${list.channelCode}'/> ">编辑</a>&nbsp;&nbsp;&nbsp;
					<a href="deleteInvitation.html?invitationCode=<c:out value='${list.invitationCode}'/>&channelCode=<c:out value='${list.channelCode}'/>">删除</a>&nbsp;&nbsp;&nbsp;
					<a href="sticky.html?invitationCode=<c:out value='${list.invitationCode}'/>&channelCode=<c:out value='${list.channelCode}'/>">置顶</a>&nbsp;&nbsp;&nbsp;
					<a href="#">审核</a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script type="text/javascript">
	//新增
	function insert_click(){
		window.location.href="editInvitation.html?channelCode=<c:out value='${param.channelCode}'/>";
	}
</script>
</body>
</html>