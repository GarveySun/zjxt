<!--#include file ="../config.asp"-->
<%
If Session("logined") <> True Then
   Response.Redirect("/asp/menu.asp?action=quit")
End If
dim Conn, rs, i
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from news where newsid="& Request("newsid")
rs.open sql, conn, 3, 2

'���û���븴��
if request("again") = 0 and rs("again") = 0 then
	'ֻ��һ�����β���
	if rs("over_char2") = "��" then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		if rs("zj_pd_3")<> 0 then
			rs("danjupd") = 8
		else
			rs("danjupd") = 9
		end if
	'�������β���,��ô����ǰ�����ǵ�һ���β��ŵĻ�
	elseif rs("department")=session("department") then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		'�����һ���β���д�˽��飨���󣩣���δ���򵥾�״̬����ת
		if rs("suggestion_zrbm2") <> "��" then
			if rs("zj_pd_3")<> 0 then
				rs("danjupd") = 8
			else
				rs("danjupd") = 9
			end if
		end if
	'�������β��ţ���ǰ���Ų��ǵ�һ���β��ţ�����suggestion2д��
	else
		rs("suggestion_zrbm2")=request("bmcontent")
		rs("zrbm_name2")=request("bmsign")
		rs("bmreplypd")=session("department")
		if rs("suggestion_zrbm") <> "��" then
			if rs("zj_pd_3")<> 0 then
				rs("danjupd") = 8
			else
				rs("danjupd") = 9
			end if
		end if
	end if
'���븴����
else
	'ֻ��һ�����β��ţ�����ת������
	if rs("over_char2") = "��" then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		rs("danjupd")=4
		rs("again")=1
	'���򣨲�ֹ1�����β��ţ�������ǰ�ǵ�һ���β�����
	elseif rs("department")=session("department") then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		rs("again")=1
		if rs("suggestion_zrbm2") <> "��" then
			  rs("danjupd") = 4
		end if
	'���򣨲�ֹ1�����β��ţ�������ǰ�ǵڶ����β�����
	else
		rs("suggestion_zrbm2")=request("bmcontent")
		rs("zrbm_name2")=request("bmsign")
		rs("bmreplypd")=session("department")
		rs("again")=1
		if rs("suggestion_zrbm") <> "��" then
			rs("danjupd") = 4
		end if

	end if

end if
	
	
	
rs.update
rs.close

  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('�ύ�ɹ���');location.href='/asp/step_zj/JK_mynews.asp';</script>")
%>