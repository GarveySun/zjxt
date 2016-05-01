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
<div class="bigtitle" align="center">
  <p>总监反映单据系统2.0（测试）</p>
</div>
<div class="loginout">
<form name="form1" method="post" action="/asp/userlogin.asp" onsubmit="return checkform();">
  <table class="roundCorderC" id="tableLogin">
    <tr height="50px">
      <td align="center"><font size="5"> 用户登录</font></td></tr>
    <tr class="alert error" style="display:none"><td align="center" id="errormsg" style="color:#F00; font-size:12px;">账号或密码不能为空</td></tr>
    <tr>
      <td align="center"><input style="width:150px;border:#AAA solid 1px" type="text" id="userid" name="userid" placeholder="用户名（工号）" autofocus><span class="alert errormsg" style="color:#F00; font-size:12px; display:none">*</span>
        <input type="hidden" value="j" name="whereurl"></td>
    </tr>
    <tr>
      <td align="center"><input style="width:150px; border:#AAA solid 1px" type="password" id="password" name="password" placeholder="密码（初始2）"><span class="alert errormsg" style="color:#F00; font-size:12px; display:none">*</span>
        <input type="hidden" name="Userlogin" value="True"></td>
    </tr>
    <tr>
      <td align="center">
          <input type="submit" name="Submit" value="登 录" class="btn-primary" />
          <input type="button" class="test" id="001" value="总监" />
          <input type="button" class="test" id="002" value="部长" />
          <input type="button" class="test" id="003" value="人力" />
          <input type="button" class="test" id="004" value="领导" />
          <input type="button" class="test" id="005" value="皮具" />
          <input type="button" class="test" id="006" value="男装" />
          <input type="button" class="test" id="007" value="财务" />
        </td>
    </tr>
    <tr class="alert forgetpw" style="display:none;"><td align="center"><div style="width:170px; color:#F00; font-size:12px;">请将您的工号告知大楼计算机室（85260463）来重置您的密码。</div></td></tr>
    <tr><td align="right"><a href="javascript:;">忘记密码</a></td></tr>
  </table>
</form>
<p align="center" class="small">Copyright 2015 All Rights Reserved | BHDL</p>
</div>
<script type="text/javascript">
var serverstr = <%=DBstr%>
$(document).ready(function(e) {
    $("td a").click(function(e) {
        $(".alert").hide();
		$(".forgetpw").show();
    });
	
	$(".test").on("click",function(e){
		$("#userid").val($(this).attr("id"));
		$("#password").val("2");
		window.form1.submit();
	});
});


function checkform(){
	if (document.form1.userid.value=="" || document.form1.password.value==""){
        $(".alert").hide();
		$("#errormsg").text("账号或密码不能为空").parent(".error").show();
		document.form1.password.value="";
		document.form1.userid.focus();
	    return false;}
	else if (document.form1.userid.value.length>12||document.form1.password.value.length>12){
		$(".alert").hide();
		$("#errormsg").text("不正确的账号或密码格式，请重新输入").parent(".error").show();
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
				if (data=="yes"){
					login=true;
				}else{
					login=false;
					$(".alert").hide();
					$("#errormsg").text("账号或密码输入错误，请重新输入").parent(".error").show();
					document.form1.password.value="";
					document.form1.userid.focus();
				}
			    }
		});
		return login;
		}
	};
</script>
</body>
</html>
