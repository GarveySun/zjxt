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

'�ж��ύ������������ͬ��Ļ��Ǵ�ص�
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
Response.Write("<script>alert('���ͨ����');location.href='/asp/suit_check/suit_check_reviewlist.asp';</script>")
%>
