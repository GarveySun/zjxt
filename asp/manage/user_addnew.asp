<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open DBstr
   sql = "Select * from roles order by roleid asc"
   Set rs = Server.CreateObject("ADODB.Recordset")
   rs.open sql, Conn, 3, 2
%>
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script src="../../js/config.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	//通过自定义方法为部门选项增加部门
	Config.Setdepartment("department");

});
</script>

<style type="text/css">
<!--
.topic { font-family: "宋体"; font-size: 11; vertical-align: middle; line-height:16pt;}
.small { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
-->
</style>

<TITLE>添加角色</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 
<form action="user_addnew_tj.asp" method="post" name="form1">

  <p>&nbsp;</p>
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="605">
    <tr bgcolor="#FF8080"> 
      <td colspan=5 align="center" height="25">添加用户</td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">登录账号：</td>
      <td height="24" colspan="2">
        <input type="text" name="userid" size="20" placeholder="工号" maxlength="20">
      <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">姓名：</td>
      <td height="24" colspan="2">
        <input type="text" name="name" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">密码：</td>
      <td height="24" colspan="2">
        <input type="password" name="password" id="password" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">部门：</td>
      <td height="24" colspan="2">
                <select name="department" id="department">
      	<option value="" selected>请选择</option>
      </select>
      </td>
    </tr>

     <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">权限范围：</td>
      <td height="24" colspan="2">
      <select name="seecheck" id="seecheck" >
       <option value="查看" selected>查看</option>
        <option value="操作">操作</option>
      </select>
      <span style="color:#666"> 只有操作权限可以进行&ldquo;审批&rdquo;操作</span>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">分配角色：</td>
            <td height="24" colspan="2">
                <select name="rolename" id="rolename">
      	<option value="" selected>请选择</option>
<%
do while not rs.eof
%>
    <option value="<%=rs("rolename")%>"><%=rs("rolename")%></option>   
<% rs.movenext
loop
%>
      </select>
      </td>

    </tr>
    <tr bgcolor="#ffefbf"> 
      <td align=center colspan=3><input type="submit" value="保 存" name="send">
        <input type = "button" name = "button1" value = "返 回" onclick = "javascript:history.back(-1);" /></td>
    </tr>
  </table>
</form>

<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
