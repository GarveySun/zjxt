<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script src="../../js/config.js"></script>
<script language="javascript">
function checkvalue()
{
if(document.getElementById("classname").value==""||document.getElementById("typename").value=="")
{alert("��ѡ�����");
return false;
}
if(document.getElementById("department").value=="")
{alert("��ѡ���������š�");
return false;
}
if(document.form1.prisoner.value=="")
{alert("����д�����ˡ�");
return false;
}
if(document.form1.title.value=="")
{alert("����д���⡣");
return false;}
if(document.form1.content.value=="")
{alert("����д���ݡ�");
return false;
}
if(document.getElementById("department").value==document.getElementById("department2").value)
{alert("��ѡ��ͬ���������š�");
return false;
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
});
</script>
<STYLE type=text/css>
.topic { font-family: "����"; font-size: 11pt; vertical-align: middle; line-height:16pt;}
.small { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
BODY {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
TD {
	COLOR:#000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
DIV {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
A:link {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
A:hover {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: underline
}
A:visited {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
A:active {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; TEXT-DECORATION: underline
}
.h1 {
	COLOR: #000000; FONT-FAMILY: "����"; FONT-SIZE: 12px; LETTER-SPACING: 3px; TEXT-DECORATION: none; TEXT-INDENT: 20px; VERTICAL-ALIGN: 500%
}
</STYLE>
<TITLE>��д��ӳ��</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 <p>&nbsp;</p>
<form  onSubmit="return checkvalue();" action="/asp/step_zj/JK_addNews_tj.asp" method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="707">
    <tr bgcolor="#FF4242"> 
      <td colspan=9 align="center" class=topic>��д��ӳ��</td>
    </tr>
    <tr class=small>
      <td width="601" height="2" align=right bgcolor="#F9F9F9">���</td>
      <td width="601" colspan="6" bgcolor="#F9F9F9">
        <select name="classname" id="classname" > 
        <option  value="" selected>- ��ѡ�� -</option> 
        </select>
		<select name="typename" id="typename"> 
        <option  value="" selected>- ��ѡ�� -</option> 
        </select>
      </td>
    </tr>
    <tr class=small>
      <td width="601" align=right bgcolor="#F9F9F9">���β���</td>
      <td height="2" colspan="6" bgcolor="#F9F9F9">��
        <select name="department" id="department">
      	<option value="" selected>��ѡ��</option>
      </select>
        ��
        <select name="department2" id="department2">
          <option value="��" selected>��</option>
      </select></td>
    </tr>
    <tr class=small>
      <td width="601" height="1" align=right bgcolor="#F9F9F9">������</td>
      <td bgcolor="#F9F9F9" colspan="6"><input name="prisoner" type="text" id="prisoner" value="" size="66" maxlength="16"></td>
    </tr>
    <tr class=small>
      <td width="601" height="1" align=right bgcolor="#F9F9F9">������</td>
      <td bgcolor="#F9F9F9" colspan="6"><input name="name" type="text" id="name" value="<%=Session("name")%>" size="66" maxlength="64" readonly></td>
    </tr>
    <tr class=small>
      <td width="601" height="8" align=right bgcolor="#F9F9F9">��ӳ����</td>
      <td bgcolor="#F9F9F9" colspan="6"><input type="text" name="title" size="100" maxlength="50" value="" id="title"></td>
    </tr>
    <tr class=small>
      <td width="601" height="16" align=right bgcolor="#F9F9F9">��ӳ����</td>
      <td bgcolor="#F9F9F9" colspan="6"><textarea name="content" rows="10" cols="70"></textarea></td>
    </tr>
    <tr class=small>
      <td width="601" align=right bgcolor="#F9F9F9">�������������</td>
      <td colspan="6" bgcolor="#F9F9F9"><textarea name="suggestion" rows="10" cols="70" id="suggestion"></textarea></td>
    </tr>
    <tr class=small>
      <td width="601" height="30" align=right bgcolor="#F9F9F9">��������</td>
      <td colspan="6" bgcolor="#F9F9F9"><input name="time" type="text" id="time" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td align=center colspan=7 bgcolor="#ffefbf"><label>
        <input type="submit" name="onsubmit" id="onsubmit" value="�� ��" >
      </label>
        <input type="reset" value="�� ��" name="clear">
        <input type = "button" name = "button1" value = "�� ��" onclick = "javascript:history.back(-1);">
        </td>
    </tr>

  </table>

</form>
 
<p align=center class=small>&nbsp; </p>
</BODY>
</HTML>
