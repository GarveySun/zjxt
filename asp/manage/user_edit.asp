<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs,rs2
  Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open DBstr
   Set rs2 = Server.CreateObject("ADODB.Recordset")
   sql = "select * from roles"
   rs2.open sql, Conn, 3, 2
   sql = "Select * from users where userid='"&request("userid")&"'"
   Set rs = Server.CreateObject("ADODB.Recordset")
   rs.open sql, Conn, 3, 2
   
%>
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script src="../../js/config.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $("#reset").click(function(e) {
       $.post("resetpw.asp",{userid:"<%=rs("userid")%>"},
	       function(data){
			   alert("账号"+ data +"的登录口令已经重置。");
		   });
    });

	//通过自定义方法为部门选项增加部门
	Config.Setdepartment("department");

    $("#password").click(function(e) {
        alert('无法自定义修改密码，请点击"重置密码"进行重置。')
    });
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
 
<form action="/asp/manage/user_edit_tj.asp" method="post" name="form1">

  <p>&nbsp;</p>
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="605">
    <tr bgcolor="#FF8080"> 
      <td colspan=5 align="center" height="25">编辑用户</td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">登录账号：</td>
      <td height="24" colspan="2">
         <%=rs("userid")%><input type="text" name="userid" value="<%=rs("userid")%>" style="display:none"> 

    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">姓名：</td>
      <td height="24" colspan="2">
        <input type="text" name="name" size="20" value="<%=rs("name")%>" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">密码：</td>
      <td height="24" colspan="2">
        <input name="password" id="password" value="········" size="20" maxlength="20" readonly> <input type = "button" id="reset" name = "button3" value = "重置密码"/><span style="color:#666"> 重置成初始密码"2"</span></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">部门：</td>
      <td height="24" colspan="2">
                <select name="department" id="department">
      	<option value="<%=rs("department")%>" selected><%=rs("department")%></option>
      </select>
      </td>
    </tr>

     <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">权限范围：</td>
      <td height="24" colspan="2">
      <select name="seecheck" id="seecheck" >
      <option value="<%=rs("seecheck")%>" selected><%=rs("seecheck")%></option>
       <option value="查看">查看</option>
        <option value="操作">操作</option>
      </select>
      <span style="color:#666"> 只有操作权限可以进行"审批"操作</span>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">分配角色：</td>
            <td height="24" colspan="2">
                <select name="rolename" id="rolename">
      	<option value="<%=rs("rolename")%>" selected><%=rs("rolename")%></option>
<%
do while not rs2.eof
%>
    <option value="<%=rs2("rolename")%>"><%=rs2("rolename")%></option>   
<% rs2.movenext
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
