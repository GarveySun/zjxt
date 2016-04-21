<!--#include file="../md5.asp"-->
<!--#include file ="../config.asp"-->
<%

  If Session("logined") <> True Then
     Response.Redirect("µÇÂ¼³¬Ê±")
  else  
     dim Conn, rs, str
       Set Conn = Server.CreateObject("ADODB.Connection")
       Conn.Open DBstr
       Set rs = Server.CreateObject("ADODB.Recordset")
       sql="SELECT * FROM users where userid='"& Request("userid")&"'"
       rs.open sql,conn,3,2 
	   'rs("password")=ASP_MD5("2")
	   rs("password")=2
	   rs.update
	   str=rs("userid")
     Set rs = Nothing
     Set Conn = Nothing
     response.write(str)
    End If
%>