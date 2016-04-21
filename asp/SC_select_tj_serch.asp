<!--#include file ="config.asp"-->
<!--#include file ="quit.asp"-->
<%
dim Conn, rs,num
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
Key  = Request("Key")
Sort = Request("Sort")
Page = Clng(Request("Page"))

startdate=request("startdate")
enddate=request("enddate")

sql = "Select * from suit_check where 1=1"

'只有不限定单据编号时日期维度才生效
if request("startid")="" and request("endid")="" then
	sql = sql &" and time between '"&startdate&"' and '"&enddate&"'"
end if

if request("department")<>"all" then
	sql=sql&" and department='"&request("department")&"'"
end if

if request("danjupd")<>"all" then
	sql = sql &" and danjupd = '"&request("danjupd")&"'"
end if

if request("shoppe")<>"" then
	sql = sql &" and shoppe like '%"&request("zj_pd_3")&"%'"
end if 

if request("startid")<>"" then
	sql = sql &" and newsid >= '"&request("startid")&"'"
end if

if request("endid")<>"" then
	sql = sql &" and newsid <= '"&request("endid")&"'"
end if

sql=sql&" order by newsid desc" 
response.Write(sql)
rs.open sql, conn, 3, 2 
rs.PageSize = 1000 '每页显示记录数
If Page < 1 then Page = 1
If page > rs.PageCount Then Page = rs.PageCount
If rs.PageCount > 0 then rs.AbsolutePage = Page
MySelf = Request.ServerVariables("PATH_INFO")
%>
<html>
<head>
<link href="/css/see_list.css" rel="stylesheet" type="text/css">
<title>查询结果</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $("tr").hover(function(e) {
        $(this).addClass("mouse");
             },function(e){
				 $(this).removeClass("mouse");
		});
		
	$(".listtd:not(.option)").click(function(e) {
        newsid=$(this).parent().find("td").eq(1).text();
		openurl="/asp/suit_check/SC_seenews.asp?newsid="+newsid;
	    window.open(openurl,"newsid:"+newsid,'height=600,width=750,top=100,left=100,toolbar=no');
    });
});
</script>
</head>
<body>
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center" width="700px">
  <tr style="background-color:#9FF"> 
    <td align="center" class="topic" colspan="7" ><strong>查询结果</strong>（点击以查看明细）</td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center">
  <tr class="small" style="background-color:#BDFCC9"> 
    <td style="width:60px" height="22">序号</td>
    <td style="width:60px" height="22">编号</td>
    <td style="width:112px" height="22">部门</td>
    <td style="width:140px" height="22">专柜</td>
    <td style="width:120px" height="22">着装时间</td>
    <td style="width:120px" height="22">提交时间</td>
    <td style="width:80px" height="22">状态</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small"> 
    <td class="listtd"><%response.Write(i)%></td>
    <td class="listtd"><%=rs("newsid")%></td>
    <td class="listtd"><%=rs("department")%></td>
    <td class="listtd"><%=rs("shoppe")%></td>
    <td class="listtd"><%=rs("dresstime")%></td>
    <td class="listtd"><%=rs("time")%></td>
    <td class="listtd">
    <%
	select case rs("danjupd")
		case 0
			response.Write("未审核")
		case 1
			response.Write("审核未通过")
		case 99
			response.Write("审核通过")
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
  <tr class="small" bgcolor="#eaeaf4"> 
    <td colspan="7" align=center><input type = "button" name = "button1" value = "返 回" onclick = "javascript:history.back(-1);"></td>
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