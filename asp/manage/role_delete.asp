<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "select * from roles where roleid="&request("roleid")
  rs.open sql, Conn, 3, 2
  rs.delete 
  sql = "delete from rolepermission where roleid="&Request("roleid")'É¾rolepermission±íÊý¾Ý
  conn.execute(sql)
  rs.close
  Set rs = Nothing
  Set Conn = Nothing
  Response.Redirect("/asp/manage/roles_list.asp")
%>