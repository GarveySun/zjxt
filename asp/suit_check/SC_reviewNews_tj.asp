<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from suit_check where newsid = '"&request("newsid")&"'"
rs.open sql, Conn, 3, 2

rs("suggestion") = request("suggestion")

'判断提交过来的数据是同意的还是打回的
if request("ifagree") = "true" then
	rs("danjupd") = 99
elseif request("ifagree") = "false" then
	rs("danjupd") = 1
else
	rs("danjupd") = 98
end if
rs.update
rs.close
conn.close
Set rs = Nothing
Set Conn = Nothing
Response.Write("<script>alert('审核通过。');location.href='/asp/suit_check/suit_check_reviewlist.asp';</script>")
%>
