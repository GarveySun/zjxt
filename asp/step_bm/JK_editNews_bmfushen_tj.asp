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
  if rs("over_char2")="��" then'ֻ��һ�����β���
	rs("suggestion_zrbm")=request("bmcontent")
	rs("suggestion_zrbmr")=request("bmcontent")
	rs("zrbm_name")=request("bmsign")
	rs("bmreplypd")=session("department")
	if rs("zj_pd_3") <> 0 then
		rs("danjupd")=8
	else
		rs("danjupd")=9
	end if
  else'�������β���
  	if rs("department")=session("department") then'��ǰ�ǵ�һ���β���
		if rs("suggestion_zrbm2r")<>"��" then'�ڶ����β��Ŷ������������
			if rs("zj_pd_3") <> 0 then
				rs("danjupd")=8
			else
				rs("danjupd")=9
			end if
		end if
		rs("suggestion_zrbm")=request("bmcontent")
		rs("suggestion_zrbmr")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
	else'��ǰ�ǵڶ����β���
		if rs("suggestion_zrbmr")<>"��" then'��һ���β��Ŷ������������
			if rs("zj_pd_3") <> 0 then
				rs("danjupd")=8
			else
				rs("danjupd")=9
			end if
		end if
		rs("suggestion_zrbm2")=request("bmcontent")
		rs("suggestion_zrbm2r")=request("bmcontent")
		rs("zrbm_name2")=request("bmsign")
		rs("bmreplypd")=session("department")
	end if
  end if
rs.update
rs.close

  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('�ύ�ɹ���');location.href='/asp/step_zj/JK_mynews.asp';</script>")
%>