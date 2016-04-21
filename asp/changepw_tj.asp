<!--#include file ="config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr



If Session("password")=Request("password") and Request("password1")=Request("password2") Then

	  SQL = "UPDATE users SET password = '"&Request("password1")&"' WHERE userid='"&Session("userid")&"'"
       Set rs = Conn.Execute(SQL)
		Session.Contents.Remove("password")
		Session("password")=Request("password1")
		Result = True
  Else
     Result = False
  End If

    If Result = True Then 
     Response.Redirect("/asp/chgpwdok.asp")  
  Else 
     Response.Redirect("/asp/changepw.asp")  
  End If 


  Set rs = nothing
  Set Conn = nothing
%>
