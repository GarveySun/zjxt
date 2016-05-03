<!--#include file ="asp/config.asp"-->
<%
if Session("logined")=True Then
Response.Redirect("/asp/frame1.asp")
end if
%>
<!doctype html>
<html>
<head>
<link href="/css/theme.css" rel="stylesheet" type="text/css">
<script src="/jquery/jquery-1.9.1.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>用户登录</title>
</head>

<body id="bodyBg1">
<div class="whitebelt"></div>
<div class="loginout">
<div class="bigtitle" align="center">
  <p>总监反映单据系统</p>
</div>
<form name="form1" method="post" action="/asp/userlogin.asp" onsubmit="return checkform();">
	<div class="logtittle">用户登录</div>
    <div class="errormsg alert" id="errormsg"> </div>
	<input class="typein" type="text" id="userid" name="userid" placeholder="用户名（工号）" autofocus><span class="errormsg" style="color:#F00; font-size:12px; display:none">*</span>
	<input type="hidden" value="j" name="whereurl">
	<input class="typein" type="password" id="password" name="password" placeholder="密码（初始2）"><span class="errormsg" style="color:#F00; font-size:12px; display:none">*</span>
	<input type="hidden" name="Userlogin" value="True">
	<input type="submit" name="Submit" value="登 录" class="btn-primary" />
    <div class="forgetpw"><a id="forgetpw" href="javascript:;">忘记密码</a></div>
</form>

<div class="copyr">
<p align="center" class="small">Copyright 2016 All Rights Reserved | BHDL</p>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(e) {	
	$("#forgetpw").on("click",function(e){
		$("#errormsg").text("请联系计算机室（85260463）恢复初始密码");
	});
});


function checkform(){
	if (document.form1.userid.value=="" || document.form1.password.value==""){
		$("#errormsg").text("账号或密码不能为空");
		document.form1.password.value="";
		document.form1.userid.focus();
	    return false;}
	else if (document.form1.userid.value.length>12||document.form1.password.value.length>12){
		$("#errormsg").text("不正确的账号或密码格式，请重新输入");
		document.form1.password.value="";
		document.form1.userid.value="";
		document.form1.userid.focus();
		return false;}
	else{
		var login=false
		$.ajax({
		    type:"POST",
			url:"asp/ajaxuserlogin.asp",
			data:{userid:document.form1.userid.value,password:document.form1.password.value},
			datatype:"txt",
			async:false,
			success:function(data){
				if (data==="yes"){
					login=true;
				}else{
					login=false;
					$("#errormsg").text("账号或密码输入错误，请重新输入");
					document.form1.password.value="";
					document.form1.userid.focus();
				}
			    }
		});
		return login;
		}
}
</script>
</body>
</html>
