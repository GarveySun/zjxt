<!--#include file ="../config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr


   Set rs = Server.CreateObject("ADODB.Recordset")
   Key  = Request("Key")
   Sort = Request("Sort")
   Page = Clng(Request("Page"))
   if session("name")="dalou" then
   sql = "Select n.*, u.name from news n,users u where n.danjupd=3 and n.zj_pd_rk = 0 and n.userid=u.userid order by newsid desc"
   else
   sql = "Select n.*, u.name from news n,users u where n.danjupd >= 3 and n.zj_pd_rk = 0 and (n.department='"&session("department")&"' or n.over_char2='"&session("department")&"')and n.userid=u.userid order by newsid desc"
   end if
   rs.open sql, conn, 3, 2
   rs.PageSize = 30 '每页显示记录数
   If Page < 1 then Page = 1
   If page > rs.PageCount Then Page = rs.PageCount
   If rs.PageCount > 0 then rs.AbsolutePage = Page
   MySelf = Request.ServerVariables("PATH_INFO")
%>
<html>
<head>
<link href="/css/see_list.css" rel="stylesheet" type="text/css">
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(document).ready(function(e) {
    $("tr").hover(function(e) {
        $(this).addClass("mouse");
             },function(e){
				 $(this).removeClass("mouse");
		});
});
</script>
<title>我的单据</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
 
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center"  width="700">
  <tr style="background-color:#9FF"> 
    <td align="center" class="topic" colspan="8" ><strong><%=session("department")%>待处理消息</strong></td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center" width="700" bordercolordark="#000000">
  <tr class="small" align="center" style="background-color:#BDFCC9"> 
    <td width="40" height="22"><div align="center">编号</div></td>
    <td width="100" height="22">发单日期</td>
    <td width="160" height="22">反映标题</td>
    <td width="75" height="22">责任人</td>
    <td width="135" height="22">所属部门</td>
    <td width="60" height="22">操作</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small" align="center"> 
    <td class="listtd"><%=rs("newsid")%></td>
    <td class="listtd"><%=rs("time")%></td>
    <td class="listtd"><%=rs("title")%></td>
    <td class="listtd"><%=rs("prisoner")%></td>
    <td class="listtd"><%=rs("department")%></td>
    <td class="listtd">
    <%if session("seecheck")="查看" then%>
     <a href="/asp/jk_seenews.asp?newsid=<%=rs("newsid")%>">查看</a>
     <%elseif rs("danjupd") = 3 then %><a href="/asp/step_bm/JK_editNews_bmchushen.asp?newsid=<%=rs("newsid")%>">初审</a>
	     <%elseif rs("danjupd") = 7 then%><a href="/asp/step_bm/JK_editNews_bmfushen.asp?newsid=<%=rs("newsid")%>">二次审核</a>
         <%elseif rs("zj_pd_rk") = 0 then%><a href="/asp/jk_seenews.asp?newsid=<%=rs("newsid")%>">已入库，点击查看</a>
         <%else%><a href="/asp/jk_seenews.asp?newsid=<%=rs("newsid")%>">流转中</a>
		 <%end if%></td>   
  </tr>
  <%
       rs.MoveNext    
   Next
%>
</table>
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
   <img name="next" border="0" src="/asp/image/error.png" width="9" height="13"></a> 
   </div>
<%
End If
%>
<p align="center"><br>
</p>
</body>
</html>	