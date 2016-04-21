<!--#include file ="config.asp"-->
<%
dim conn,rs,sql
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr

  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "select * from news where newsid='"&Request("newsid")&"'"
  rs.open sql,conn,3,2
  if rs("zj_pd_open")=0 then
  rs("zj_pd_open")=1
  rs.update
  end if
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
%>  
