<!--#include file="md5.asp"-->
<!--#include file ="config.asp"-->
<% 
dim Conn, rs
Userid		= replace(request.form("userid"),"'","") 
Password	= replace(request.form("password"),"'","") 
if request.form("UserLogin")<>"True" then response.end
if Userid = "" or Password ="" then response.redirect "error.asp?error=004"

  Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
 '验证登录者的身份
  userid = Request("userid")
'  password =ASP_MD5(Request("password"))
   password=request("password")
  If ValidPersonal(userid, password) = True Then 
	Session("userid")=rs("userid")
	Session("password")=rs("password")
	Session("name")=rs("name")
	Session("department")=rs("department")
	Session("logined")=True
	Session("rolename")=rs("rolename")
	Session("seecheck")=rs("seecheck")
	Session.Timeout= 120
	clearopen()
	Response.Redirect("frame1.asp")
  Else 
	Response.Redirect("error.asp?error=004")
  End If
  
Function clearopen()'清理zj_pd_open为1的项目
  rs.close
  sql = "Select * from news where zj_pd_open='1'"
  rs.open sql, conn, 3, 2 
  do while not rs.BOF
  if rs.eof then
   exit do
  else
   rs("zj_pd_open") = "0"
   rs.update
   rs.movenext
  end if
  loop
end function

  
  
  Function ValidPersonal(userid, password)
SQL = "SELECT * FROM users WHERE userid='"+ userid+"' AND password='"+password+"'"
Set rs = Conn.Execute(SQL)
If rs.Eof Then
  ValidPersonal = False
Else
  ValidPersonal = True
End If
  End Function

  rs.close
  conn.close
  Set rs = Nothing
  Set Conn = Nothing

%>
