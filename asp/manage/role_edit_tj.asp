<!--#include file ="../config.asp"-->
<%
  If Session("logined") <> True Then
     Response.Redirect("/asp/menu.asp?action=quit")
  End If

dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql="SELECT * FROM roles where roleid<>'"& Request("roleid")&"' and rolename='"&request("rolename")&"'"
  rs.open sql,conn,3,2
if rs.recordcount>=1 then
%>
<script type="text/javascript">
alert("要修改的角色名有重名角色存在，请重新命名");
window.history.back(-1);
</script>
<%
elseif rs.recordcount=0 then
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql_role="update roles set rolename='"&request("rolename")&"',enable='"&request("enable")&"' where roleid='"&request("roleid")&"'"
  conn.execute(sql_role)
  sql_perdelete="delete from rolepermission where roleid='"&request("roleid")&"'"
  conn.execute(sql_perdelete)
  sql="select * from rolepermission where roleid='"&request("roleid")&"'"
  Set rs = Server.CreateObject("ADODB.Recordset")
  rs.open sql,conn,3,2
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="首页"
			rs("permissionurl")="/asp/see_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="总监单据系统流程图、使用说明"
			rs.update
		
		if request("checkbox1")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="我的单据"
			rs("permissionurl")="/asp/step_zj/JK_mynews.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="查看与我有关的电子单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="我的单据"
			rs("permissionurl")="/asp/step_zj/JK_mynews.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="查看与我有关的电子单据"
			rs.update
		end if
			
  		if request("checkbox2")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="提交新单"
			rs("permissionurl")="/asp/step_zj/JK_addNews.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=3
			rs("remark")="总监提交电子单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="提交新单"
			rs("permissionurl")="/asp/step_zj/JK_addNews.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=0
			rs("perorder")=3
			rs("remark")="总监提交电子单据"
			rs.update
		end if
		
		if request("checkbox3")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="顾服审批"
			rs("permissionurl")="/asp/step_bz/buzhang_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=4
			rs("remark")="顾客服务部审核单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="顾服审批"
			rs("permissionurl")="/asp/step_bz/buzhang_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=0
			rs("perorder")=4
			rs("remark")="顾客服务部审核单据"
			rs.update
		end if
		
		if request("checkbox4")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="主管领导审批"
			rs("permissionurl")="/asp/step_boss/boss_listnew.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=5
			rs("remark")="商店主管领导审批单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="主管领导审批"
			rs("permissionurl")="/asp/step_boss/boss_listnew.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=0
			rs("perorder")=5
			rs("remark")="商店主管领导审批单据"
			rs.update
		end if
		
