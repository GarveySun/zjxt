<!--#include file ="config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr


   Set rs = Server.CreateObject("ADODB.Recordset")
   Key  = Request("Key")
   Sort = Request("Sort")
   Page = Clng(Request("Page"))
   sql = "Select * from error"  
   rs.open sql,conn, 3, 2
   rs.PageSize = 1  '每页显示记录数
   If Page < 1 then Page = 1
   If page > rs.PageCount Then Page = rs.PageCount
   If rs.PageCount > 0 then rs.AbsolutePage = Page
   MySelf = Request.ServerVariables("PATH_INFO")
%>
<%on error resume next%>
<%error=request("error")%>
<html>
<head>
<title>登录失败<%=sitename%>-<%=siteurl%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Robots" content="index,follow">
<link href="/css/theme.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	font-size: 12px
}
.small {
	font-family: "宋体";
	font-size: 9pt;
	vertical-align: middle;
	line-height: 16pt;
	color: #FFF;
}
.errorroundCorder {
	width: 260px;
	height: 200px;
	border: 1px solid #fff;
	color: #000;
	margin-top: 30px;
	border-radius: 8px;
	background: white;
	box-shadow: 0 0 15px #222;
	background: -moz-linear-gradient(top, #fff, #efefef 8%);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#f6f6f6), to(#f4f4f4));
	position: absolute;
	top: 30%;
	left: 50%;
	margin-left: -130px;
	margin-top: -100px;
}
-->
</style>
</head>

<body  id="bodyBg1">
<div>
  <table class="errorroundCorder" id="tableLogin">
    <tr>
      <td colspan="2" align="center"><font size="4" face="黑体">登录失败</font></td>
    </tr>
    <tr>
      <td ><img src="/image/error.png" width="66" height="66" /></td>
      <td><div align="center"><font color="#CC3333"><font size="2">
          <%if error="004" then%>
          <br>
          对不起，用户名或密码不正确。<br>
          <br>
          请您<a href="/Default.asp">重新登录</a>，或单击<font size="2"><a href="http://172.16.2.14:90">返回首页</a>。<br>
          <br>
          <%end if%>
          </font></font></font></div></td>
    </tr>
  </table>
  <br>
  </td>
  </tr>
</div>
</body>
</html>
