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
if rs.recordcount>=1 then
%>
<script type="text/javascript">
alert("登录账号重复，请检查账号是否存在");
window.history.back(-1);
</script>
<%
elseif rs.recordcount=0 then
		rs.addnew
			rs("userid")=request("userid")
			rs("password")=request("password")
			rs("name")=request("name")
			rs("department")=request("department")
			rs("over_char")="正常"
			rs("seecheck")=request("seecheck")
			rs("rolename")=request("rolename")
			rs.update
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('添加成功。');location.href='/asp/manage/users_list.asp';</script>")
  end if
%>