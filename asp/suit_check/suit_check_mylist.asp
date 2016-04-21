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
  
  select case session("rolename")
    case "超级管理员"
	  sql = "Select * from suit_check order by newsid desc"
	case else 'session("rolename")=部门审阅
	  sql = "Select * from suit_check where department = '"&session("department")&"' order by newsid desc"
  end select
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
<script src="/jquery/jquery-1.9.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
function ifdelete(){
	if(confirm("确认要删除此单据么？此操作不可恢复。")){
		return true;
	}
	else{
		return false;
	}
}

$(document).ready(function(e) {
    $("tr").hover(function(e) {
        $(this).addClass("mouse");
             },function(e){
				 $(this).removeClass("mouse");
		});
		
	$(".listtd:not(.option)").click(function(e) {
        newsid=$(this).parent().find("td").eq(0).text();
		openurl="/asp/suit_check/SC_seenews.asp?newsid="+newsid;
	    window.open(openurl,"newsid:"+newsid,'height=600,width=750,top=100,left=100,toolbar=no');
    });
	
});
</script>
<title>工服申报单</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center"  width="800">
  <tr style="background-color:#9FF"> 
    <td align="center" class="topic" colspan="5" ><strong>我的工服申报单</strong>（单击以查看明细）</td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center" width="800" >
  <tr class="small" align="center" style="background-color:#BDFCC9"> 
    <td width="30" height="22">编号</td>
    <td width="100" height="22">部门</td>
    <td width="110" height="22">时间</td>
    <td width="100" height="22">专柜</td>
    <td width="60" height="22">状态</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small" align="center"> 
    <td class="listtd"><%=rs("newsid")%></td>
    <td class="listtd"><%=rs("department")%></td>
    <td class="listtd"><%=rs("time")%></td>
    <td class="listtd"><%=rs("shoppe")%></td>
    <td class="listtd option">
    <%
	    select case rs("danjupd")
		  case 0
		    response.Write("顾客服务部审核")%>
			 <a class="delnews" href="SC_deletenews.asp?newsid=<%=rs("newsid")%>" onClick="return ifdelete();" id="deletenews">删除</a>
			<%
		  case 99
		    %>
            <div style="float:left;width:74px; text-align:right">审核通过</div><div class="mark tick"></div></div>
            <%
		  case 1
		     %>
            <div style="float:left;width:70px; text-align:right">未通过</div><div class="mark fork"></div>
            <%
		  case else
		    response.Write("单据状态异常")
		end select
	%>
    </td>   
  </tr>
<%
   rs.MoveNext    
   Next
%>
<tr class="small" align="center">
  <td class="small" colspan="5"><a href="/asp/suit_check/SC_addNews.asp">+ 新增工服申请单</a></td>
</tr>
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