<!--#include file ="../config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select * from news where newsid=" & Request("newsid")
  rs.open sql, conn, 3, 2 
%>
<HTML>
<HEAD>
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(e) {
    $("#classname").change(function(e) {
        if ($(this).val()=="Υ�͵�")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- ��ѡ�� -</option>");
			$("#typename").append("<option value='ʹ���ֻ�'>ʹ���ֻ�</option>");
			$("#typename").append("<option value='����'>����</option>");
			$("#typename").append("<option value='����'>����</option>");
			$("#typename").append("<option value='��̨˵Ц'>��̨˵Ц</option>");
			$("#typename").append("<option value='˽����Ʒ'>˽����Ʒ</option>");
			$("#typename").append("<option value='�Զ���'>�Զ���</option>");
			$("#typename").append("<option value='ʳƷ�����̨'>ʳƷ�����̨</option>");
			$("#typename").append("<option value='�ϰ๺��'>�ϰ๺��</option>");
			$("#typename").append("<option value='���빤���޹ص���'>���빤���޹ص���</option>");
			$("#typename").append("<option value='ſ����̨'>ſ����̨</option>");
			$("#typename").append("<option value='��������'>��������</option>");
			$("#typename").append("<option value='Υ�;�ʾ'>Υ�;�ʾ</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else if ($(this).val()=="������")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- ��ѡ�� -</option>");
			$("#typename").append("<option value='����Ͷ��'>����Ͷ��</option>");
			$("#typename").append("<option value='��ƷͶ��'>��ƷͶ��</option>");
			$("#typename").append("<option value='Υ�͹�������'>Υ�͹�������</option>");
			$("#typename").append("<option value='���ʷ���'>���ʷ���</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else if ($(this).val()=="�����ӳ��")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- ��ѡ�� -</option>");
			$("#typename").append("<option value='�豸��ʩ'>�豸��ʩ</option>");
			$("#typename").append("<option value='��������'>��������</option>");
			$("#typename").append("<option value='�Ӿ�������'>�Ӿ�����</option>");
			$("#typename").append("<option value='�������'>�������</option>");
			$("#typename").append("<option value='�����Ǳ�'>�����Ǳ�</option>");
			$("#typename").append("<option value='��ǰ��'>��ǰ��</option>");
			$("#typename").append("<option value='Ӫ���߻�'>Ӫ���߻�</option>");
			$("#typename").append("<option value='Ӧ֪Ӧ��'>Ӧ֪Ӧ��</option>");
			$("#typename").append("<option value='���ϼ��'>���ϼ��</option>");
			$("#typename").append("<option value='��Ӫ����'>��Ӫ����</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else if ($(this).val()=="���ﵥ")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- ��ѡ�� -</option>");
			$("#typename").append("<option value='�˿ͱ���'>�˿ͱ���</option>");
			$("#typename").append("<option value='�������'>�������</option>");
			$("#typename").append("<option value='ʰ����'>ʰ����</option>");
			$("#typename").append("<option value='ͳһ�淶'>ͳһ�淶</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- ��ѡ�� -</option>");
		}
    });
});
</script>

