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
   sql = "Select * from users order by userid asc"
else
   sql = ""
end if
   rs.open sql, conn, 3, 2
   rs.PageSize =25 '每页显示记录数
   If Page < 1 then Page = 1
   If page > rs.PageCount Then Page = rs.PageCount
   If rs.PageCount > 0 then rs.AbsolutePage = Page
   MySelf = Request.ServerVariables("PATH_INFO")
%>
<html>
<head>
<link href="/css/see_list.css" rel="stylesheet" type="text/css">
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("tr:odd").filter(".notittle").css("background-color","#BDFCC9");
});
</script>
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">

</head>
<body>
 
<p>&nbsp;</p>
<table border="1" cellspacing="0" cellpadding="1" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center" width="593">
  <tr> 
    <td align="center" class="topic" colspan="4" bgcolor="#FF9D9D" >用户管理</td>
  </tr>
    <tr> 
<form method="post" name="form1">
    <td  align="right" colspan="2">请输入：</td>
    <td align="center" class="topic" colspan="1" bgcolor="#FFFFFF" ><input name="keywords" type="text" id="keywords" size="20" maxlength="20" placeholder="姓名or角色or部门or工号"></td>
    
    <td align="left"><input type="submit" value="Search" name="button1" onClick="form1.action='/asp/manage/users_listsearch.asp';">
    </td>
    </form>
  </tr>
  <tr bgcolor="#F9F9F9" class="small"> 
    <td width="100" height="22">用户名</td>
    <td width="100" height="22">姓名</td>
    <td width="150" height="22">角色</td>
    <td width="180" height="22">操作</td>
  </tr>

  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small notittle"> 
    <td width="100"><%=rs("userid")%></td>
    <td width="100"><%=rs("name")%></td>
    <td width="150"><%=rs("rolename")%></td>
    
    <td width="180"><a href="/asp/manage/user_edit.asp?userid=<%=rs("userid")%>">编辑</a>
    <a href="javascript:if(confirm('确实要删除账号“<%=rs("userid")%>”吗?'))location='/asp/manage/user_delete.asp?userid=<%=rs("userid")%>'">删除</a></td>
  </tr>
  <%
       rs.MoveNext
   Next
%>

  <tr class="small"> 
    <td colspan=4 align=center bgcolor="#eaeaf4"><a href="/asp/manage/user_addnew.asp">添加一个新用户</a></td>
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