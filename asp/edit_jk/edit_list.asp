<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
Key  = Request("Key")
Sort = Request("Sort")
Page = Clng(Request("Page"))
sql = "Select n.*, u.name from news n,users u where n.danjupd<>10 and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
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
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $("tr").hover(function(e) {
        $(this).addClass("mouse");
             },function(e){
				 $(this).removeClass("mouse");
		});
		
	$(".listtd:not(.option)").click(function(e) {
        newsid=$(this).parent().find("td").eq(0).text();
		openurl="/asp/JK_seenews.asp?newsid="+newsid;
	    window.open(openurl,"newsid"+newsid,'height=600,width=750,top=100,left=100,toolbar=no');
    });
});
</script>
<title>修改单据</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
 
<p>&nbsp;</p>
<table  cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center"  width="800">
  <tr style="background-color:#F60"> 
    <td align="center" class="topic" colspan="8" ><strong>修改单据</strong>（单击以查看明细）</td>
  </tr>
<table style="table-layout:fixed; background-color:#666" align="center"  width="800" border="0" cellspacing="1" cellpadding="0">
  <tr class="small" align="center" style="background-color:#BDFCC9"> 
    <td width="30" height="22">编号</td>
    <td width="200" height="22">主题</td>
    <td width="100" height="22">时间</td>
    <td width="100" height="22">类别</td>
    <td width="80" height="22">所属部门</td>
    <td width="45" height="22">反映人</td>
    <td width="60" height="22">状态</td>
    <td width="60" height="22">操作</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small" align="center"> 
    <td class="listtd"><%=rs("newsid")%></td>
    <td class="listtd"><%=rs("title")%></td>
    <td class="listtd"><%=rs("time")%></td>
    <td class="listtd"><%=rs("classname")%>&mdash;&mdash;<%=rs("typename")%></td>
    <td class="listtd"><%=rs("department")%></td>
    <td class="listtd"><%=rs("name")%></td>
    <td class="listtd">
    <%
	select case rs("danjupd")
		case 0
			response.Write("顾客服务部初审")
		case 1
			response.Write("人力资源部初审")
		case 2
			response.Write("主管领导初审")
		case 3
			response.Write("责任部门初审阅单")
		case 4
			response.Write("顾客服务部复审")
		case 5
			response.Write("人力资源部复审")
		case 6
			response.Write("主管领导复审")
		case 7
			response.Write("责任部门复审阅单")
		case 8
			response.Write("财务部审核")
		case 9
			response.Write("单据入库前确认")
		case 10
			response.Write("单据入库")
		case 12
			response.Write("主管领导初审打回")
		case 13
			response.Write("主管领导复审打回")
		case else
			response.Write("单据状态异常")
	end select
	%>
    </td>
    <td><a href="/asp/edit_jk/jk_edit.asp?newsid=<%=rs("newsid")%>">编辑此单</a></td>
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
   <br />
   <div align="center">
   <%if Page > 1 then%>
     <a href="<%=MySelf%>?Page=<%=(Page-1)%>"><font color="black">前一页</font></a>&nbsp;
   <%
   end if
   For i = 1 to rs.PageCount
       If i = Page then
          color = "Red"
          response.write " <Font color=" + color + ">" + Cstr(i) + "</Font>&nbsp;"
       Else
          color = "Black"
          response.write " <a href=" + MySelf + "?Page=" + Cstr((i)) + "><Font color=" + color + ">" + Cstr(i) + "</Font></a>&nbsp;"
       End If
   Next
   if Page < rs.PageCount then%>
     &nbsp;<a href="<%=MySelf%>?Page=<%=(Page + 1)%>"><font color="black">下一页</font></a>
   <%end if%>
   </div>
<%
End If
%>
</body>
</html>	