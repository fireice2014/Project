<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
<title>帖子列表</title>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="styles/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.STYLE1 {font-size: 14px}
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:underline;
color:#0154b5;	
}
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:underline;
}
</style>
<script src="scripts/jquery-1.3.2.js" type="text/javascript"></script>   
</head>
<body>
<div class="main">
	<div class="top">
    	<div class="topbg"></div>
        <div class="float_left denglulogo">
        	<div class="logo float_left"><a href="http://localhost:8080/bbs/indexs.html"><img src="images/companyLogo.jpg" style="border:0;"></a></div>
       	    <div class="denglu float_right">
               <table width="100%" border="0">
               		<tr>
                    	<td>用户名</td>
                        <td><input type="text"></td>
                        <td><input type="checkbox"/></td>
                        <td>自动登录</td>
                        <td>找回密码</td>
                    </tr>
                    <tr>
                    	<td>密码</td>
                        <td><input type="text"></td>
                        <td colspan="2"><img src="images/denglu.jpg"/></td>
                        <td style="color:blue;font-weight:bold;">注册</td>
                    </tr>
               </table>
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
				    <li><a href="http://localhost:8080/bbs/indexs.html">产品论坛</a></li>
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
		</div>
    <div class="middle" style="float:left;">
	   <div class="listTable">
	       <div class="titleDiv">
		      <div style="font-size:14px;font-family:'黑体';float:left;padding-left:130px;width:400px;">标题</div>
		      <div style="font-size:14px;font-family:'黑体';float:left;margin:0 0 0 30px;">作者</div>
			  <div style="font-size:14px;font-family:'黑体';float:left;margin:0 0 0 70px;">回复/查看</div>
			  <div style="font-size:14px;font-family:'黑体';float:left;margin:0 0 0 70px;">最后回复人/最后回复时间</div>
		   </div>
		    <c:forEach items="${list}" var="list">
				 <div id="ta" class="contentDiv" style="height:40px;">
			      <div class="content_row" style="width:945px;border:0;padding-bottom:0;">
					<div class="float_left" style="margin:20px 0 0 5px;width:510px;font-weight:bold;">
					    <a href="tiezi.html?channelCode=<c:out value='${param.channelCode}'/>&invitationCode=<c:out value='${list.invitationCode}'/>"><c:out value="${list.invitationTitle}"/></a>
					 </div>
					  <div class="float_left" style="margin:20px 0 0 35px;width:60px;">
					 		 <c:out value="${list.sendEr}"/>
					 </div>
					 <div class="float_left" style="margin:20px 0 0 30px;width:90px;">
					     <div style="width:39px;float:left;text-align: right;"><c:out value="${list.respondTimes}"/></div><div style="float:left;">/</div><div style="width:39px;float:left;"><c:out value="${list.viewTimes}"/></div>
					 </div>
					 <div class="float_left" style="margin:20px 0 0 0;width:210px;float:left;">
					     <div class="zi5"><div style="float: left;text-align: right;width:80px;border:1px solid white;"><c:out value="${list.endUser}"/> </div><div style="float:left;">/</div><div style="float: right;text-align: left;width:120px;"><c:out value="${list.endTime}"/></div></div>
					 </div>
				  </div>
			   </div>
		    </c:forEach>
	   </div>
	</div>
	
    <div class="foot float_left">
       <div class="float_left footone"><span>Copyright@2010-1011零度互动(北京)信息技术有限公司版权所有</span></div>
       <div class="foottwo float_right">
        	<p style="color:white;font-size:13px;margin:10px 0 0 10px;">首页  软件外包  产品中心  案例中心  联系我们</p>
        	<p style="color:white;font-size:13px;margin:10px 0 0 10px;"> 电话：010-59435698          京ICP备09052301号</p>
        </div>
  </div>
</div>
</body>
</html>
