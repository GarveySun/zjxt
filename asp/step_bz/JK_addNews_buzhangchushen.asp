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
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<link href="/css/bill.css" rel="stylesheet" type="text/css">
<TITLE>�˿ͷ������</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="646">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>�˿ͷ�����˵���</td>
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
      <td width="540"><textarea name="content" cols="64" rows="9"><%=rs("content")%></textarea></td>
    </tr>
    <%
if rs("suggestion")<>"" then
%>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>�ܼദ�����������</td>
      <td><textarea name="suggestion" cols="64" rows="5" id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
    <%end if%>
    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�˿ͷ������</td>
      <td><textarea name="maiguancontent" cols="64" rows="5"><%if rs("suggestion_mgbz")<>"��" then response.Write(rs("suggestion_mgbz")) end if%></textarea></td>
      </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td height="48" align=center>�Ƿ񷣿�/����</td>
      <td><select name="zj_pd_3" id="zj_pd_3">
      <%if rs("zj_pd_3")=0 then%>
      <option value="0" selected>��</option>
      <option value="1">����</option>
      <option value="2">����</option>
      <%elseif rs("zj_pd_3")=1 then%>
      <option value="0">��</option>
      <option value="1" selected>����</option>
      <option value="2">����</option>
      <%elseif rs("zj_pd_3")=2 then%>
      <option value="0">��</option>
      <option value="1">����</option>
      <option value="2" selected>����</option>
      <%else%>
      <option value="99">�����쳣,����ϵ������</option>
      <%end if%>
      </select> 
      <span class="money"><input type="text" id="money" name="money" size="10" value="0">
        Ԫ</span></td>
    </tr>

    <%if rs("suggestion_hr")<>"��" then%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>������Դ�����</td>
      <td><p><%=rs("suggestion_hr")%></p>
      </td>
    </tr>
<%end if%>    
    
<%if rs("suggestion_zgld")<>"��" then%>      
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�����쵼���</td>
      <td><p><%=rs("suggestion_zgld")%></p>
        ǩ�£�
          <input type="text" value="<%=rs("bossname")%>" size="8" readonly />
</td>
    </tr>
<%end if%>     

<%if rs("suggestion_zrbm")<>"��" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>��ز������</td>
      <td><p><%=rs("suggestion_zrbm")%></p>
       ǩ�£�
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>

<%if rs("suggestion_zrbm2")<>"��" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>��ز������</td>
      <td><p><%=rs("suggestion_zrbm2")%></p>
       ǩ�£�
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>
    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="�� ��" name="send" id="send" onClick="form1.action='/asp/step_bz/JK_addNews_buzhangchushen_tj.asp?newsid=<%=rs("newsid")%>';return checkform();">
        <input type="submit" value="�� ��" name="delete" onClick="form1.action='/asp/step_bz/JK_addNews_buzhangdelete_tj.asp?newsid=<%=rs("newsid")%>';return ifdelete();">
         <input type="reset" value="�� ��" name="clear">
        <input type = "button" name = "button1" value = "�� ��" onClick = "javascript:history.back(-1);"></td>
    </tr>
  </table>
</form>
<script type="text/javascript">
$(document).ready(function(e) {
	ifmoneyshow();
	$("#zj_pd_3").on("change",function(e){
		ifmoneyshow();
	});
});

function ifmoneyshow(){
	if (document.form1.zj_pd_3.value == 0){
		$(".money").hide();
	}else{
		$(".money").show();
	}

}
 
function checkform(){
	if(document.form1.maiguancontent.value==""){
		alert("������д�����");
		return false;
	}else{
		return true;
	}
};

function ifdelete(){
	if(confirm("ȷ��Ҫ�����˵���ô�������б������ĵ��ݽ�ֱ����⡣")){
		return true;
	}else{
		return false;
	};
};
</script>

<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
