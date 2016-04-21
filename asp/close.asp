<!--#include file ="config.asp"-->
<%' If Session("logined") <> True Then
'     Response.Redirect("menu.asp?action=quit")
'  End If
  dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select * from news where newsid=" & Request("newsid")
  rs.open sql, conn, 3, 2 
  rs("zj_pd_open") = "0"
  rs.update
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing

Response.write ("<script>window.opener=null;window.close()</script>")
%>
