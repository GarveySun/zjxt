<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql="SELECT * FROM news where newsid='"& Request("newsid")&"'"
  rs.open sql,conn,3,2
	rs("time")=request("time")
	rs("prisoner")=request("prisoner")
	rs("department")=request("department")
	rs("over_char2")=request("over_char2")
	rs("title")=request("title")
	rs("content")=request("content")
	rs("suggestion")=request("suggestion")
	rs("zj_pd_3")=request("zj_pd_3")
	rs("money")=request("money")
	rs("bonus")=request("bonus")
	rs("suggestion_mgbz")=request("suggestion_mgbz")
	rs("suggestion_hr")=request("suggestion_hr")
	rs("suggestion_zgld")=request("suggestion_zgld")
	rs("suggestion_zrbm")=request("suggestion_zrbm")
	rs("suggestion_zrbm2")=request("suggestion_zrbm2")
	rs("suggestion_mgbz2")=request("suggestion_mgbz2")
	rs("suggestion_hr2")=request("suggestion_hr2")
	rs("suggestion_zgld2")=request("suggestion_zgld2")
	rs("suggestion_zrbmr")=request("suggestion_zrbmr")
	rs("suggestion_zrbm2r")=request("suggestion_zrbm2r")
	rs("suggestion_cw")=request("suggestion_cw")
	rs("danjupd")=request("danjupd")
	rs("zj_pd_open")=0
	rs.update
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('±£´æ³É¹¦¡£');location.href='/asp/edit_jk/edit_list.asp';</script>")

%>