<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open "suit_check", Conn, 3, 2
rs.AddNew
rs("dresstime") = request("dresstime")
rs("time") = request("time")
rs("department") = request("department")
rs("shoppe") = request("shoppe")
rs("proposer") = request("name")
rs("content") = request("content")
rs("picname0") = request("picname0")
rs("picname1") = request("picname1")
rs("picname2") = request("picname2")
rs("picname3") = request("picname3")
rs("danjupd") = 0
rs.update
rs.close
conn.close
Set rs = Nothing
Set Conn = Nothing
Response.Write("<script>alert('提交成功。');location.href='/asp/suit_check/suit_check_mylist.asp';</script>")
%>
