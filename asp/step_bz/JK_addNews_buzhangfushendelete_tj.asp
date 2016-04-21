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
rs("suggestion_mgbz2")=request("maiguancontent")
rs("zj_pd_32")=request("zj_pd_3")
rs("money2")=request("money")
rs("zj_pd_open")=0
rs("zj_pd_6")=1'总监撤单标志
if rs("zj_pd_3")=1 then'初审罚款，复审是否罚都过人力备案
rs("danjupd")="5"
elseif rs("zj_pa_3")=0 and request("zj_pd_3")=1 then'初审不罚，复审决定罚款
rs("danjupd")="5"
elseif rs("zj_pa_3")=0 and request("zj_pd_3")=0 then'初审不罚，复审也不罚款
rs("danjupd")="6"
end if
rs.update
rs.close
Conn.close
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('审核成功。');location.href='/asp/step_bz/buzhang_list.asp';</script>")
%>