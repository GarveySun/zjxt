<!--#include file ="../config.asp"-->
<%
If Session("logined") <> True Then
	Response.Redirect("menu.asp?action=quit")
End If

Dim Conn
Dim rs
Dim i
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr

Set rs          = Server.CreateObject("ADODB.Recordset")
sql             = "select * from news where newsid=" & Request("newsid")
rs.open sql, conn, 3, 2
rs("content")  = Request("content")
rs("suggestion")  = Request("suggestion")
rs("suggestion_mgbz")  = Request("maiguancontent")
rs("zj_pd_3")  = Request("zj_pd_3")

rs("zj_pd_rk")  = 0
rs("zj_pd_open")  = 0

If Request("zj_pd_3") = 1 Then'罚款的
	rs("over_char1") = "未交罚款"
	rs("danjupd") = 1
	rs("money") = Request("money")
ElseIf Request("zj_pd_3") = 2 Then'奖励的
	rs("over_char1") = "未发奖励"
	rs("danjupd") = 1
	rs("bonus") = Request("money")
Else'不罚款也不奖励的
	rs("over_char1") = "0"
	rs("danjupd") = 2
End If

rs.update
rs.Close

Set rs = Nothing
Set Conn = Nothing
Response.Write("<script>alert('审核成功。');location.href='/asp/step_bz/buzhang_list.asp';</script>")
%>