<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("menu.asp?action=quit")
  End If

%>
<HTML>
<HEAD>
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<style type="text/css">
<!--
.topic { font-family: "宋体"; font-size: 11; vertical-align: middle; line-height:16pt;}
.small { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
-->
</style>
<script type="text/javascript">
$(document).ready(function(e) {
    $("#checkboxzj").change(function(e) {
        if($("input:[id='checkboxzj']:checked").val()=='on'){
			$(".chzj").attr("checked",'true');
		}else{
			$(".chzj").removeAttr("checked");
		}
    });
    $("#checkboxbz").change(function(e) {
        if($("input:[id='checkboxbz']:checked").val()=='on'){
			$(".chbz").attr("checked",'true');
		}else{
			$(".chbz").removeAttr("checked");
		}
    });
    $("#checkboxbm").change(function(e) {
        if($("input:[id='checkboxbm']:checked").val()=='on'){
			$(".chbm").attr("checked",'true');
		}else{
			$(".chbm").removeAttr("checked");
		}
    });


});
</script>
<TITLE>添加角色</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 
<form action="role_addnew_tj.asp" method="post" name="form1">

  <p>&nbsp;</p>
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="605">
    <tr bgcolor="#FF8080"> 
      <td colspan=5 align="center" height="25">添加角色</td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">角色名：</td>
      <td height="24" colspan="2">
        <input type="text" name="rolename" size="20" placeholder="请填入角色名称" maxlength="20">
      </td>
    </tr>
     <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">可用状态：</td>
      <td height="24" colspan="2">
      <select name="enable" id="enable">
       <option value="1" selected>启用</option>
        <option value="0">禁用</option>
      </select> 
      </td>
    </tr>
    <tr bgcolor="#eaeaf4" class=small>
      <td height="24" colspan="3" align=center><span class="topic">角色权限
          </span></td>
    </tr>
 <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">单据：</td>
      <td width="171" height="24">我的单据</td>
      <td width="307"><label>
        <input name="checkbox1" type="checkbox" id="checkbox1" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"'and enable=1 and permissionname like '我的单据'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        >
      </label></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">提交新单</td>
      <td><input name="checkbox2" type="checkbox" id="checkbox2" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"'and enable=1  and permissionname like '提交新单'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">顾服审批</td>
      <td><input name="checkbox3" type="checkbox" id="checkbox3" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"'and enable=1 and permissionname like '顾服审批'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">主管领导审批</td>
      <td><input name="checkbox4" type="checkbox" id="checkbox4" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '主管领导审批'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">人力备案</td>
      <td><input name="checkbox5" type="checkbox" id="checkbox5" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '人力备案'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">财务备案</td>
      <td><input name="checkbox6" type="checkbox" id="checkbox6" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '财务备案'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
        <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">工服：</td>
      <td height="24">我的申报</td>
      <td><input name="checkbox11" type="checkbox" id="checkbox11" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '我的申报'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>

    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">工服审批</td>
      <td><input name="checkbox12" type="checkbox" id="checkbox12" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '工服审批'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">查询：</td>
      <td height="24">查询奖惩单</td>
      <td><input name="checkbox21" type="checkbox" id="checkbox21" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '查询奖惩单'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">工服审批单</td>
      <td><input name="checkbox22" type="checkbox" id="checkbox22" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '工服审批单'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">管理：</td>
      <td height="24">修改密码</td>
      <td><input name="checkbox31" type="checkbox" id="checkbox31" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '修改密码'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">角色管理</td>
      <td><input name="checkbox32" type="checkbox" id="checkbox32" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '角色管理'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">用户管理</td>
      <td><input name="checkbox33" type="checkbox" id="checkbox33" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '用户管理'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
        <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">&nbsp;</td>
      <td height="24">修改单据</td>
      <td><input name="checkbox34" type="checkbox" id="checkbox34" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '修改单据'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>    <tr bgcolor="#ffefbf"> 
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
