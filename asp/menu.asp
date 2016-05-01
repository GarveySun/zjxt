<!--#include file ="config.asp"-->
<html>
<head>
<script src="/jquery/jquery-1.9.1.min.js"></script>
<script src="/jquery/jquery.qtip.min.js"></script>
<link href="/css/menu.css" rel="stylesheet" type="text/css">
<link href="/css/jquery.qtip.min.css" rel="stylesheet" type="text/css">
<title>总监电子反映单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" charset="gb2312">
<style type="text/css">
</style>
<script type="text/javascript">
$(document).ready(function(e) {
    $("div.menus a").on("click",function(){
		$("div.menus a").removeAttr("style");
		$(this).css("color","#FFF");
	});
});

$(document).ready(function(e) {
    $("a[title]").qtip();
});
</script>
<%
  if request("action")="quit" then
	Session.Abandon
%>
<script type="text/javascript">
	window.top.location="../Default.asp";
</script>
<% end if %>
</head>
<body bgcolor="#FFEFBF">
<div align="center">
  <table width="100%" valign="top" border="0" height="200" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFEFBF">
        <td align="center"><div style="width:120px">欢迎:<%=Session("name")%> 登录</div></td>
      </tr>
      <tr bgcolor="#FFEFBF">
        <td align="center"><div style="width:120px">部门:<%=Session("department")%></div></td>
      </tr>
      <tr bgcolor="#FFEFBF">
        <td align="center"><div style="width:120px">账号权限:<%=session("seecheck")%></div></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div style="font-size:14px; font-weight:bold" align="center">功能目录</div></td>
      </tr>
      <tr>
        <td><div id="pathname" align="center">-----------------------</div></td>
      </tr>
      <tr >
        <td align="center"><div class="tittleblue" align="left">
            <p>单据</p>
          </div></td>
      </tr>
      <%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
   Set rs = Server.CreateObject("ADODB.Recordset")
   sql = "Select r.permissionname, r.permissionurl,r.enable,r.remark from users u,rolepermission r where  u.name='" + Session("name") + "' and u.rolename=r.rolename and r.family='单据' order by r.perorder" 
   rs.open sql, conn, 3, 2
      Do While Not rs.Eof
   
   if rs("enable")=1 then
      %>
      <tr>
        <td  align="center" height="20"><div class="menus" style="width:120Px" align="left"><a title="<%=rs("remark")%>" href="<%=rs("permissionurl")%>" target="mainFrame">﹂<%=rs("permissionname")%></a></div></td>
      </tr>
      <%else%>
      <tr>
        <td  align="center" height="20"><div class="disableper" style="width:120Px" align="left">
            <p>﹂<%=rs("permissionname")%></p>
          </div></td>
      </tr>
      <% end if
	    rs.MoveNext
        Loop
		%>
      <tr>
        <td align="center"><div class="tittleblue" align="left">
            <p>工服</p>
          </div></td>
      </tr>
      <%
   Set rs = Server.CreateObject("ADODB.Recordset")
   sql = "Select r.permissionname, r.permissionurl,r.enable,r.remark from users u,rolepermission r where  u.name='" + Session("name") + "' and u.rolename=r.rolename and r.family='工服' order by r.perorder" 
   rs.open sql, conn, 3, 2
      Do While Not rs.Eof
	if rs("enable")=1 then
      %>
      <tr>
        <td  align="center" height="20"><div class="menus" style="width:120Px" align="left"><a title="<%=rs("remark")%>" href="<%=rs("permissionurl")%>" target="mainFrame">﹂<%=rs("permissionname")%></a></div></td>
      </tr>
      <%else%>
      <tr>
        <td  align="center" height="20"><div class="disableper" style="width:120Px" align="left">
            <p>﹂<%=rs("permissionname")%></p>
          </div></td>
      </tr>
      <% end if
	    rs.MoveNext
        Loop
		%>
      <tr>
        <td align="center"><div class="tittleblue" align="left">
            <p>查询</p>
          </div></td>
      </tr>
      <%
   Set rs = Server.CreateObject("ADODB.Recordset")
   sql = "Select r.permissionname, r.permissionurl,r.enable ,r.remark from users u,rolepermission r where  u.name='" + Session("name") + "' and u.rolename=r.rolename and r.family='查询' order by r.perorder" 
   rs.open sql, conn, 3, 2
      Do While Not rs.Eof
   if rs("enable")=1 then
      %>
      <tr>
        <td  align="center" height="20"><div class="menus" style="width:120Px" align="left"><a title="<%=rs("remark")%>" href="<%=rs("permissionurl")%>" target="mainFrame">﹂<%=rs("permissionname")%></a></div></td>
      </tr>
      <%else%>
      <tr>
        <td  align="center" height="20"><div class="disableper" style="width:120Px" align="left">
            <p>﹂<%=rs("permissionname")%></p>
          </div></td>
      </tr>
      <% end if
	    rs.MoveNext
        Loop
		%>
      <tr>
        <td align="center"><div class="tittleblue" align="left">
            <p>管理</p>
          </div></td>
      </tr>
      <%
   Set rs = Server.CreateObject("ADODB.Recordset")
   sql = "Select r.permissionname, r.permissionurl,r.enable,r.remark from users u,rolepermission r where  u.name='" + Session("name") + "' and u.rolename=r.rolename and (r.family='管理' or r.family = '维护') order by r.perorder" 
   rs.open sql, conn, 3, 2
      Do While Not rs.Eof
   if rs("enable")=1 then
      %>
      <tr>
        <td  align="center" height="20"><div class="menus" style="width:120Px" align="left"><a title="<%=rs("remark")%>" href="<%=rs("permissionurl")%>" target="mainFrame">﹂<%=rs("permissionname")%></a></div></td>
      </tr>
      <%else%>
      <tr>
        <td  align="center" height="20"><div class="disableper" style="width:120Px" align="left">
            <p>﹂<%=rs("permissionname")%></p>
          </div></td>
      </tr>
      <% end if
	    rs.MoveNext
        Loop
		%>
      <tr>
        <td align="center"><div class="tittleblue" align="left">
            <p>其他</p>
          </div></td>
      </tr>
      <tr>
        <td align="center" height="20"><div style="width:120Px" align="left"><a href="/asp/menu.asp?action=quit" target="mainFrame">﹂退出</a></div></td>
      </tr>
      <tr>
        <td height="7">&nbsp;</td>
      </tr>
      <tr>
      <td><div align="center">-----------------------</div></td>
      </tr>
</table>
</div>
<% 
  rs.close
  conn.close
  Set rs = Nothing
  Set Conn = Nothing
%>
</body>
</html>
