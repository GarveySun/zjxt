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
<script src="../../js/config.js"></script>
<script language="javascript"> 
function checkvalue()
{
	if(document.form1.suggestion.value=="")
	{
		alert("������д�����");
		return false;
	}
	if(document.form1.content.value=="")
	{
		alert("������д���ݡ�");
		return false;
	}
}

function ifdelete()
{
	if(confirm("ȷ��Ҫɾ���˵���ô���˲������ɻָ���"))
	{
	return true;
	}
	else
	{return false;
	}
}

$(document).ready(function(e) {
	//ͨ���Զ��巽��Ϊ����ѡ�����Ӳ���
	Config.Setdepartment("department");
	Config.Setdepartment("department2");
	//���ӵ������
	Config.Setclassname("classname");
	
	$("#classname").change(function(e){
		$("#typename option").remove();
		$("#typename").append("<option value='all' selected>ȫ��</option>");
		Config.Changetypename("classname","typename");
	});

	$("#typename").on("change",function(e){
		var val_typename = $(this).val();
		if (val_typename==="����") {
			$(this).attr("name","nottypename");
			$("#other_typename").attr("name","typename").show();
		}else{
			$(this).attr("name","typename");
			$("#other_typename").attr("name","nottypename").hide();
		}
	});			
});
</script>
<link href="/css/bill.css" rel="stylesheet" type="text/css">
<TITLE>������Ϣ  ����</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="646">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>�ܼ��޸ĵ���</td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>���ݱ��</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("newsid")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>��������</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>������</td>
      <td><input name="name" type="text" id="name" value="<%=rs("name")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>������</td>
      <td><input name="prisoner" type="text" id="time3" value="<%=rs("prisoner")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>���</td>
       <td width="601" colspan="6" bgcolor="#F9F9F9">
        <select name="classname" id="classname" > 
        <option  value="<%=rs("classname")%>" selected><%=rs("classname")%></option> 
        </select>
		<select name="typename" id="typename"> 
        <option  value="<%=rs("typename")%>" selected><%=rs("typename")%></option> 
        </select>
		<input type="text" id="other_typename" value="" size="20" placeholder="����д">

      </td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>��������</td>
      <td height="2" colspan="6" bgcolor="#F9F9F9">��
        <select name="department" id="department">
      	<option value="<%=rs("department")%>" selected><%=rs("department")%></option>
		<option value="�ܾ���">�ܾ���</option>
        <option value="�г�Ӫ����">�г�Ӫ����</option>
        <option value="ҵ��Ӫ�˲�">ҵ��Ӫ�˲�</option>
        <option value="����">����</option>
        <option value="��ί������">��ί������</option>
        <option value="����">����</option>
        <option value="������Դ��">������Դ��</option>
        <option value="��������">��������</option>
        <option value="��ȫ������">��ȫ������</option>
        <option value="���ڹ���">���ڹ���</option>
        <option value="���˲�">���˲�</option>
        <option value="��ױ���۲�">��ױ���۲�</option>
        <option value="�鱦��Ʒ���۲�">�鱦��Ʒ���۲�</option>
        <option value="Ůװ���۲�">Ůװ���۲�</option>
        <option value="Ƥ�����۲�">Ƥ�����۲�</option>
        <option value="��װ�˶����۲�">��װ�˶����۲�</option>
        <option value="���ö�ͯ���۲�">���ö�ͯ���۲�</option>
        <option value="��������">��������</option>
        <option value="�������۲�">�������۲�</option>
        <option value="���������۲�">���������۲�</option>
      </select>
        ��
        <select name="department2" id="department2">
          <option value="<%=rs("over_char2")%>" selected><%=rs("over_char2")%></option>
       <option value="�ܾ���">�ܾ���</option>
        <option value="�г�Ӫ����">�г�Ӫ����</option>
        <option value="ҵ��Ӫ�˲�">ҵ��Ӫ�˲�</option>
        <option value="����">����</option>
        <option value="��ί������">��ί������</option>
        <option value="����">����</option>
        <option value="������Դ��">������Դ��</option>
        <option value="��������">��������</option>
        <option value="��ȫ������">��ȫ������</option>
        <option value="���ڹ���">���ڹ���</option>
        <option value="���˲�">���˲�</option>
        <option value="��ױ���۲�">��ױ���۲�</option>
        <option value="�鱦��Ʒ���۲�">�鱦��Ʒ���۲�</option>
        <option value="Ůװ���۲�">Ůװ���۲�</option>
        <option value="Ƥ�����۲�">Ƥ�����۲�</option>
        <option value="��װ�˶����۲�">��װ�˶����۲�</option>
        <option value="���ö�ͯ���۲�">���ö�ͯ���۲�</option>
        <option value="��������">��������</option>
        <option value="�������۲�">�������۲�</option>
        <option value="���������۲�">���������۲�</option>
      </select></td>
     
    </tr>
 
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>��ӳ����</td>
      <td><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>��ӳ����</td>
      <td width="540"><textarea name="content" cols="64" rows="9"><%=rs("content")%></textarea></td>
    </tr>

    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>�ܼദ�����������</td>
      <td><textarea name="suggestion" cols="64" rows="5" id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
