<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If
dim Conn, rs, i
Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from news where newsid="& Request("newsid")
rs.open sql, conn, 3, 2
rs("suggestion_zgld")=request("bosscontent")
rs("danjupd")=12
rs("bossname")=request("bosssign")
rs.update
rs.close

  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('提交成功。');location.href='/asp/step_boss/boss_listnew.asp';</script>")
%>