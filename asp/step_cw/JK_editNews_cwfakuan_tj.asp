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
rs("suggestion_cw")=request("suggestion_cw")
rs("zj_pd_open")=0
rs("danjupd")=9
rs("cw_name")=request("cwsign")
if rs("zj_pd_3")=1 then
rs("over_char1")="已缴罚款"
else
rs("over_char1")="已发奖励"
end if
rs.update
rs.close

  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('提交成功。');location.href='/asp/step_cw/cw_list.asp';</script>")
%>