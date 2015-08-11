<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>帖子详细页</title>
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
    	color:#0154b5;
    	}
    </style>
<script type="text/javascript" charset="utf-8" src="kindEditor/kindeditor.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css" />
<script src="scripts/jquery-1.3.2.js" type="text/javascript"></script>
</head>
<body>
<div class="main">
<div style="float:left;">
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
				    <li><a href="http://localhost:8080/bbs/indexs.html">产品论坛</a></li>
					<li><a href="tiezis.html?channelCode=<c:out value='${param.channelCode}'/>">列表</a></li>
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
        <div class="tiezi" style="width:970px;margin:10px 0 0 15px;border:1px solid #cdcdcd;float:left;">
        	<table width="100%" height="100" border="0">
        		<tr height="23" style="background:#5d7790;">
        			<td width="194" style="font-family:Arial;color:white;">
        				<span style="margin-left:30px;">查看：<c:out value='${invitation.viewTimes}'/></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span>回复：<c:out value='${invitation.respondTimes}'/></span>
        			</td>
        			<td style="font-family:Arial;color:white;font-weight:bold;">
        				<span style="margin-left:15px;"><a href="tiezi.html?channelCode=<c:out value='${param.channelCode}'/>&invitationCode=<c:out value='${invitation.invitationCode}'/>" style="color:white;"><c:out value="${invitation.invitationTitle}"/></a></span>
        			</td>
        		</tr>
        		<tr style="background:#dfdfdf;" height="18">
        			<td valign="top">
        				<div class="bzxx float_left;">
        					<div class="bzname" style="border-bottom:1px dashed #cdcdcd;padding:5px 0 6px 0; width:175px;margin-left:10px;">~<c:out value='${invitation.sendEr}'/>~</div>
        					<div style="margin:5px 0 0 30px;"><img src="images/bz.jpg"/></div>
        					<div style="margin:5px 0 0 22px;line-height:18px;">
        						<table>
        							<tr>
        								<td style="color:red;"><c:out value='${invitation.roleName}'/></td>
        								<td><c:out value='${invitation.roleName}'/></td>
        							</tr>
        							<tr>
        								<td>论坛助理</td>
        								<td></td>
        							</tr>
        							<tr>
        								<td>精华帖</td>
        								<td>32</td>
        							</tr>
        							<tr>
        								<td>注册时间</td>
        								<td>2011-10-21</td>
        							</tr>
        						</table>
        					</div>
        				</div>
        			</td>
        			<td valign="top">
						<div class="tzxx" style="border-bottom:1px dashed #cdcdcd;padding:4px 0 7px 0;font-size:12px;font-family:Arial;width:500px;margin-left:10px;">发表于<c:out value="${invitation.sendName}"/> &nbsp;|&nbsp;只看该作者&nbsp;|&nbsp;倒序浏览 </div>
						<div style="width:730px;margin:10px 0 0 13px;">
							<div style="font-size:12px;font-family:Arial;line-height:20px;">
								<c:out value="${invitation.invitationContent}"  escapeXml="false"/>
							</div>
							<div style="width:730px;margin-top:15px;line-height:20px;font-weight:bold;">
								我是itpub论坛助理。您在论坛使用中遇到任何问题，请立即与我联系，我将会帮助您解决问题！
									可以通过邮件与我联系：wangbei@188.com
									我的新浪微博，欢迎大家加我：http://t.sina.com.cn/1657301297
							</div>
						</div>
					</td>
        		</tr>
        	</table>
        </div>
        <c:forEach items="${replyDetails}" var="re">
        <div class="tiezi" style="width:990px;margin-top:1px;float:left;">
        <div class="tieDetail" style="border:1px solid #cdcdcd;width:970px;margin-left:15px;">
        	<table width="100%" height="100" border="0">
        		<tr style="background:#dfdfdf;" height="18">
        			<td valign="top" width="194">
        				<div class="bzxx float_left;">
        					<div class="bzname" style="border-bottom:1px dashed #cdcdcd;padding:5px 0 6px 0; width:175px;margin-left:10px;">~<c:out value="${re.replyer}"/>~</div>
        					<div style="margin:5px 0 0 30px;"><img src="images/bz.jpg"/></div>
        					<div style="margin:5px 0 0 22px;line-height:18px;">
        						<table>
        							<tr>
        								<td style="color:red;"><c:out value="${re.roleName}"/></td>
        								<td><c:out value="${re.roleName}"/></td>
        							</tr>
        							<tr>
        								<td>论坛助理</td>
        								<td></td>
        							</tr>
        							<tr>
        								<td>精华帖</td>
        								<td>32</td>
        							</tr>
        							<tr>
        								<td>注册时间</td>
        								<td>2011-10-21</td>
        							</tr>
        						</table>
        					</div>
        				</div>
        			</td>
        			<td valign="top">
						<div class="tzxx" style="border-bottom:1px dashed #cdcdcd;padding:4px 0 7px 0;font-size:12px;font-family:Arial;width:500px;margin-left:10px;">发表于<c:out value="${re.replyTime}"/>&nbsp;|&nbsp;只看该作者&nbsp;|&nbsp;倒序浏览 </div>
						<div style="width:730px;margin:10px 0 0 13px;">
							<div style="font-size:12px;font-family:Arial;line-height:20px;width:730px;">
								<c:out value="${re.replyContent}" escapeXml="false"/>
							</div>
							<div style="width:730px;margin-top:15px;line-height:20px;font-weight:bold;">
								我是itpub论坛助理。您在论坛使用中遇到任何问题，请立即与我联系，我将会帮助您解决问题！
									可以通过邮件与我联系：wangbei@188.com

									我的新浪微博，欢迎大家加我：http://t.sina.com.cn/1657301297
							</div>
						</div>
					</td>
        		</tr>
        	</table>
        	</div>
        </div>
        </c:forEach>
        <div class="show_new" style="padding:5px 0 0 0;font-weight:bold;margin:10px 0 10px 20px;float:left;"><a href="newtz.html?channelCode=<c:out value='${param.channelCode}'/>">发布新帖</a></div>
        <div class="tiezi" style="width:990px;margin-top:1px;">
        <div style="border:1px solid #cdcdcd;width:970px;margin-left:15px;float:left">
        	<s:form id="saveReplyDetail" method="post" cssStyle="margin-left:-40px;">
        	<table width="100%" border="0">
        		<tr style="background:#dfdfdf;" height="18">
        			<td valign="top" width="194">
        				<div class="bzxx float_left;">
        					<div style="margin:20px 0 20px 30px;"><img src="images/reportEr.jpg"/></div>
        				</div>
        			</td>
        			<td>
						<div style="width:700px;margin:10px 0 0 13px;">
							<div style="font-size:12px;font-family:Arial;line-height:20px;">
								<jsp:include page="/kindEditor/jsp/test.jsp">
									<jsp:param name="formName" value="saveReplyDetail"/>
									<jsp:param name="editorId" value="replyContent" />
									<jsp:param name="eWidth" value="800" />
									<jsp:param name="eHeight" value="400" />
									</jsp:include>
							</div>
						</div>
						<div style="margin:10px 0 0 10px;">
							<input type="button" value="发表回复" onclick="save_click()"> <input type="text" name="zcyzmpz" id="zcyzmpz" style="width:70px;" maxlength="6"/><span style="margin:2px 0 0 10px"><img src="rand.html" onclick="changeValidateCode(this)" title="点击图片刷新验证码"/></span>
						</div>
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
	//保存
	function save_click(){
		var username = '<c:out value="${pageContext.request.remoteUser}"/>';
		var tt = document.getElementById("zcyzmpz").value;
		if(username=='' || username==null ){
			alert("请登录发帖！");
			window.location='login.jsp';
		}else{
			$.getJSON("random.html"+"?iiii="+Math.random(),{yzm:tt},function(date){ 
			yzmFh=date.jst;
			if(yzmFh=='NO'){
				alert("您输入的验证码有误！");
				return false;
			}else{
				document.saveReplyDetail.action="saveReplyDetail.html?invitationCode=<c:out value='${param.invitationCode}'/>&channelCode=<c:out value='${param.channelCode}'/>";
				document.saveReplyDetail.submit();
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


 