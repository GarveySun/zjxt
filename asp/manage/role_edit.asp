<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select * from roles where roleid='" & Request("roleid")&"'"
  rs.open sql, conn, 3, 2 
%>
<HTML>
<HEAD>
<style type="text/css">
<!--
.topic { font-family: "����"; font-size: 11; vertical-align: middle; line-height:16pt;}
.small { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
a:link {color:#0F56A3;font-style:normal;cursor:hand;text-decoration:normal}
a:visited {color:#0F56A3;font-style:normal;text-decoration:normal}
a:active {color:#0F56A3;font-style:normal;text-decoration:normal}
a:hover {color:#CC0000;font-style:bold;text-decoration:none}
-->
</style>
<TITLE>��ɫ����</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 
<form action="role_edit_tj.asp?roleid=<%=Request("roleid")%>" method="post" name="form1">

  <p>&nbsp;</p>
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="605">
    <tr bgcolor="#FF8080"> 
      <td colspan=5 align="center" height="25">��ɫ����</td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113">��ɫID��</td>
      <td colspan="2">
       <input align="middle" type="text" name="roleid" value="-<%=rs("roleid")%>-" size="20"readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">��ɫ����</td>
      <td height="24" colspan="2">
        <input type="text" name="rolename" size="20" value="<%=rs("rolename")%>" maxlength="20">
      </td>
    </tr>
     <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">����״̬��</td>
      <td height="24" colspan="2">
      <select name="enable" id="enable">
        <option value="<%=rs("enable")%>" selected><%if rs("enable")=1 then%>����<%else%>����<%end if%></option>
       <option value="1">����</option>
        <option value="0">����</option>
      </select> 
      </td>
    </tr>
    <tr bgcolor="#eaeaf4" class=small>
      <td height="24" colspan="3" align=center><span class="topic">��ɫȨ��</span></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">���ݣ�</td>
      <td width="171" height="24">�ҵĵ���</td>
      <td width="307"><label>
        <input name="checkbox1" type="checkbox" id="checkbox1" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"'and enable=1 and permissionname like '�ҵĵ���'"
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
      <td height="24">�ύ�µ�</td>
      <td><input name="checkbox2" type="checkbox" id="checkbox2" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"'and enable=1  and permissionname like '�ύ�µ�'"
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
      <td height="24">�˷�����</td>
      <td><input name="checkbox3" type="checkbox" id="checkbox3" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"'and enable=1 and permissionname like '�˷�����'"
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
      <td height="24">�����쵼����</td>
      <td><input name="checkbox4" type="checkbox" id="checkbox4" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '�����쵼����'"
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
      <td height="24">��������</td>
      <td><input name="checkbox5" type="checkbox" id="checkbox5" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '��������'"
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
      <td height="24">���񱸰�</td>
      <td><input name="checkbox6" type="checkbox" id="checkbox6" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '���񱸰�'"
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
      <td align=right height="24">������</td>
      <td height="24">�ҵ��걨</td>
      <td><input name="checkbox11" type="checkbox" id="checkbox11" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '�ҵ��걨'"
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
      <td height="24">��������</td>
      <td><input name="checkbox12" type="checkbox" id="checkbox12" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '��������'"
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
      <td align=right height="24">��ѯ��</td>
      <td height="24">��ѯ���ӵ�</td>
      <td><input name="checkbox21" type="checkbox" id="checkbox21" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '��ѯ���ӵ�'"
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
      <td height="24">����������</td>
      <td><input name="checkbox22" type="checkbox" id="checkbox22" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '����������'"
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
      <td align=right height="24">����</td>
      <td height="24">�޸�����</td>
      <td><input name="checkbox31" type="checkbox" id="checkbox31" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '�޸�����'"
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
      <td height="24">��ɫ����</td>
      <td><input name="checkbox32" type="checkbox" id="checkbox32" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '��ɫ����'"
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
      <td height="24">�û�����</td>
      <td><input name="checkbox33" type="checkbox" id="checkbox33" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '�û�����'"
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
      <td height="24">�޸ĵ���</td>
      <td><input name="checkbox34" type="checkbox" id="checkbox34" value="1"
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "Select * from rolepermission where roleid='" & Request("roleid")&"' and enable=1 and permissionname like '�޸ĵ���'"
	rs.open sql, conn, 3, 2 
		If rs.Eof and rs.bof Then
			response.Write ""
		else
			response.Write "checked"
		end if
%>
        ></td>
    </tr>
    <tr bgcolor="#ffefbf"> 
      <td align=center colspan=3> 
        <input type="submit" value="�� ��" name="send">
        <input type = "button" name = "button1" value = "�� ��" onclick = "javascript:history.back(-1);" /></td>
    </tr>
  </table>
</form>

<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
