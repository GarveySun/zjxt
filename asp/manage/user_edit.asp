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
			   alert("�˺�"+ data +"�ĵ�¼�����Ѿ����á�");
		   });
    });

	//ͨ���Զ��巽��Ϊ����ѡ�����Ӳ���
	Config.Setdepartment("department");

    $("#password").click(function(e) {
        alert('�޷��Զ����޸����룬����"��������"�������á�')
    });
});
</script>
<style type="text/css">
<!--
.topic { font-family: "����"; font-size: 11; vertical-align: middle; line-height:16pt;}
.small { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
-->
</style>

<TITLE>��ӽ�ɫ</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 
<form action="/asp/manage/user_edit_tj.asp" method="post" name="form1">

  <p>&nbsp;</p>
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="605">
    <tr bgcolor="#FF8080"> 
      <td colspan=5 align="center" height="25">�༭�û�</td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">��¼�˺ţ�</td>
      <td height="24" colspan="2">
         <%=rs("userid")%><input type="text" name="userid" value="<%=rs("userid")%>" style="display:none"> 

    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">������</td>
      <td height="24" colspan="2">
        <input type="text" name="name" size="20" value="<%=rs("name")%>" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">���룺</td>
      <td height="24" colspan="2">
        <input name="password" id="password" value="����������������" size="20" maxlength="20" readonly> <input type = "button" id="reset" name = "button3" value = "��������"/><span style="color:#666"> ���óɳ�ʼ����"2"</span></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">���ţ�</td>
      <td height="24" colspan="2">
                <select name="department" id="department">
      	<option value="<%=rs("department")%>" selected><%=rs("department")%></option>
      </select>
      </td>
    </tr>

     <tr bgcolor="#FFFFFF" class=small> 
      <td align=right width="113" height="24">Ȩ�޷�Χ��</td>
      <td height="24" colspan="2">
      <select name="seecheck" id="seecheck" >
      <option value="<%=rs("seecheck")%>" selected><%=rs("seecheck")%></option>
       <option value="�鿴">�鿴</option>
        <option value="����">����</option>
      </select>
      <span style="color:#666"> ֻ�в���Ȩ�޿��Խ���"����"����</span>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=right height="24">�����ɫ��</td>
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
      <td align=center colspan=3><input type="submit" value="�� ��" name="send">
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
