<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs ,rs1,rs2
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr

  Set rs1 = Server.CreateObject("ADODB.Recordset")
  sql="SELECT * FROM rolepermission where rolename='"& Request("rolename")&"'"
  rs1.open sql,conn,3,2
if rs1.recordcount>=1 then
%>
<script type="text/javascript">
alert("��������ɫ���ڣ�����������");
window.history.back(-1);
</script>
<%
elseif rs1.recordcount=0 then
  Set rs2 = Server.CreateObject("ADODB.Recordset")
  sql_role="insert into roles (rolename,enable) values ('"&request("rolename")&"','"&request("enable")&"')"
  conn.execute(sql_role)
  sql_roleid = "select roleid from roles where rolename = '"&request("rolename")&"'"
  rs2.open sql_roleid, conn, 1, 1
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql_select="select * from rolepermission where roleid='"&request("roleid")&"'"
  rs.open sql_select, conn, 3, 2

		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��ҳ"
			rs("permissionurl")="/asp/see_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="�ܼ൥��ϵͳ����ͼ��ʹ��˵��"
			rs.update
		
		if request("checkbox1")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�ҵĵ���"
			rs("permissionurl")="/asp/step_zj/JK_mynews.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="�鿴�����йصĵ��ӵ���"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�ҵĵ���"
			rs("permissionurl")="/asp/step_zj/JK_mynews.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="�鿴�����йصĵ��ӵ���"
			rs.update
		end if
			
  		if request("checkbox2")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�ύ�µ�"
			rs("permissionurl")="/asp/step_zj/JK_addNews.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=3
			rs("remark")="�ܼ��ύ���ӵ���"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�ύ�µ�"
			rs("permissionurl")="/asp/step_zj/JK_addNews.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=3
			rs("remark")="�ܼ��ύ���ӵ���"
			rs.update
		end if
		
		if request("checkbox3")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�˷�����"
			rs("permissionurl")="/asp/step_bz/buzhang_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=4
			rs("remark")="�˿ͷ�����˵���"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�˷�����"
			rs("permissionurl")="/asp/step_bz/buzhang_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=4
			rs("remark")="�˿ͷ�����˵���"
			rs.update
		end if
		
		if request("checkbox4")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�����쵼����"
			rs("permissionurl")="/asp/step_boss/boss_listnew.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=5
			rs("remark")="�̵������쵼��������"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�����쵼����"
			rs("permissionurl")="/asp/step_boss/boss_listnew.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=5
			rs("remark")="�̵������쵼��������"
			rs.update
		end if
		
'		if request("checkbox4")=1 then 
'		rs.addnew
'			rs("rolename")=request("rolename")
'			rs("permissionname")="����״̬�鿴"
'			rs("permissionurl")="/asp/step_bz/JK_selectnews_all.asp"
'			rs("roleid")=rs2("roleid")
'			rs("family")="����"
'			rs("enable")=1
'			rs("perorder")=3
'			rs("remark")="�˿ͷ��񲿲鿴��ת�еĵ���״̬"
'			rs.update
'		else
'	    rs.addnew
'			rs("rolename")=request("rolename")
'			rs("permissionname")="����״̬�鿴"
'			rs("permissionurl")="/asp/step_bz/JK_selectnews_all.asp"
'			rs("roleid")=rs2("roleid")
'			rs("family")="����"
'			rs("enable")=0
'			rs("perorder")=3
'			rs("remark")="�˿ͷ��񲿲鿴��ת�еĵ���״̬"
'			rs.update
'		end if
		
		if request("checkbox5")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��������"
			rs("permissionurl")="/asp/step_hr/hr_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=6
			rs("remark")="������Դ������漰����/�����ĵ��ݽ�����ˡ�����"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��������"
			rs("permissionurl")="/asp/step_hr/hr_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=6
			rs("remark")="������Դ������漰����/�����ĵ��ݽ�����ˡ�����"
			rs.update
		end if
		
		if request("checkbox6")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="���񱸰�"
			rs("permissionurl")="/asp/step_cw/cw_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=7
			rs("remark")="��������漰����/�����ĵ��ݽ��в���������"
			rs.update
		else
	    rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="���񱸰�"
			rs("permissionurl")="/asp/step_cw/cw_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=7
			rs("remark")="��������漰����/�����ĵ��ݽ��в���������"
			rs.update
		end if
		
		if request("checkbox11")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�ҵ��걨"
			rs("permissionurl")="/asp/suit_check/suit_check_mylist.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="�����������б�"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�ҵ��걨"
			rs("permissionurl")="/asp/suit_check/suit_check_mylist.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=1
			rs("remark")="�����������б�"
			rs.update
		end if
		
		if request("checkbox12")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��������"
			rs("permissionurl")="/asp/suit_check/suit_check_reviewlist.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="�˿ͷ�����˹���"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��������"
			rs("permissionurl")="/asp/suit_check/suit_check_reviewlist.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="�˿ͷ�����˹���"
			rs.update
		end if
		
		if request("checkbox21")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��ѯ���ӵ�"
			rs("permissionurl")="/asp/JK_select.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="��ѯ"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="�鿴/ɸѡ���͵��ӵ���"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��ѯ���ӵ�"
			rs("permissionurl")="/asp/JK_select.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="��ѯ"
			rs("enable")=0
			rs("perorder")=1
			rs("remark")="�鿴/ɸѡ���͵��ӵ���"
			rs.update
		end if
		
		if request("checkbox22")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="����������"
			rs("permissionurl")="/asp/SC_select.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="��ѯ"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="�鿴/ɸѡ������������"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="����������"
			rs("permissionurl")="/asp/SC_select.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="��ѯ"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="�鿴/ɸѡ������������"
			rs.update
		end if
		
		if request("checkbox31")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�޸�����"
			rs("permissionurl")="/asp/changepw.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="�޸ĵ�ǰ�˺�����"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�޸�����"
			rs("permissionurl")="/asp/changepw.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=1
			rs("remark")="�޸ĵ�ǰ�˺�����"
			rs.update
		end if
				
		if request("checkbox32")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��ɫ����"
			rs("permissionurl")="/asp/manage/roles_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="�༭��ɫ"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="��ɫ����"
			rs("permissionurl")="/asp/manage/roles_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="�༭��ɫ"
			rs.update
		end if
		
		if request("checkbox33")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�û�����"
			rs("permissionurl")="/asp/manage/users_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=3
			rs("remark")="�༭�û��˺�"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�û�����"
			rs("permissionurl")="/asp/manage/users_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=3
			rs("remark")="�༭�û��˺�"
			rs.update
		end if
		
		if request("checkbox34")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�޸ĵ���"
			rs("permissionurl")="/asp/edit_jk/edit_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=1
			rs("perorder")=3
			rs("remark")="�޸��д���ĵ���"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="�޸ĵ���"
			rs("permissionurl")="/asp/edit_jk/edit_list.asp"
			rs("roleid")=rs2("roleid")
			rs("family")="����"
			rs("enable")=0
			rs("perorder")=3
			rs("remark")="�޸��д���ĵ���"
			rs.update
		end if
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('��ӳɹ���');location.href='/asp/manage/roles_list.asp';</script>")
  end if
%>