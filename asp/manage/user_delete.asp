<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "select * from users where userid='"&request("userid")&"'"
  rs.open sql, Conn, 3, 2
  rs.delete 
  rs.close
  Set rs = Nothing
  Set Conn = Nothing
  Response.Redirect("/asp/manage/users_list.asp")
%>