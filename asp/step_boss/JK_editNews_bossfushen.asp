<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select n.*,u.name from news n,users u where n.newsid=" & Request("newsid")&" and n.userid=u.userid order by n.newsid desc"
  rs.open sql, conn, 3, 2
%>
<HTML>
<HEAD>
<link href="/css/bill.css" rel="stylesheet" type="text/css">
<script language="javascript"> 
function checkvalue()
{
	if(document.form1.bosscontent.value=="")
	{
		alert("������д���������");
		return false;
	}
}
function turnback() {
    if (document.form1.bosscontent.value == "") {
        if (confirm("����д�κ������ع˿ͷ�����")) {
            document.form1.action = "/asp/step_boss/JK_editNews_bossturnbackf.asp?newsid=<%=rs("newsid")%>";
            document.form1.submit;
        } else {}
    } else {
        document.form1.action = "/asp/step_boss/JK_editNews_bossturnbackf.asp?newsid=<%=rs("newsid")%>";
        document.form1.submit;
    }
}

</script>
<TITLE>������Ϣ  ����</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="700">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>�����쵼�������</td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>���ݱ��</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("newsid")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>��������</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>������</td>
      <td><input name="name" type="text" id="name" value="<%=rs("name")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>������</td>
      <td><input name="prisoner" type="text" id="time3" value="<%=rs("prisoner")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>���</td>
      <td><input name="class" type="text" id="class" value="<%=rs("classname")%>&mdash;&mdash;<%=rs("typename")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>��������</td>
      <td>��
        <input name="department2" type="text" id="department2" value="<%=rs("department")%>" size="30" maxlength="30" readonly>
        ��
        <input name="department3" type="text" id="department3" value="<%=rs("over_char2")%>" size="41" maxlength="41" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>��ӳ����</td>
      <td><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>��ӳ����</td>
      <td width="540"><textarea cols="64" rows="4" readonly><%=rs("content")%></textarea></td>
    </tr>
    <%
if rs("suggestion")<>"" then
%>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>�ܼദ�����������</td>
      <td><textarea cols="64" rows="4" readonly><%=rs("suggestion")%></textarea></td>
    </tr>
    <%
end if
%>
    <%if rs("suggestion_mgbz")<>"��" then%>
      <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�˿ͷ������</td>
      <td><textarea cols="64" rows="4" readonly><%=rs("suggestion_mgbz")%></textarea>
      </td>
      </tr>
      <tr bgcolor="#FFFFFF" class=small>
      <td align=center>��/��</td>
      <td>
      <%if rs("zj_pd_3") = 0 then%>
      <p>��������</p>
      <%elseif rs("zj_pd_3") = 1 then%>
      <p>����<%=rs("money")%>Ԫ</p>
      <%else%>
      <p>����<%=rs("bonus")%>Ԫ</p>
      <%end if%>
      </td>
      </tr>
      <%end if%>
<%if rs("suggestion_hr")<>"��" then%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>������Դ�����</td>
      <td><textarea cols="64" rows="4" readonly><%=rs("suggestion_hr")%></textarea>
      </td>
    </tr>
<%end if%>    

    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�����쵼���</td>
      <td><textarea name="bosscontent"cols="64" rows="7" class="necessary"><%=rs("suggestion_zgld")%></textarea>ǩ�£�<input type="text" value="<%=rs("bossname")%>" size="8" readonly /><div style="color:#666">����д�������</div></td>
    </tr>
  <%if rs("suggestion_zrbm")<>"��" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("department")%>���</td>
      <td><textarea name="suggestion_zrbm" cols="64" rows="4" readonly><%=rs("suggestion_zrbm")%></textarea>
       ǩ�£�
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>

<%if rs("suggestion_zrbm2")<>"��" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("over_char2")%>���</td>
      <td><textarea name="suggestion_zrbm2" cols="64" rows="4" readonly><%=rs("suggestion_zrbm2")%></textarea>
       ǩ�£�
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>
    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="�� ��" name="send" onClick="form1.action='/asp/step_boss/JK_editNews_bossfushen_tj.asp?newsid=<%=rs("newsid")%>';return checkvalue();">
        <input type="button" value="�� ��" name="button2" onClick="javascript:turnback();">
        <input type="reset" value="�� ��" name="clear">
        <input type = "button" name = "button1" value = "�� ��" onClick = "javascript:history.back(-1);"></td>
    </tr>
  </table>
</form>
<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
