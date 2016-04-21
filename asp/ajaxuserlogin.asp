<!--#include file ="config.asp"-->
<% 
dim userid,password,Conn, rs
userid=request("userid")
password=request("password")
  Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr

  If ValidPersonal(userid, password) = True Then 
    response.write("yes")
  Else 
	response.write("no")
  End If
  
  rs.close
  Conn.close
  Set rs = Nothing
  Set Conn = Nothing
  
  Function ValidPersonal(userid, password)
SQL = "SELECT * FROM users WHERE userid='"+ userid+"' AND password='"+password+"'"
Set rs = Conn.Execute(SQL)
If rs.Eof Then
  ValidPersonal = False
Else
  ValidPersonal = True
End If
  End Function

 

%>
