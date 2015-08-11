<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
<title>发布新贴</title>
<meta http-equiv="x-ua-compatible" content="ie=7" />
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
<script type="text/javascript" charset="utf-8" src="kindEditor/kindeditor.js"></script>
<script src="scripts/jquery-1.3.2.js" type="text/javascript"></script>  
<link href="styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main">
	<div class="top">
    	<div class="topbg"></div>
        <div class="float_left denglulogo">
        	<div class="logo float_left"><a href="http://localhost:8080/bbs/indexs.html"><img src="images/companyLogo.jpg" style="border:0;"></a></div>
       	    <div class="denglu float_right">
               <table>
               		<tr>
                    	<td>用户名</td>
                        <td><input type="text"></td>
                        <td align="right"><input type="checkbox"/></td>
                        <td align="left">自动登录</td>
                        <td style="color:red;"><a href="#">找回密码？</a></td>
                    </tr>
                    <tr>
                    	<td>密码</td>
                        <td><input type="text"></td>
                        <td colspan="2"><img src="images/denglu.jpg"/></td>
                        <td style="color:blue;font-weight:bold;"><a href="#">注册</a></td>
                    </tr>
               </table>
            </div>
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
				 <div class="show_new float_right" style="padding:10px 0 0 0;width:80px;folat:right;font-weight:bold;"><a href="newtz.html?channelCode=<c:out value='${param.channelCode}'/>">发布新帖</a></div>
				 <div class="show_new float_right" style="padding:10px 15px 0 0;width:55px;font-weight:bold;"><a href="#">查看新帖</a></div>
			 </div>
		</div>
     	<div style="width:1000px;margin-top:10px;border:1px solid #cdcdcd;">
     		<div style="width:965px;margin:3px 0 0 15px;">
     		<s:form id="saveInvitations" method="post">
     			<table width="100%" border="0">
     				<tr >
     					<td>
     					主题
     					</td>
     					<td>
     					<input type="text" name="invitation.invitationTitle" id="invitationTitle">
     					</td>
     				</tr>
     				<tr>
     					<td>
     					内容
     					</td>
     					<td>
     						<jsp:include page="/kindEditor/jsp/test.jsp">
									<jsp:param name="formName" value="saveReplyDetail"/>
									<jsp:param name="editorId" value="invitationContent" />
									<jsp:param name="eWidth" value="800" />
									<jsp:param name="eHeight" value="400" />
							</jsp:include>
     					</td>
     				</tr>
     				<tr>
     					<td></td>
     					<td>
     						<input type="button" value="发表帖子" onclick="save_click()"><input type="text" name="zcyzmpz" id="zcyzmpz" style="width:70px;" maxlength="6"/><span style="margin:2px 0 0 10px"><img src="rand.html" onclick="changeValidateCode(this)" title="点击图片刷新验证码"/></span>
     					</td>
     				</tr>
     			</table>
     			</s:form>
     		</div>
     	</div>
       <div class="foot float_left">
            <div class="float_left footone"><span>Copyright@2010-1011零度互动(北京)信息技术有限公司版权所有</span></div>
            <div class="foottwo float_right"><p style="color:white;margin:10px 0 0 10px;">首页  软件外包  产品中心  案例中心  联系我们</p><p style="color:white;font-size:13px;margin:8px 0 0 11px;"> 电话：010-59435698          京ICP备09052301号</p></div>
  	   </div>
	</div>
<script type="text/javascript">
	checkUser();
	function checkUser(){
		var username = '<c:out value="${pageContext.request.remoteUser}"/>';
		if(username=='' || username==null ){
			alert("请登录发帖！");
			window.location='login.jsp';
		}
	}
	function save_click(){
		var newTitle= $("#invitationTitle").val();
		var tt = document.getElementById("zcyzmpz").value;
		if(newTitle==''){
			alert("主题不能为空！");
			return false;
		}else{
			$.getJSON("random.html"+"?iiii="+Math.random(),{yzm:tt},function(date){ 
			yzmFh=date.jst;
			if(yzmFh=='NO'){
				alert("您输入的验证码有误！");
				return false;
			}else{
				document.saveInvitations.action="saveInvitations.html?channelCode=<c:out value='${param.channelCode}'/>";
				document.saveInvitations.submit();
			}
			});
		}
	}
	function changeValidateCode(obj) {  
	       //获取当前的时间作为参数，无具体意义   
	    var timenow = new Date().getTime();   
	       //每次请求需要一个不同的参数，否则可能会返回同样的验证码   
	    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。   
	    obj.src="rand.html?d="+timenow;   
	}
</script>
</body>
</html>