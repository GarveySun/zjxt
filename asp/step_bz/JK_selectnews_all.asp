<!--#include file ="../config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr


   Set rs = Server.CreateObject("ADODB.Recordset")
   Key  = Request("Key")
   Sort = Request("Sort")
   Page = Clng(Request("Page"))
   sql = "Select n.*, u.name from news n,users u where n.zj_pd_rk=0 and n.userid=u.userid order by newsid desc"
   rs.open sql, conn, 3, 2
   rs.PageSize = 30 'ÿҳ��ʾ��¼��
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
$(document).ready(function(e) {
    $("tr").hover(function(e) {
        $(this).addClass("mouse");
             },function(e){
				 $(this).removeClass("mouse");
		});
});

$(document).ready(function(e) {
    $(".listtd:not(.option)").click(function(e) {
        newsid=$(this).parent().find("td").eq(0).text();
		openurl="/asp/JK_seenews.asp?newsid="+newsid;
	    window.open(openurl,"newsid:"+newsid,'height=600,width=750,top=100,left=100,toolbar=no');
    });
});

</script>
<title>�鿴����</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
 
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center"  width="700">
  <tr style="background-color:#9FF"> 
    <td align="center" class="topic" colspan="8" ><strong>�鿴δ��ⵥ��</strong></td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center" width="700" >
  <tr class="small" align="center" style="background-color:#BDFCC9"> 
    <td width="40" height="22"><div align="center">���</div></td>
    <td width="100" height="22">��������</td>
    <td width="160" height="22">��ӳ����</td>

    <td width="135" height="22">��������</td>

    <td width="60" height="22">���ݵ�ǰ����</td>
  </tr>
  <%
   For i = 1 to rs.PageSize
       If rs.EOF Then Exit For
%>
  <tr class="small" align="center"> 
    <td class="listtd"><%=rs("newsid")%></td>
    <td class="listtd"><%=rs("time")%></td>
    <td class="listtd"><%=rs("title")%></td>

    <td class="listtd"><%=rs("department")%></td>

    <td class="listtd option">
    <%select case rs("danjupd")
	case 0%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">���ܲ�����</a>
    <%case 1%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">������Դ���Ǽ�</a>
    <%case 2%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">�����쵼����</a>
    <%case 3%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">���β����ĵ�</a>
    <%case 4%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">���ܲ��������</a>
    <%case 5%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">������Դ���Ǽ�</a>
    <%case 6%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">�����쵼�������</a>
    <%case 7%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">���β��Ŷ����ĵ�</a>
    <%case 8%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">�����˽ɿ�</a>
    <%case 9%>
    <a href="/asp/JK_seenews.asp?newsid=<%=rs("newsid")%>">�ܼ����ȷ��</a>
    <%case else%>
    <p>״̬�쳣������ϵ�������</p>
      
    <%end select%></td>
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