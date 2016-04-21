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
  rs("zj_pd_open")=0
  rs("zj_pd_7")= Request("zj_pd_7")
  rs("danjupd")=10
  rs("zj_pd_rk")=1

  rs.update
  rs.close

  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('入库成功，单据已不能修改。');location.href='/asp/step_zj/JK_mynews.asp';</script>")
%>