<style type="text/css">
#divCollapse
{
    display:block;
    top: 80px;
    right: 3px;             /*�����ұ�3����*/
    position:fixed;    
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #FDDC92;
    padding-bottom: 3px;
    width: 40px;    
    background-color:gold;
}
.topic { font-family: "����"; font-size: 11pt; vertical-align: middle; line-height:16pt;
background-color:#F60}
.small { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:16pt;
background-color:#BDFCC9;}
input,textarea { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
a:link {color:#0F56A3;font-style:normal;cursor:hand;text-decoration:normal}
a:visited {color:#0F56A3;font-style:normal;text-decoration:normal}
a:active {color:#0F56A3;font-style:normal;text-decoration:normal}
a:hover {color:#CC0000;font-style:bold;text-decoration:none}
</style>
<script type="text/javascript">
function confirmif()
{
	if(confirm("ȷ��Ҫ����ҳ�����޸ĵ���ô���ύ�󽫲��ɻָ���"))
	{
	return true;
	}
	else
	{return false;
	}
}
function ifdelete()
{
	if(confirm("ȷ��Ҫ����ɾ�����ŵ���ô��ɾ���󽫲��ɻָ���"))
	{
	return true;
	}
	else
	{return false;
	}
}

</script>

<TITLE>�༭����</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY>
<div id="divCollapse">����</div>
<form action="/asp/edit_jk/jk_edit_tj.asp?newsid=<%=rs("newsid")%>" method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF"  width="646">
    <tr > 
      <td colspan=4 align="center" class=topic>�༭����</td>
    </tr>
    <tr class=small> 
      <td width="96" align=center>��������</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="80" maxlength="80"></td>
    </tr>
    <tr class=small>
      <td align=center>������</td>
      <td><input name="prisoner" type="text" id="time3" value="<%=rs("prisoner")%>" size="80" maxlength="80"></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>���</td>
      <td>
        <select name="classname" id="classname" > 
        <option  value="<%=rs("classname")%>" selected><%=rs("classname")%></option> 
        <option value="Υ�͵�">Υ�͵�</option>
        <option value="������">������</option>
        <option value="�����ӳ��">�����ӳ��</option>
        <option value="���ﵥ">���ﵥ</option>
        </select>
		<select name="typename" id="typename"> 
        <option  value="<%=rs("typename")%>" selected><%=rs("typename")%></option> 
        </select>
      </td>
    </tr>
    <tr class=small>
      <td align=center>��������</td>
      <td height="2" colspan="6" >��
        <select name="department" id="department">
      	<option value="<%=rs("department")%>" selected><%=rs("department")%></option>
		<option value="�ܾ���">�ܾ���</option>
        <option value="�г�Ӫ����">�г�Ӫ����</option>
        <option value="ҵ��Ӫ�˲�">ҵ��Ӫ�˲�</option>
        <option value="����">����</option>
        <option value="��ί������">��ί������</option>
        <option value="����">����</option>
        <option value="������Դ��">������Դ��</option>
        <option value="�˿ͷ���">�˿ͷ���</option>
        <option value="��ȫ������">��ȫ������</option>
        <option value="���ڹ�����">���ڹ�����</option>
        <option value="���˲�">���˲�</option>
        <option value="��ױ���۲�">��ױ���۲�</option>
        <option value="�鱦��Ʒ���۲�">�鱦��Ʒ���۲�</option>
        <option value="Ůװ���۲�">Ůװ���۲�</option>
        <option value="Ƥ�����۲�">Ƥ�����۲�</option>
        <option value="��װ�˶����۲�">��װ�˶����۲�</option>
        <option value="���ö�ͯ���۲�">���ö�ͯ���۲�</option>
        <option value="�������۲�">�������۲�</option>
        <option value="�������۲�">�������۲�</option>
        <option value="���������۲�">���������۲�</option>
      </select>
        ��
        <select name="over_char2" id="over_char2">
          <option value="<%=rs("over_char2")%>" selected><%=rs("over_char2")%></option>
       <option value="�ܾ���">�ܾ���</option>
        <option value="�г�Ӫ����">�г�Ӫ����</option>
        <option value="ҵ��Ӫ�˲�">ҵ��Ӫ�˲�</option>
        <option value="����">����</option>
        <option value="��ί������">��ί������</option>
        <option value="����">����</option>
        <option value="������Դ��">������Դ��</option>
        <option value="�˿ͷ���">�˿ͷ���</option>
        <option value="��ȫ������">��ȫ������</option>
        <option value="���ڹ�����">���ڹ�����</option>
        <option value="���˲�">���˲�</option>
        <option value="��ױ���۲�">��ױ���۲�</option>
        <option value="�鱦��Ʒ���۲�">�鱦��Ʒ���۲�</option>
        <option value="Ůװ���۲�">Ůװ���۲�</option>
        <option value="Ƥ�����۲�">Ƥ�����۲�</option>
        <option value="��װ�˶����۲�">��װ�˶����۲�</option>
        <option value="���ö�ͯ���۲�">���ö�ͯ���۲�</option>
        <option value="�������۲�">�������۲�</option>
        <option value="�������۲�">�������۲�</option>
        <option value="���������۲�">���������۲�</option>
      </select></td>
    </tr>

     <tr class=small>
      <td width="96" align=center>����������ת</td>
       <td>
        <select name="danjupd">
        <option value="<%=rs("danjupd")%>" selected>
		<%if rs("danjupd") = 0 then %>�˿ͷ��񲿳���
	<%elseif rs("danjupd") = 1 then%>������Դ������
    <%elseif rs("danjupd") = 2 then%>�����쵼����
    <%elseif rs("danjupd") = 3 then%>���β��ų����ĵ�
    <%elseif rs("danjupd") = 4 then%>�˿ͷ��񲿸���
    <%elseif rs("danjupd") = 5 then%>������Դ������
    <%elseif rs("danjupd") = 6 then%>�����쵼����
    <%elseif rs("danjupd") = 7 then%>���β��Ÿ����ĵ�
    <%elseif rs("danjupd") = 8 then%>�������
    <%elseif rs("danjupd") = 9 then%>�������ǰȷ��
    <%elseif rs("danjupd") = 12 then%>�����쵼������
    <%elseif rs("danjupd") = 13 then%>�����쵼������
    <%else%>�������
	<%end if%></option>
        <option value="0">�˿ͷ��񲿳���</option>
        <option value="1">������Դ������</option>
        <option value="2">�����쵼����</option>
        <option value="12">�����쵼������</option>
        <option value="3">���β��ų����ĵ�</option>
        <option value="4">�˿ͷ��񲿸���</option>
        <option value="5">������Դ������</option>
        <option value="6">�����쵼����</option>
        <option value="13">�˿ͷ��񲿳���</option>
        <option value="7">���β��Ÿ����ĵ�</option>
        <option value="8">�������</option>
        <option value="9">�������ǰȷ��</option>
        <option value="10">�������</option>
        </select>
    </td>
    </tr>
    <tr class=small>
      <td width="96" align=center>��ӳ����</td>
      <td><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="80"></td>
    </tr>
    <tr class=small> 
      <td width="96" align=center>��ӳ����</td>
      <td width="540"><textarea name="content" cols="64" rows="9"><%=rs("content")%></textarea>
      </td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�ܼദ�����������</td>
      <td><textarea name="suggestion" cols="64" rows="5" id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�Ƿ񽱳�</td>
      <td><select name="zj_pd_3" id="zj_pd_3">
          <option value="<%=rs("zj_pd_3")%>" selected>
          <%if rs("zj_pd_3")=0 then%>�����ֽ𽱳�
          <%elseif rs("zj_pd_3")=1 then%>�ͷ�
          <%elseif rs("zj_pd_3")=2 then%>����
          <%else%>�������<%end if%></option>
          <option value="0">�����ֽ𽱳�</option>
          <option value="1">�ͷ�</option>
          <option value="2">����</option></select><br />������<input name="money" value="<%=rs("money")%>"><br />������<input name="bonus" value="<%=rs("bonus")%>"></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�˿ͷ��񲿳������</td>
      <td><textarea name="suggestion_mgbz" cols="64" rows="5" id="suggestion"><%=rs("suggestion_mgbz")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>������Դ��������</td>
      <td><textarea name="suggestion_hr" cols="64" rows="5" id="suggestion"><%=rs("suggestion_hr")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�����쵼���</td>
      <td><textarea name="suggestion_zgld" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zgld")%></textarea>ǩ���˺ţ�<%=rs("bossname")%></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>��һ���β������</td>
      <td><textarea name="suggestion_zrbm" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbm")%></textarea>ǩ���˺ţ�<%=rs("zrbm_name")%></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�ڶ����β������</td>
      <td><textarea name="suggestion_zrbm2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbm2")%></textarea>ǩ���˺ţ�<%=rs("zrbm_name2")%></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�˿ͷ��񲿸������</td>
      <td><textarea name="suggestion_mgbz2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_mgbz2")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>������Դ���������</td>
      <td><textarea name="suggestion_hr2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_hr2")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�����쵼�������</td>
      <td><textarea name="suggestion_zgld2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zgld2")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>��һ���β��Ÿ������</td>
      <td><textarea name="suggestion_zrbmr" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbmr")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�ڶ����β��Ÿ������</td>
      <td><textarea name="suggestion_zrbm2r" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbm2r")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>�������</td>
      <td><textarea name="suggestion_cw" cols="64" rows="5" id="suggestion"><%=rs("suggestion_cw")%></textarea></td>
    </tr>  
  </table>
<p align=center class=small style="background-color:#FFF">
<input type="submit" name="submit" value="�����޸�" onClick="return confirmif();">
<input type="submit" name="submit" value="����ɾ��" onClick="form1.action='/asp/edit_JK/delete.asp?newsid=<%=rs("newsid")%>';return ifdelete();">
  <input type = "button" name = "button1" value = "�� ��" onClick = "javascript:history.back(-1);">
  
</p>
</form>
<%
rs.close
conn.close
set rs=nothing
set conn=nothing
%>
</BODY>
</HTML>