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

If Request("zj_pd_3") = 1 Then'如果罚款
	rs("money") = Request("money")'记录复审罚款金额
ElseIf Request("zj_pd_3") = 2 Then'如果复审决定奖励
	rs("bonus") = Request("money")'记录复审奖励金额
Else'不罚也不奖
	rs("money") = 0
	rs("bonus") = 0
End If
rs("zj_pd_3") = request("zj_pd_3")


If rs("zj_pd_3") <> 0 or Request("zj_pd_3") <> 0 Then'初审罚款/奖励 或者 复审决定罚款/奖励 都过人力备案
	rs("danjupd") = 5
Else
	rs("danjupd") = 6
End If

rs.update
rs.Close
Conn.Close
Set rs = Nothing
Set Conn = Nothing
Response.Write("<script>alert('审核成功。');location.href='/asp/step_bz/buzhang_list.asp';</script>")%>