<!--#include file ="../config.asp"-->
<%

If Session("logined") <> True Then
	Response.Redirect("/asp/menu.asp?action=quit")
End If

Dim Conn
Dim rs
Dim i
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr

Set rs          = Server.CreateObject("ADODB.Recordset")
sql             = "select * from news where newsid=" & Request("newsid")
rs.open sql, conn, 3, 2
rs("suggestion_mgbz")  = Request("maiguancontent")

If Request("zj_pd_3") = 1 Then'�������
	rs("money") = Request("money")'��¼���󷣿���
ElseIf Request("zj_pd_3") = 2 Then'��������������
	rs("bonus") = Request("money")'��¼���������
Else'����Ҳ����
	rs("money") = 0
	rs("bonus") = 0
End If
rs("zj_pd_3") = request("zj_pd_3")


If rs("zj_pd_3") <> 0 or Request("zj_pd_3") <> 0 Then'���󷣿�/���� ���� �����������/���� ������������
	rs("danjupd") = 5
Else
	rs("danjupd") = 6
End If

rs.update
rs.Close
Conn.Close
Set rs = Nothing
Set Conn = Nothing
Response.Write("<script>alert('��˳ɹ���');location.href='/asp/step_bz/buzhang_list.asp';</script>")%>