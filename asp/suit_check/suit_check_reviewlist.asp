<!--#include file ="../config.asp"-->
<%
  dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  Key  = Request("Key")
  Sort = Request("Sort")
  Page = Clng(Request("Page"))
  
  '通过当前月份计算出前三月至后一月的月份，用于sql查询
  dim starttime,endtime
  select case month(now)
  	case 1
		starttime = (year(now)-1)&"-10-1"
		endtime = year(now)&"-2-1"
	case 2
		starttime = (year(now)-1)&"-11-1"
		endtime = year(now)&"-3-1"
	case 3
		starttime = (year(now)-1)&"-12-1"
		endtime = year(now)&"-4-1"
	case 12
		starttime = year(now)&"-9-1"
		endtime = (year(now)+1)&"-1-1"
	case else
		starttime = year(now)&"-"&(month(now)-3)&"-1"
		endtime = year(now)&"-"&(month(now)+1)&"-1"
	end select
		
  select case session("rolename")
    case "超级管理员"
	  sql = "Select * from suit_check where danjupd <> 1 or ( time between '"&starttime&"' and '"&endtime&"' ) order by newsid desc"
	case else 'session("rolename")=部门审阅
	  sql = "Select * from suit_check where danjupd <> 1 or ( time between '"&starttime&"' and '"&endtime&"' ) order by newsid desc"
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
    <td align="center" class="topic" colspan="5" ><strong>审批工服申报单</strong>（单击以查看明细）</td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center" width="800" >
  <tr class="small" align="center" style="background-color:#BDFCC9"> 
    <td width="30" height="22">编号</td>
    <td width="100" height="22">部门</td>
    <td width="100" height="22">时间</td>
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
		  	%>
            <a href="SC_reviewNews.asp?newsid=<%=rs("newsid")%>" id="deletenews">审核</a>
            <%
		  case 99
		    response.Write("审核通过")
		  case 1
		    response.Write("未通过")
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