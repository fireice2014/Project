<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>频道列表</title>
    <meta content="ht" name="menu"/>
    <meta name="heading" content="<fmt:message key='menu.chennels'/>"/>
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
<script type="text/javascript" charset="utf-8" src="<c:url value='/scripts/jquery-1.3.2.js'/>"></script>
<script type="text/javascript">
	//新增
	function insert_click(){
	  window.location.href="editChannel.html";
	}
	function quanxuan(){  //全部选中
		var aa=document.getElementsByName("channelCodes");
		var bb=document.getElementById("check");
		   if(bb.checked==true){
		     for(var j=0;j<aa.length;j++){
		     aa[j].checked=true;
		    }		
		    }else{
		    for(var k=0;k<aa.length;k++){
		      aa[k].checked=false;
		    }		
		    } 
		   }
	function deleteCurrency(){
		var channelCodes = document.getElementsByName("channelCodes");
	    flag=true;
	    for(var i=0;i<channelCodes.length;i++){
	         if(channelCodes[i].checked==true){
	            flag=false;
	         }
	         }if(flag){
	           alert("请至少选择一个删除!"); 
	         }else{
	         if(confirm("确定删除吗?")){
		       	document.currencyForm.action="deleteChennel.html";
		     	document.currencyForm.submit();  
	           return true;  
	       }else{
	           return false;
	       }
	      }   
	  }
</script>
</head>
<body>
<s:form action="deleteChennel"  method="post" id="currencyForm" vadivdate="true">
<div>
	<input type="button" onclick="insert_click()" value="新增"/>
	<input type="button" value="删除" onclick="deleteCurrency()"/>
	<div style="margin-top:10px;">
		
		<table class="table" width="100%">
			<tr>
				<td><input type="checkbox" onclick="quanxuan(this)" id="check"></td>
				<td>频道名称</td>
				<td>上级频道</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
				<td><input type="checkbox" value="<c:out value='${list.channelCode}'/>" id="channelCodes" name="channelCodes"></td>
				<td><c:if test="${list.superCode==''}"><c:out value="${list.channelName}"/>&nbsp;</c:if><c:if test="${list.superCode!=''}"><a href="invitations.html?channelCode=<c:out value='${list.channelCode}'/>"><c:out value="${list.channelName}"/></a>&nbsp;</c:if></td>
				<td><c:out value="${list.superCode}"/>&nbsp;</td>
				<td><a href="editChannel.html?channelCode=<c:out value='${list.channelCode}'/>">编辑</a>&nbsp;&nbsp;&nbsp;
					<a href="deleteChannel.html?channelCode=<c:out value='${list.channelCode}'/>">删除</a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
</s:form>
</body>
</html>