<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("menu.asp?action=quit")
  End If
dim Conn, rs, i
Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from news where newsid="& Request("newsid")
rs.open sql, conn, 3, 2
rs("suggestion_mgbz")=request("maiguancontent")
rs("zj_pd_3")=request("zj_pd_3")
rs("money")=request("money")
rs("zj_pd_open")=0
rs("zj_pd_6")=1
rs("danjupd")="10"
rs("zj_pd_rk")=1
rs("zj_pd_7")="总监撤单"
rs.update
rs.close
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('撤单成功。');location.href='/asp/step_bz/buzhang_list.asp';</script>")
%>