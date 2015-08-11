<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>注册页</title>
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
<script type="text/javascript" charset="utf-8" src="<c:url value='/scripts/jquery-1.3.2.js'/>"></script>
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
       
	
        <div class="tiezi" style="width:968px;margin:10px 0 0 16px;border:1px solid #CDCDCD;">
        <div style="">
      	   <div style="font-size:22px;font-family:'黑体';color:#3482BB;margin:10px 0 0 300px;">欢迎加入Java交流社区！</div>
      		 <s:form id="saveUserForm" method="post">
      		  <table style="margin:30px 0 20px 200px;">
	               <tr>
	                  <td align="right" style="color:#666666;">用  户  名：</td>
	                  <td><input type="text" style="width: 200px;" name="user.username" id="usernames" onchange="testUser(this.value)"/><span style="color: red;"> * <span style="color: #666666;">请输入4-16位数字、26个英文字母或者下划线组成的字符串(不能以数字开头)</span></span></td>                
	               </tr>
	               <tr>
	                  <td align="right" style="color:#666666;">密          码：</td>
	                  <td><input type="password" style="width: 200px;" name="user.password" id="password"  onchange="testPassword();"/><span style="color: red;" id="passwordTest"> * <span style="color: #666666">请输入6位以上字符，不允许为空。</span></span></td>                
	               </tr>
	               <tr>
	                  <td align="right" style="color:#666666;">确认密码：</td>
	                  <td><input type="password" style="width: 200px;" name="passwordhint" id="passwordhints" onchange="testConfirmPassword();"/><span style="color: red;" id="confirmPasswordTest"> * <span style="color: #666666">请保持与以输入密码一致</span></span></td>                
	               </tr>	            
                   <tr>
                      <td align="right" style="color:#666666;">电子邮箱：</td>
                      <td><input type="text" style="width: 200px;"  name="user.email" id="email" onchange="testEmail();"/><span style="color: red;" id="emailTest""> * <span style="color: #666666">请输入有效邮件地址，当密码丢失时凭此领取</span></span></td> 
                   </tr>
                   <tr>
                      <td align="right" style="color:#666666;">验  证  码：</td>
                      <td><input type="text" name="zcyzmpz" id="zcyzmpz" style="width:70px;float:left;" maxlength="6"/><span style="margin:2px 0 0 10px"><img src="rand.html" onclick="changeValidateCode(this)" title="点击图片刷新验证码"/></span></td> 
                    </tr>
                    <tr> 
                        <td></td>         
                 	   <td><input type="button" value="注  册" onclick="save_click()" style="width: 100px;color:#666666;"></td> 
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
	function testUser(val){
	var url="checkedName.html";
	var username = $("#usernames").val();
	$.getJSON(url+"?iiii="+Math.random(),{username:username},function(data){
		var json = eval("da="+data.jst);//接收后台返回的值并改为 json 对象
			if(json[0].YES==0){
				alert("此用户已存在！");
				return "1";
			}else{
				if(/^.{4,16}$/.test(username && /^\w+$/.test(username)) && /^([a-z]|[A-Z])[0-9a-zA-Z_]+$/.test(username)){
				}else{
					alert("用户名不符合规范！");
					return "2";
				}
			}
	});
}
function testPassword(){
	var passwords = $("#password").val();
	if(/^.{6,20}$/.test(passwords)){
	return "0";
    }else{
    alert("您输入的密码格式有误！");
    return "1";
    }
}
function testConfirmPassword(){
	var passwords = $("#password").val();
	var confirmPassword = $("#passwordhints").val();
	if(confirmPassword==passwords){
		return "0";
	}else{
		alert("两次输入的密码不一致！");
        return "1";
   	}
} 
	function testEmail(){
	var url= "checkEmail.html";//获取后台方法
	var emails = $("#email").val();//定义一个emails把值付给它
	$.getJSON(url+"?iiii="+Math.random(),{emails:emails},function(data){//把后台获取的方法，之后定义的emails放在里面判断
	var json = eval("da="+data.jst);//接收后台返回的值并改为json对象
	if(json[0].YES==0){
		alert("此邮箱已存在");
		return "1"; 
	}else{
	    if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(emails)){
	  	}else{
		alert("您输入的邮箱格式有误！");
		return "2";
      	}
    }
  	});
	}
	function save_click(){
		var usernames = testUser();
		var passwordTest = testPassword();
		var confirmPassword = testConfirmPassword();  
		var email = testEmail();
		var tt = document.getElementById("zcyzmpz").value;
		$.getJSON("random.html"+"?iiii="+Math.random(),{yzm:tt},function(date){ 
			yzmFh=date.jst;
	    if(usernames==1){
			alert("您输入的用户已存在！");
			return false;
		}else if(usernames==2){
			alert("您输入的用户名不符合规范！");
			return false;
		}else if(passwordTest==1){
			alert("您输入的密码格式有误！");
			return false;
		}else if(confirmPassword==1){
			alert("两次输入的密码不一致！");
			return false;
		}else if(email==1){
		    alert("您输入的邮箱已存在！");
			return false;
		}else if(email==2){
		    alert("您输入的邮箱格式有误 ！");
		    return false;	
		}else if(yzmFh=='NO'){
			alert("您输入的验证码不正确！");
			return false;
		}else{
			document.saveUserForm.action="saveNewUser.html";
			document.saveUserForm.submit();
		}
	  });
	}
	function changeValidateCode(obj) {  
		var zcyzmpz =$("#zcyzmpz").val('');
	       //获取当前的时间作为参数，无具体意义   
	    var timenow = new Date().getTime();   
	       //每次请求需要一个不同的参数，否则可能会返回同样的验证码   
	    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。   
	    obj.src="rand.html?d="+timenow;   
	}
</script>
</body>
</html>