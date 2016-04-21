<!--#include file ="../config.asp"-->
<%
If Session("logined") <> True Then
   Response.Redirect("/asp/menu.asp?action=quit")
End If
dim Conn, rs, i
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from news where newsid="& Request("newsid")
rs.open sql, conn, 3, 2

'如果没申请复审
if request("again") = 0 and rs("again") = 0 then
	'只有一个责任部门
	if rs("over_char2") = "无" then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		if rs("zj_pd_3")<> 0 then
			rs("danjupd") = 8
		else
			rs("danjupd") = 9
		end if
	'有俩责任部门,那么当当前部门是第一责任部门的话
	elseif rs("department")=session("department") then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		'如果另一责任部门写了建议（已审），若未审则单据状态不跳转
		if rs("suggestion_zrbm2") <> "无" then
			if rs("zj_pd_3")<> 0 then
				rs("danjupd") = 8
			else
				rs("danjupd") = 9
			end if
		end if
	'有俩责任部门，当前部门不是第一责任部门，则往suggestion2写入
	else
		rs("suggestion_zrbm2")=request("bmcontent")
		rs("zrbm_name2")=request("bmsign")
		rs("bmreplypd")=session("department")
		if rs("suggestion_zrbm") <> "无" then
			if rs("zj_pd_3")<> 0 then
				rs("danjupd") = 8
			else
				rs("danjupd") = 9
			end if
		end if
	end if
'申请复审了
else
	'只有一个责任部门，则跳转到复审
	if rs("over_char2") = "无" then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		rs("danjupd")=4
		rs("again")=1
	'否则（不止1个责任部门），若当前是第一责任部门则
	elseif rs("department")=session("department") then
		rs("suggestion_zrbm")=request("bmcontent")
		rs("zrbm_name")=request("bmsign")
		rs("bmreplypd")=session("department")
		rs("again")=1
		if rs("suggestion_zrbm2") <> "无" then
			  rs("danjupd") = 4
		end if
	'否则（不止1个责任部门），若当前是第二责任部门则
	else
		rs("suggestion_zrbm2")=request("bmcontent")
		rs("zrbm_name2")=request("bmsign")
		rs("bmreplypd")=session("department")
		rs("again")=1
		if rs("suggestion_zrbm") <> "无" then
			rs("danjupd") = 4
		end if

	end if

end if
	
	
	
rs.update
rs.close

  Set rs = Nothing
  Set Conn = Nothing
  Response.Write("<script>alert('提交成功。');location.href='/asp/step_zj/JK_mynews.asp';</script>")
%>