<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
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
<TITLE>��д��װ������</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 <p>&nbsp;</p>
<form method="post" name="form1" enctype="multipart/form-data">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="700">
    <tr bgcolor="#FF4242"> 
      <td colspan=9 align="center" class=topic>��װ������</td>
    </tr>
    <tr class=small>
      <td width="600" align=right bgcolor="#F9F9F9">�ύ���ţ�</td>
      <td height="2" colspan="6" bgcolor="#F9F9F9">
        <select name="department" id="department">
      	<option value="" selected></option>
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
       </td>
    </tr>
    <tr class=small>
      <td width="600" height="1" align=right bgcolor="#F9F9F9">�ύ�ˣ�</td>
      <td bgcolor="#F9F9F9" colspan="6"><input name="name" type="text" id="name" value="<%=Session("name")%>" size="66" maxlength="64" readonly></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right bgcolor="#F9F9F9">ר�����ƣ�</td>
      <td bgcolor="#F9F9F9" colspan="6"><input type="text" name="shoppe" size="100" maxlength="50" value="" id="shoppe"></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right bgcolor="#F9F9F9">��װʱ�䣺</td>
      <td bgcolor="#F9F9F9" colspan="6"><input type="text" name="dresstime" size="100" maxlength="50" value="" id="dresstime"></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right bgcolor="#F9F9F9">�ϴ���Ƭ��</td>
      <td bgcolor="#F9F9F9" colspan="6"><input class="fileinput" type="file" name="pic[]" value=""><br /><input class="fileinput" type="file" name="pic[]" value=""><br /><input class="fileinput" type="file" name="pic[]" value=""><br /><input class="fileinput" type="file" name="pic[]" value=""></td>
    </tr>
    <tr class=small>
      <td width="600" height="16" align=right bgcolor="#F9F9F9">��ע˵����</td>
      <td bgcolor="#F9F9F9" colspan="6"><textarea name="content" rows="10" cols="70"></textarea></td>
    </tr>
   
    <tr class=small>
      <td width="600" height="30" align=right bgcolor="#F9F9F9">�ύ���ڣ�</td>
      <td colspan="6" bgcolor="#F9F9F9"><input name="time" type="text" id="time" value="" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td align=center colspan=7 bgcolor="#ffefbf">
        <input type="button" name="onsubmit" id="onsubmit" value="�� ��" >
        <input type = "button" name = "button1" value = "�� ��" onclick = "javascript:history.back(-1);">
        </td>
    </tr>

  </table>

</form>
 
<script language="javascript">
var date = new Date();
    wdate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()
wdate += " " + date.getHours()+":"+ date.getMinutes();
document.form1.time.value = wdate;

$(document).ready(function(e) {
    $("#onsubmit").on('click',function(e) {
		$(".fileinput").each(function(e) {
            if($(this).val()==="") {
				$(this).remove();
			}
        });
		document.form1.action = "/asp/suit_check/upload.php";
		document.form1.submit();
	});
});

</script>
</BODY>
</HTML>
