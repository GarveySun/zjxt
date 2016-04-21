<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
sql = "delete from suit_check where newsid = '"&request("newsid")&"'"
Conn.execute(sql)
conn.close
Set Conn = Nothing
Response.Write("<script>location.href='/asp/suit_check/suit_check_mylist.asp';</script>")
%>
