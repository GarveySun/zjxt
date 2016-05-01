<!--#include file ="../config.asp"-->
<%
 If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open DBstr
   Set rs = Server.CreateObject("ADODB.Recordset")
   Key  = Request("Key")
   Sort = Request("Sort")
   Page = Clng(Request("Page")) 
if session("rolename")="超级管理员" then
   sql = "Select * from roles"
else
   sql = ""
end if
   rs.open sql, conn, 3, 2
   rs.PageSize =20 '每页显示记录数
   If Page < 1 then Page = 1
   If page > rs.PageCount Then Page = rs.PageCount
   If rs.PageCount > 0 then rs.AbsolutePage = Page
   MySelf = Request.ServerVariables("PATH_INFO")
%>
<html>
<head>
<link href="/css/see_list.css" rel="stylesheet" type="text/css">

<title>最新信息</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
 
<p>&nbsp;</p>
<table border="1" cellspacing="0" cellpadding="1" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" width="600" align="center">
  <tr> 
    <td class="topic" colspan="3" bgcolor="#FF9D9D" >角色管理</td>
  </tr>
  <tr bgcolor="#F9F9F9" class="small"> 
    <td width="250" height="22">角色名（rolename）</td>
    <td width="200" height="22">是否启用（enable）</td>
    <td width="150" height="22">操作</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small"> 
    <td width="250"><%=rs("rolename")%></td>
    <td width="200"><%if rs("enable")=1 then%>启用<%else%>禁用<%end if%></td>
    <td width="150"><a href="../../asp/manage/role_edit.asp?roleid=<%=rs("roleid")%>">编辑</a>
     <a href="javascript:if(confirm('确实要删除角色“<%=rs("rolename")%>”吗?'))location='/asp/manage/role_delete.asp?roleid=<%=rs("roleid")%>'">删除</a>
   </td>
  </tr>
  <%
       rs.MoveNext
   Next
%>
  <tr class="small"> 
    <td colspan=4 bgcolor="#eaeaf4"><a href="/asp/manage/role_addnew.asp">创建一个新角色</a></td>
  </tr>
</table>
<%
If rs.PageCount > 1 then
%>
   <br>
   <div align="center">
   <a href="<%=MySelf%>?Page=<% =(Page - 1) %>>
   <img name="prev" border="0" src="prev.gif" width="9" height="13"></a>&nbsp;&nbsp;
   <%
   For i = 1 to rs.PageCount
       If i = Page then
          color = "Red"
          response.write " <Font color=" + color + ">" + Cstr(i) + "</Font>&nbsp;"
       Else
          color = "Black"
          response.write " <a href=" + MySelf + "?Page=" + Cstr((i)) + "><Font color=" + color + ">" + Cstr(i) + "</Font></a>&nbsp;"
       End If
   Next
   %>&nbsp;&nbsp;
   <a href="<%=MySelf%>?Page=<%=(Page + 1)%>>
   <img name="next" border="0" src="next.gif" width="9" height="13"></a> 
   </div>
<%
End If
%>
<p align="center"><br>
</p>
</body>
</html>	