'		if request("checkbox4")=1 then 
'		rs.addnew
'			rs("rolename")=request("rolename")
'			rs("permissionname")="单据状态查看"
'			rs("permissionurl")="/asp/step_bz/JK_selectnews_all.asp"
'			rs("roleid")=request("roleid")
'			rs("family")="单据"
'			rs("enable")=1
'			rs("perorder")=3
'			rs("remark")="顾客服务部查看流转中的单据状态"
'			rs.update
'		else
'	    rs.addnew
'			rs("rolename")=request("rolename")
'			rs("permissionname")="单据状态查看"
'			rs("permissionurl")="/asp/step_bz/JK_selectnews_all.asp"
'			rs("roleid")=request("roleid")
'			rs("family")="单据"
'			rs("enable")=0
'			rs("perorder")=3
'			rs("remark")="顾客服务部查看流转中的单据状态"
'			rs.update
'		end if
		
		if request("checkbox5")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="人力备案"
			rs("permissionurl")="/asp/step_hr/hr_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=6
			rs("remark")="人力资源部针对涉及罚款/奖励的单据进行审核、备案"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="人力备案"
			rs("permissionurl")="/asp/step_hr/hr_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=0
			rs("perorder")=6
			rs("remark")="人力资源部针对涉及罚款/奖励的单据进行审核、备案"
			rs.update
		end if
		
		if request("checkbox6")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="财务备案"
			rs("permissionurl")="/asp/step_cw/cw_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=1
			rs("perorder")=7
			rs("remark")="财务部针对涉及罚款/奖励的单据进行操作、备案"
			rs.update
		else
	    rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="财务备案"
			rs("permissionurl")="/asp/step_cw/cw_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="单据"
			rs("enable")=0
			rs("perorder")=7
			rs("remark")="财务部针对涉及罚款/奖励的单据进行操作、备案"
			rs.update
		end if
		
		if request("checkbox11")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="我的申报"
			rs("permissionurl")="/asp/suit_check/suit_check_mylist.asp"
			rs("roleid")=request("roleid")
			rs("family")="工服"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="工服审批单列表"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="我的申报"
			rs("permissionurl")="/asp/suit_check/suit_check_mylist.asp"
			rs("roleid")=request("roleid")
			rs("family")="工服"
			rs("enable")=0
			rs("perorder")=1
			rs("remark")="工服审批单列表"
			rs.update
		end if
		
		if request("checkbox12")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="工服审批"
			rs("permissionurl")="/asp/suit_check/suit_check_reviewlist.asp"
			rs("roleid")=request("roleid")
			rs("family")="工服"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="顾客服务部审核工服"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="工服审批"
			rs("permissionurl")="/asp/suit_check/suit_check_reviewlist.asp"
			rs("roleid")=request("roleid")
			rs("family")="工服"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="顾客服务部审核工服"
			rs.update
		end if
		
		if request("checkbox21")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="查询奖惩单"
			rs("permissionurl")="/asp/JK_select.asp"
			rs("roleid")=request("roleid")
			rs("family")="查询"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="查看/筛选奖惩电子单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="查询奖惩单"
			rs("permissionurl")="/asp/JK_select.asp"
			rs("roleid")=request("roleid")
			rs("family")="查询"
			rs("enable")=0
			rs("perorder")=1
			rs("remark")="查看/筛选奖惩电子单据"
			rs.update
		end if
		
		if request("checkbox22")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="工服审批单"
			rs("permissionurl")="/asp/SC_select.asp"
			rs("roleid")=request("roleid")
			rs("family")="查询"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="查看/筛选工服审批单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="工服审批单"
			rs("permissionurl")="/asp/SC_select.asp"
			rs("roleid")=request("roleid")
			rs("family")="查询"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="查看/筛选工服审批单据"
			rs.update
		end if
		
		if request("checkbox31")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="修改密码"
			rs("permissionurl")="/asp/changepw.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=1
			rs("perorder")=1
			rs("remark")="修改当前账号密码"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="修改密码"
			rs("permissionurl")="/asp/changepw.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=0
			rs("perorder")=1
			rs("remark")="修改当前账号密码"
			rs.update
		end if
				
		if request("checkbox32")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="角色管理"
			rs("permissionurl")="/asp/manage/roles_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=1
			rs("perorder")=2
			rs("remark")="编辑角色"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="角色管理"
			rs("permissionurl")="/asp/manage/roles_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=0
			rs("perorder")=2
			rs("remark")="编辑角色"
			rs.update
		end if
		
		if request("checkbox33")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="用户管理"
			rs("permissionurl")="/asp/manage/users_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=1
			rs("perorder")=3
			rs("remark")="编辑用户账号"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="用户管理"
			rs("permissionurl")="/asp/manage/users_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=0
			rs("perorder")=3
			rs("remark")="编辑用户账号"
			rs.update
		end if
		
		if request("checkbox34")=1 then 
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="修改单据"
			rs("permissionurl")="/asp/edit_jk/edit_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=1
			rs("perorder")=3
			rs("remark")="修改有错误的单据"
			rs.update
		else
		rs.addnew
			rs("rolename")=request("rolename")
			rs("permissionname")="修改单据"
			rs("permissionurl")="/asp/edit_jk/edit_list.asp"
			rs("roleid")=request("roleid")
			rs("family")="管理"
			rs("enable")=0
			rs("perorder")=3
			rs("remark")="修改有错误的单据"
			rs.update
		end if
  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('修改成功。');location.href='/asp/manage/roles_list.asp';</script>")
  end if
%>