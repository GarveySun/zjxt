<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
 Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr


  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select * from news where newsid=" & Request("newsid")
  rs.open sql, conn, 3, 2
  rs.delete
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('É¾³ý³É¹¦¡£');location.href='/asp/step_zj/jk_mynews.asp';</script>")
%>