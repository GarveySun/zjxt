<!--#include file ="config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select * from news where newsid=" & Request("newsid")
  rs.open sql, conn, 3, 2 
  rs("zj_pd_open")= "0"
  rs.update
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
  if request("step")=1 Then'step=1返回buzhang_list
  Response.Write("<script>location.href='/asp/step_bz/buzhang_list.asp'</script>") 
  elseif request("step")=2 Then
  Response.Write("<script>location.href='/asp/step_hr/hr_list.asp'</script>") 
  elseif request("step")=3 Then
  Response.Write("<script>location.href='/asp/step_boss/boss_listnew.asp'</script>")
  elseif request("step")=4 Then
  Response.Write("<script>location.href='/asp/step_bm/bm_listnew.asp'</script>")
  elseif request("step")=5 Then
  Response.Write("<script>location.href='/asp/step_cw/cw_list.asp'</script>")
  elseif request("step")=6 Then
  Response.Write("<script>location.href='/asp/step_zj/JK_mynews.asp'</script>")
  else'否则返回所有单据
  Response.Write("<script>location.href='/asp/see_list.asp';</script>") 
end if
%>