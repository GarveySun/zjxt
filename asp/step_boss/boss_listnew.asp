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
select case session("name")
	case "�ﻳ��"
		sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and (n.department='�ܾ���' or n.department='����' or n.department='������Դ��') and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "������"
		sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and (n.department='���ڹ���' or n.department='��ȫ������') and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "����Ƽ"
		sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and (n.department='��ί������' or n.department='����') and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "�ƺ�"
		sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and (n.department='�г�Ӫ����' or n.department='ҵ��Ӫ�˲�'or n.department like '%���۲�')n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "�����"
		'���ܿ��������в��ŵĵ���
		sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "�����쵼"
		'�����˺�ģ�ⳣ�ܿ��������в��ŵĵ���
		sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case else
		if session("rolename")="��������Ա" then
			sql = "Select n.*, u.name from news n,users u where (n.danjupd=2 or n.danjupd=6) and n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
		else
			'��������ŵ��쵼���߹���Ա���򷵻����ѯ
			sql = "Select n.*, u.name from news n,users u where (1=2) order by newsid desc"
		end if 
end select
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
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $("tr").hover(function(e) {
        $(this).addClass("mouse");
             },function(e){
				 $(this).removeClass("mouse");
		});
		
    $(".listtd:not(.option)").click(function(e) {
        var newsid=$(this).parent().find("td").eq(0).text();
		var openurl="/asp/JK_seenews.asp?newsid="+newsid;
		var setting = "height=600,width=750,top=100,left=100,toolbar=no";
		window.open(openurl,"SeeNews",setting);
    });
});
</script>
<title>�����쵼��˵���</title>
<meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
<p>&nbsp;</p>
<table cellspacing="0" cellpadding="0" bordercolorlight="#dfdfdf" bordercolordark="#ffffff" align="center"  width="800">
  <tr style="background-color:#9FF"> 
    <td align="center" class="topic" colspan="8" ><strong>�����쵼��˵���</strong>�������Բ鿴��ϸ��</td>
  </tr>
<table style="table-layout:fixed; background-color:#666" border="0" cellspacing="1" cellpadding="0" align="center" width="800" >
  <tr class="small" align="center" style="background-color:#BDFCC9"> 
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
  <tr class="small" align="center"> 
    <td class="listtd"><%=rs("newsid")%></td>
    <td class="listtd"><%=rs("title")%></td>
    <td class="listtd"><%=rs("time")%></td>
    <td class="listtd"><%=rs("classname")%>&mdash;&mdash;<%=rs("typename")%></td>
    <td class="listtd"><%=rs("department")%></td>
    <td class="listtd"><%=rs("name")%></td>
    <td class="listtd option">
        <% if rs("danjupd") = 2 then %>
        <a href="/asp/step_boss/JK_editNews_bosschushen.asp?newsid=<%=rs("newsid")%>">����</a>
        <%else%>
        <a href="/asp/step_boss/JK_editNews_bossfushen.asp?newsid=<%=rs("newsid")%>">�������</a>
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