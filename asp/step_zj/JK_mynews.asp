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
    case "��������Ա"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "�ܼ�"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and n.userid='" + Session("userid")+"' and zj_pd_rk=0 order by newsid desc"
	case "�˿ͷ��񲿹���"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "�˿ͷ�������"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and zj_pd_rk=0 order by newsid desc"
	case "������Դ�����"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and zj_pd_rk=0 and danjupd>=1 and zj_pd_3>=1 order by newsid desc"
	case "�������"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and zj_pd_rk=0 and danjupd>=8 order by newsid desc"
	case "�ŵ��쵼����"
	  sql = "Select n.*, u.name from news n,users u where n.userid=u.userid and zj_pd_rk=0 and danjupd >=2 order by newsid desc"
	case else 'session("rolename")=��������
	  sql ="Select n.*, u.name from news n,users u where n.danjupd >= 3 and n.zj_pd_rk = 0 and (n.department='"&session("department")&"' or n.over_char2='"&session("department")&"')and n.userid=u.userid order by newsid desc"
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
<title>�ҵĵ���</title>
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
        newsid=$(this).parent().find("td").eq(0).text();
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
    <td align="center" class="topic" colspan="7" ><strong>�ҵĵ���</strong>������Բ鿴��ϸ��</td>
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
    <%

	select case session("rolename")
	
	  case "�ܼ�"
	    select case rs("danjupd")
		  case 0
		    response.Write("<a href=""/asp/step_zj/JK_editNews_zjxiugai.asp?newsid="&rs("newsid")&"""><strong>�޸�</strong></a>")
		  case 1
		    response.Write("������Դ������")
		  case 2
		    response.Write("�����쵼����")
		  case 3
		    response.Write("���β����ĵ�")
		  case 4
		    response.Write("�˿ͷ��񲿸���")
		  case 5
		    response.Write("������Դ������")
		  case 6
		    response.Write("�����쵼����")
		  case 7
		    response.Write("���β��Ŷ����ĵ�")
		  case 8
		    response.Write("�������")
		  case 9
		    response.Write("<a href=""/asp/step_zj/JK_editNews_zjrk.asp?newsid="&rs("newsid")&"""><strong>���ȷ��</strong></a>")
		  case 12
		    response.Write("<a href=""/asp/step_zj/JK_editNews_zjxiugai.asp?newsid="&rs("newsid")&"""><strong>�쵼����޸�</strong></a>")
		  case 13
		    response.Write("<a href=""/asp/step_zj/JK_editNews_zjxiugai.asp?newsid="&rs("newsid")&"""><strong>�쵼����޸�</strong></a>")
		  case else
		    response.Write("�����")
		end select
		
	  case "��������"
	    select case rs("danjupd")
		  case 0
		    response.Write("�˿ͷ��񲿳���")
		  case 1
		    response.Write("������Դ������")
		  case 2
		    response.Write("�����쵼����")
		  case 3
		    if rs("bmreplypd")=session("department") then
			  response.Write("�������β����ĵ�")
			else
		      response.Write("<a href=""/asp/step_bm/JK_editNews_bmchushen.asp?newsid="&rs("newsid")&"""><strong>����</strong></a>")
		    end if
		  case 4
		    response.Write("�˿ͷ��񲿸���")
		  case 5
		    response.Write("������Դ������")
		  case 6
		    response.Write("�����쵼����")
		  case 7
		    if rs("bmreplypd")=session("department") and rs("over_char2")<>"��" then
			  response.Write("�������β����ĵ�")
			else
		      response.Write("<a href=""/asp/step_bm/JK_editNews_bmfushen.asp?newsid="&rs("newsid")&"""><strong>����</strong></a>")
		    end if
		  case 8
		    response.Write("�������")
		  case 9
		    response.Write("�ܼ����")
		  case else
		    response.Write("�����")
		end select
	 
	 case else
	    select case rs("danjupd")
		  case 0
		    response.Write("�˿ͷ��񲿳���")
		  case 1
		    response.Write("������Դ������")
		  case 2
		    response.Write("�����쵼����")
		  case 3
		    response.Write("���β����ĵ�")
		  case 4
		    response.Write("�˿ͷ��񲿸���")
		  case 5
		    response.Write("������Դ������")
		  case 6
		    response.Write("�����쵼����")
		  case 7
		    response.Write("���β��Ŷ����ĵ�")
		  case 8
		    response.Write("�������")
		  case 9
		    response.Write("�ܼ����")
		  case else
		    response.Write("�����")
		end select
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