<%if rs("suggestion_mgbz")="��" then'���ܳ���δ�󣬲������κν��
elseif rs("suggestion_mgbz2")="��" then'����û��������ĵ��ӣ������и�����%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�˿ͷ������</td>
      <td><p><%=rs("suggestion_mgbz")%> </p>
        <% if rs("zj_pd_3") = 1 then %>
        <p style="left:20Px;">�ֽ𴦷� <%=rs("money")%>Ԫ</p>
        <%elseif rs("zj_pd_3")=2 then%>
        <p style="left:20Px;">�ֽ��� <%=rs("bonus")%>Ԫ</p>
        <%else%>
        <p>�����ֽ𴦷�</p>
        <%end if%></td>
    </tr> 
<%else%>    
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�˿ͷ������</td>
      <td><p>���������<%=rs("suggestion_mgbz")%> </p>
        <P>���������<%=rs("suggestion_mgbz2")%> <br />
        <%if rs("zj_pd_3") = 1 and rs("zj_pd_32")= 1 then %>
        <p>�����ֽ𴦷� <%=rs("money")%>Ԫ��������˲ö��������Ϊ<%=rs("money2")%>Ԫ��</p>
        <%elseif rs("zj_pd_3") = 1 and rs("zj_pd_3")= 0 then%>
        <p>�����ֽ𴦷�<%=rs("money")%>Ԫ��������˲ö������ֽ𴦷�</p>
        <%elseif rs("zj_pd_3") = 0 and rs("zj_pd_3")= 0 then%>
        <p>�����ֽ𴦷���</p>
        <%elseif rs("zj_pd_3") = 2 then %>
        <p>�ֽ��� <%=rs("bonus")%>Ԫ��</p>
        <%end if%></td>
    </tr>    
<%end if%>   
    
<%if rs("suggestion_hr")="��" then
elseif rs("suggestion_hr2")="��" then%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>������Դ�����</td>
      <td><p><%=rs("suggestion_hr")%></p>
      </td>
    </tr>
<%else%>     
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center>������Դ�����</td>
      <td><p>���������<%=rs("suggestion_hr")%></p>
      <p>���������<%=rs("suggestion_hr2")%></p>
      </td>
    </tr>   
<%end if%>    
    
<%if rs("suggestion_zgld")="��" then
elseif rs("suggestion_zgld2")="��" then%>      
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�����쵼���</td>
      <td><p><%=rs("suggestion_zgld")%></p>
        �����쵼ǩ�£�
          <input type="text" value="<%=rs("bossname")%>" size="8" readonly />
</td>
    </tr>
<%else%>      
      <tr bgcolor="#FFFFFF" class=small>
      <td align=center>�����쵼���</td>
      <td><p>���������<%=rs("suggestion_zgld")%></p>
      <p>���������<%=rs("suggestion_zgld2")%></p>
        �����쵼ǩ�£�
          <input type="text" value="<%=rs("bossname")%>" size="8" readonly />
      </td>
      </tr>  
<%end if%>     
 
 
 <%if rs("suggestion_zrbm")="��" then'��һ���β������Ϊ�ޣ�����ʾ
elseif rs("over_char2")="��" and rs("suggestion_zrbmr")="��"then'�����ж��Ƿ��еڶ����β���%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>��ز������</td>
      <td><p><%=rs("suggestion_zrbm")%></p>
       ǩ�£�
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%elseif rs("over_char2")="��" and rs("suggestion_zrbmr")<>"��"then%>
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center>��ز������</td>
      <td><p>���������<%=rs("suggestion_zrbm")%></p>
      <p>���������<%=rs("suggestion_zrbmr")%></p>
       ǩ�£�
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%elseif rs("suggestion_zrbmr")="��"then%>
      <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("department")%>���</td>
      <td><p><%=rs("suggestion_zrbm")%></p>
             ǩ�£�
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
      </td>
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("over_char2")%>���</td>
      <td><p><%=rs("suggestion_zrbm2")%></p>
             ǩ�£�
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
      </td>
      </tr>
<%else%>    
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("department")%>���</td>
      <td><p>���������<%=rs("suggestion_zrbm")%></p>
      <p>���������<%=rs("suggestion_zrbmr")%></p>
             ǩ�£�
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />

      </td>
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("over_char2")%>���</td>
      <td><p>���������<%=rs("suggestion_zrbm2")%></p>
      <p>���������<%=rs("suggestion_zrbm2r")%></p>
             ǩ�£�
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
      </td>
    </tr>
<%end if%>     


    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="��  ��" name="send" onClick="form1.action='/asp/step_zj/JK_addNews_xg.asp?newsid=<%=rs("newsid")%>';return checkvalue();">
        <input type="submit" value="ɾ  ��" name="delete" onClick="form1.action='/asp/step_zj/JK_addNews_zjxiugai_tjdelete.asp?newsid=<%=rs("newsid")%>';return ifdelete();">
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
