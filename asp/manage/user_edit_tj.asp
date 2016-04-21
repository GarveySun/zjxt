<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql="SELECT * FROM users where userid='"& Request("userid")&"'"
  rs.open sql,conn,3,2
	rs("userid")=request("userid")
	rs("name")=request("name")
	rs("department")=request("department")
	rs("over_char")="正常"
	rs("seecheck")=request("seecheck")
	rs("rolename")=request("rolename")
	rs.update
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('保存成功。');location.href='/asp/manage/users_list.asp';</script>")

%>