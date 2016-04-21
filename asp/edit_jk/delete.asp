<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  SQL = "insert into newsdel select * from news where newsid='" & Request("newsid")&"'"
  rs.open SQL, Conn, 3, 2
  SQL = "delete from news where newsid='" & Request("newsid")&"'"
  rs.open SQL, Conn, 3, 2
  Set rs = Nothing
  Set Conn = Nothing
  Response.Redirect("/asp/edit_JK/edit_list.asp")
%>
