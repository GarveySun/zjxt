<HTML>
<HEAD>
<script src="../jquery/jquery-1.9.1.min.js"></script>
<script language = "JavaScript">
var rolename = "<%=session("rolename")%>",
	department = "<%=session("department")%>"
	
 $(document).ready(function(e) {
	$("#startid,#endid").keyup(function(e) {
        if ($("#startid").val()==="" && $("#endid").val()==="") {
			$("#tips").hide();
		}else{
			$("#tips").show();
		}
    });
	
	if (rolename === "��������Ա" ||department === "�˿ͷ���") {
	}else{
		var obj = document.getElementById("department");
		obj.options.length = 0;
		obj.add(new Option(department,department));
	}
});
</script>
<style type="text/css">
<!--
.topic { font-family: "����"; font-size: 11pt; vertical-align: middle; line-height:16pt;}
.small { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
a:link {color:#0F56A3;font-style:normal;cursor:hand;text-decoration:normal}
a:visited {color:#0F56A3;font-style:normal;text-decoration:normal}
a:active {color:#0F56A3;font-style:normal;text-decoration:normal}
a:hover {color:#CC0000;font-style:bold;text-decoration:none}
table{border-collapse:collapse;border:none;}
td{border:solid #000000 1px}
-->
</style>
<TITLE>��ѯ��װ������</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<p>&nbsp;</p>
<form method="post" name="form1">
<table align=center cellspacing="0" cellpadding="1" width="700">
          <tr bgcolor="#00cc66">
            <td colspan="2" align="center"><span class="topic">��ѯ��װ������</span></td>
          </tr>
          <tr class="small">
            <td width="144" align="right">�ύ���ڣ�</td>
            <td width="523">
              <input name="startdate" type="text" id="startdate" style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-01"%>" >&mdash;&mdash;
            <input name="enddate" type="text" id="enddate"  style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" ></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>���ݱ�ţ�</td>
            <td><input style="width:100px" name="startid" type="text" id="startid" value="">&mdash;&mdash;
            <input style="width:100px" name="endid" type="text" id="endid" value="">
            <span id="tips" style="color:#666; display:none">��ʾ������޶����ݱ�ţ�������ά�ȡ�����ʧЧ��</span></td>
          </tr>
          <tr class="small">
            <td align=right>�������ţ�</td>
            <td><select style="width:140px"  name="department" id="department">
              <option value="all" selected>ȫ��</option>
              <option value="�ܾ���">�ܾ���</option>
              <option value="�г�Ӫ����">�г�Ӫ����</option>
              <option value="ҵ��Ӫ�˲�">ҵ��Ӫ�˲�</option>
              <option value="����">����</option>
              <option value="��ί������">��ί������</option>
              <option value="����">����</option>
              <option value="������Դ��">������Դ��</option>
              <option value="�˿ͷ���">�˿ͷ���</option>
              <option value="��ȫ������">��ȫ������</option>
              <option value="�������ڲ�">�������ڲ�</option>
              <option value="���˲�">���˲�</option>
              <option value="��ױ���۲�">��ױ���۲�</option>
              <option value="�鱦��Ʒ���۲�">�鱦��Ʒ���۲�</option>
              <option value="Ůװ���۲�">Ůװ���۲�</option>
              <option value="��װ�˶����۲�">��װ�˶����۲�</option>
              <option value="Ƥ�����۲�">Ƥ�����۲�</option>
              <option value="���ö�ͯ���۲�">���ö�ͯ���۲�</option>
              <option value="�������۲�">�������۲�</option>
              <option value="�������۲�">�������۲�</option>
              <option value="���������۲�">���������۲�</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>��������</td>
            <td>
            <select style="width:140px" name="danjupd" id="danjupd">
              <option value="all" selected>ȫ��</option>
              <option value="0">δ���</option>
              <option value="99">���ͨ��</option>
              <option value="1">���δͨ��</option>
            </select></td>
          </tr>
          <tr class="small">
            <td align=right>ר�����ƣ�</td>
            <td><input name="shoppe" type="text" id="shoppe" value=""></td>
          </tr>
          

          <tr class="small">
            <td align=center colspan=2><input type="submit" value="�� ѯ" name="send" onClick="form1.action='SC_select_tj_serch.asp';"> 
            <input type = "button" name = "button1" value = "�� ��" onClick = "javascript:history.back(-1);"></td>
          </tr>
        </table>
</form>
</BODY>
</HTML>
