<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
	Set rs = Server.CreateObject("ADODB.Recordset")
  	rs.open "news", Conn, 3, 2
  	rs.AddNew
	rs("department") = Request("department")
	rs("over_char2")=request("department2")
	rs("prisoner") = Request("prisoner")
	rs("userid")=Session("userid")
	rs("title") = Request("title")
	rs("content") = Request("content")
	rs("suggestion") = Request("suggestion")
	rs("classname")=request("classname")
	rs("typename")=request("typename")
	rs("time")=Year(Now) & "-" & Month(Now) & "-" & Day(Now)&" "&hour(now)&":"&minute(now)
	rs("date")=Year(Now) & "-" & Month(Now) & "-" & Day(Now)
	if request("classname")="������" then
	rs("zj_pd_rk")=0
	rs("zj_pd_7")="�ֳ��Ѿ���"
	else
	rs("zj_pd_rk")=0
	rs("zj_pd_7")="δ���"
	end if
	rs.update
	rs.close
	conn.close
	Set rs = Nothing
	Set Conn = Nothing
	Response.Write("<script>alert('�ύ�ɹ���');location.href='/asp/step_zj/JK_mynews.asp';</script>")
%>
