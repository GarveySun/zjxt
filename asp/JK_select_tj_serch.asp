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

sql = "Select n.*,u.name from news n,users u where n.userid=u.userid"

'ֻ�в��޶����ݱ��ʱ����ά�Ȳ���Ч
if request("startid")="" and request("endid")="" then
	sql = sql &" and date between '"&startdate&"' and '"&enddate&"'"
end if

if request("classname")<>"all" then
	if request("typename")<>"all" then
		sql=sql&" and n.classname='"&request("classname")&"' and n.typename='"&request("typename")&"'"
	else
		sql=sql&" and n.classname='"&request("classname")&"'"
	end if
end if

if request("department")<>"all" then
	sql=sql&" and n.department='"&request("department")&"'"
end if

if request("zj_pd_7")<>"all" then
	sql = sql &" and n.zj_pd_7 = '"&request("zj_pd_7")&"'"
end if

if request("zj_pd_3")<>"all" then
	sql = sql &" and n.zj_pd_3 = '"&request("zj_pd_3")&"'"
end if 

if request("zj_pd_rk")<>"all" then
	sql = sql &" and n.zj_pd_rk = '"&request("zj_pd_rk")&"'"
end if 

if request("userid")<>"" then
	sql = sql &" and n.userid = '"&request("userid")&"'"
end if

if request("name")<>"" then
	sql = sql &" and u.name = '"&request("name")&"'"
end if 

if request("startid")<>"" then
	sql = sql &" and n.newsid >= '"&request("startid")&"'"
end if

if request("endid")<>"" then
	sql = sql &" and n.newsid <= '"&request("endid")&"'"
end if

sql=sql&" order by n.newsid desc" 

response.Write(sql)
rs.open sql, conn, 3, 2 
rs.PageSize = 1000 'ÿҳ��ʾ��¼��
If Page < 1 then Page = 1
If page > rs.PageCount Then Page = rs.PageCount
If rs.PageCount > 0 then rs.AbsolutePage = Page
MySelf = Request.ServerVariables("PATH_INFO")
%>
<html>
<head>
<link href="/css/see_list.css" rel="stylesheet" type="text/css">
<title>��ѯ���</title>
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
		openurl="/asp/JK_seenews.asp?newsid="+newsid;
	    window.open(openurl,"newsid:"+newsid,'height=600,width=750,top=100,left=100,toolbar=no');
    });
});
</script>
</head>
<body>
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center"  width="800">
  <tr style="background-color:#9FF"> 
    <td align="center" class="topic" colspan="8" ><strong>��ѯ���</strong>������Բ鿴��ϸ��</td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center" width="800" >
  <tr class="small" style="background-color:#BDFCC9"> 
    <td width="30" height="22">���</td>
    <td width="30" height="22">���</td>
    <td width="200" height="22">����</td>
    <td width="100" height="22">ʱ��</td>
    <td width="100" height="22">���</td>
    <td width="80" height="22">��������</td>
    <td width="45" height="22">��ӳ��</td>
    <td width="60" height="22">״̬</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small"> 
    <td class="listtd"><%response.Write(i)%></td>
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
			response.Write("�˿ͷ��񲿳���")
		case 1
			response.Write("������Դ������")
		case 2
			response.Write("�����쵼����")
		case 3
			response.Write("���β��ų����ĵ�")
		case 4
			response.Write("�˿ͷ��񲿸���")
		case 5
			response.Write("������Դ������")
		case 6
			response.Write("�����쵼����")
		case 7
			response.Write("���β��Ÿ����ĵ�")
		case 8
			response.Write("�������")
		case 9
			response.Write("�������ǰȷ��")
		case 10
			response.Write("�������")
		case 12
			response.Write("�����쵼������")
		case 13
			response.Write("�����쵼������")
		case else
			response.Write("����״̬�쳣")
	end select
	%>
    </td>
  </tr>
  <%
       rs.MoveNext    
   Next
%>
  <tr class="small" bgcolor="#eaeaf4"> 
    <td colspan=8 align=center><input type = "button" name = "button1" value = "�� ��" onclick = "javascript:history.back(-1);"></td>
  </tr>
</table>
</table>
<%
If rs.PageCount > 1 then
%>
   <br />
   <div align="center">
   <%if Page > 1 then%>
     <a href="<%=MySelf%>?Page=<%=(Page-1)%>"><font color="black">ǰһҳ</font></a>&nbsp;
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
     &nbsp;<a href="<%=MySelf%>?Page=<%=(Page + 1)%>"><font color="black">��һҳ</font></a>
   <%end if%>
   </div>
<%
End If
%>
</body>
</html>	