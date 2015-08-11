<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>论坛首页</title>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta content="qt" name="menu"/>
    <style type="text/css">
    	.fencelTable{
    		border-right: 1px solid #666666;
    		border-bottom: 1px solid #666666;
    	}
    	.fencelTable td{
    		border-top: 1px solid #666666;
    		border-left: 1px solid #666666;
    	}
    	a{
    	text-decoration:none;
    	color:#0154b5;
    	}
    	a:hover{
    	text-decoration:underline;
    	}
    </style>
<link href="styles/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8" src="<c:url value='/scripts/jquery-1.3.2.js'/>"></script>
</head>
<body>
<div class="main">
	<div class="top" style="height:110px;">
    	<div class="topbg"></div>
        <div class="float_left denglulogo">
        	<div class="logo float_left"><a href="http://localhost:8080/bbs/indexs.html"><img src="images/companyLogo.jpg" style="border:0;"></a></div>
       	   	 <s:form id="saveUserForm" method="post">
       	    <div class="denglu float_right">
               <table width="100%" border="0">
               		<tr>
                    	<td>用户名</td>
                        <td><input type="text" name="usernameOne" id="usernameOne" onkeydown="if(event.keyCode==13){Javascript:saveDeng();}"/></td>
                        <td align="right"><input type="checkbox"/></td>
                        <td align="left">自动登录</td>
                        <td style="color:red;"><a href="#">找回密码？</a></td>
                    </tr>
                    <tr>
                    	<td>密码</td>
                        <td><input type="password" name="passwordOne" id="passwordOne" style=" width:149px;" onkeydown="if(event.keyCode==13){Javascript:saveDeng();}"/></td>
                        <td colspan="2"><input type="button" value="登录" onclick="saveDeng()"></td>
                        <td style="color:blue;font-weight:bold;"><a href="zhuces.html">注册</a></td>
                    </tr>
               </table>
            </div>
            </s:form>
        </div>
        </div>
        <div class="daohang float_left">
        	<div class="float_left"><img src="images/daohangleft.jpg"></div> 
            <div class="float_right"><img src="images/daohangright.jpg"></div>
        </div>
        <div class="search float_left">
        	<div class="float_left"><img src="images/fangdajing.jpg" style="margin:10px 0 0 10px;"></div>
            <div class="float_left searchK"><input type="text" width="300px;" height="30px;"></div>
            <div class="float_left" style="margin-top:2px;"><img src="images/searchbutton.jpg" style="float:left;"></div>
        </div>
		<div class="list_menu float_left" style="margin-bottom:-10px;">
		     <div class="list_menu_top">
			     <ul>
				    <li>产品论坛</li>
					<li>列表</li>
				 </ul>
			 </div>
			 <div class="list_menu_bottom">
			     <ul class="float_left">
				    <li style="color:gray">今日：<span style="color:black"><c:out value="${channel.todayNum}"/></span></li>
					<li>|</li>
					<li style="color:gray">昨日：<span style="color:black">5</span></li> 
					<li>|</li>
					<li style="color:gray">帖子：<span style="color:black"><c:out value="${channel.allNum}"/></span></li> 
					<li>|</li>
					<li style="color:gray">会员：<span style="color:black"><c:out value="${channel.allUser}"/></span></li>
                    <li>|</li>					
					<li style="color:gray">欢迎新会员：<span style="color:black"><c:out value="${pageContext.request.remoteUser}"/></span></li> 
				 </ul>
				 <div class="show_new float_right" style="padding:10px 15px 0 0;"><a href="#">查看新帖</a></div>
			 </div>
		</div>
        <div class="middlebeijing">
      <div class="middle">
	  <c:forEach items="${list11}" var="l">
	      <c:if test="${l.level=='1'}">
	      <div class="listTable listTable_one">
	      <div class="titleDiv"><p style="font-size:14px;margin:2px 0 0 10px;font-family:'黑体'"><c:out value="${l.channelName}" /></p>
	      		<p style="font-size:12px;margin:-30px 0 0 800px;font-family:'黑体'">分区版主:<span class="STYLE3">kingghjhjhhj</span></p>
	      </div>
	      <c:forEach items="${list11}" var="ll">
	      <c:if test="${l.channelCode==ll.superCode}">
		      <div class="content_row">
		      <div><a href="tiezis.html?channelCode=<c:out value='${ll.channelCode}'/>"><img src="images/pingdaoLogo.jpg" style="margin:18px 0 0 10px;border:0;"/></a></div>
		      <div><span class="STYLE1"></span>
		        <p style="font-size:12px;margin:-42px 0px 0px 60px;color:#0154B5;"><a href="tiezis.html?channelCode=<c:out value='${ll.channelCode}'/>"><c:out value="${ll.channelName}" /></a></p>
		        <p style="font-size:12px;margin:8px 0 0 20px;font-family:Arial'"></p>
		        <p style="font-size:12px;margin:-5px 0 0 59px;font-family:Arial">帖子数 <c:out value='${ll.invitationNum}'/></p>
		        <p style="font-size:12px;margin:2px 0 0 60px;font-family:Arial">最后发表 16分钟前</p>     
		      </div> 
		      </div>
		       </c:if>
	      </c:forEach>
	      </div>
	      </c:if>
      </c:forEach>
    
      </div>
      </div>
      
       <div class="foot float_left">
            <div class="float_left footone"><span>Copyright@2010-1011零度互动(北京)信息技术有限公司版权所有</span></div>
            <div class="foottwo float_right"><p style="color:white;margin:10px 0 0 10px;">首页  软件外包  产品中心  案例中心  联系我们</p><p style="color:white;font-size:13px;margin:8px 0 0 11px;"> 电话：010-59435698 京ICP备09052301号</p></div>
  	   </div>
	</div>
	<script type="text/javascript">
	function save_click(){
			document.saveUsers.action="saveUsers.html?";
			document.saveUsers.submit();
	}
	function saveDeng(){	
			var username = $("#usernameOne").val();
			var password = $("#passwordOne").val();
			if(username ==''){
				alert("用户名不能为空！");
				return false;
			}if(password == ''){
				alert("密码不能为空！");
				return false;
			}else{
				var url= "saveUserOne.html";//获取后台方法
				$.getJSON(url+"?iiii="+Math.random(),{username:username,password:password},function(data){//把后台获取的方法，之后定义的emails放在里面判断
				var json = eval("da="+data.jst);//接收后台返回的值并改为json对象
				if(json[0].YES==0){
					alert("账号或密码有误!");
					return false; 
				}if(json[0].NO==1){
				    alert("账号不存在");
				    return false;
			    }
			  	});
			}
		}
</script>
</body>
</html>