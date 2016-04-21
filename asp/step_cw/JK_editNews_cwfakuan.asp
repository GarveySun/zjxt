<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select n.*,u.name from news n,users u where n.newsid=" & Request("newsid")&" and n.userid=u.userid order by n.newsid desc"
  rs.open sql, conn, 3, 2
%>
<HTML>
<HEAD>
<link href="/css/bill.css" rel="stylesheet" type="text/css">
<script language="javascript"> 
function checkvalue()
{
	if(document.form1.cwsign.value=="")
	{
		alert("请您签字。");
		return false;
	}
}
</script>
<TITLE>最新信息  更正</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="700">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>财务部奖惩操作</td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>单据编号</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("newsid")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>发单日期</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>发单人</td>
      <td><input name="name" type="text" id="name" value="<%=rs("name")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>责任人</td>
      <td><input name="prisoner" type="text" id="time3" value="<%=rs("prisoner")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>类别</td>
      <td><input name="class" type="text" id="class" value="<%=rs("classname")%>&mdash;&mdash;<%=rs("typename")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>所属部门</td>
      <td>①
        <input name="department2" type="text" id="department2" value="<%=rs("department")%>" size="30" maxlength="30" readonly>
        ②
        <input name="department3" type="text" id="department3" value="<%=rs("over_char2")%>" size="41" maxlength="41" readonly></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>反映标题</td>
      <td><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="80" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>反映内容</td>
      <td width="540"><p><%=rs("content")%></p></td>
    </tr>
 <%
if rs("suggestion")<>"" then
%>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>总监处理意见及建议</td>
      <td><textarea name="suggestion" cols="64" rows="4" readonly id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
    <%
end if
%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>顾客服务部意见</td>
      <td><textarea name="maiguancontent" readonly cols="64" rows="4"><%=rs("suggestion_mgbz")%>
          </textarea>
		 <% if rs("zj_pd_3") = 1 then %>
		  <p style="left:20Px;">现金处罚 <%=rs("money")%>元</p>
          <%elseif rs("zj_pd_3")=2 then%>
          <p style="left:20Px;">现金奖励 <%=rs("bonus")%>元</p>
	     <%else%><p>不予现金处罚</p>
		 <%end if%></td>
    </tr>
        <%if rs("suggestion_hr")<>"无" then%>     
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>人力资源部意见</td>
      <td><textarea name="hrcontent"cols="64" rows="4" readonly><%=rs("suggestion_hr")%></textarea></td>
    </tr>
    <%end if%>
    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>主管领导意见</td>
      <td><textarea name="bosscontent" cols="64" rows="4" readonly><%=rs("suggestion_zgld")%></textarea>
        签章：<input type="text" value="<%=rs("bossname")%>" size="8" readonly /></td>
    </tr>
  <%if rs("suggestion_zrbm")<>"无" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("department")%>意见</td>
      <td><textarea name="suggestion_zrbm" cols="64" rows="4" readonly><%=rs("suggestion_zrbm")%></textarea>
       签章：<input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>

<%if rs("suggestion_zrbm2")<>"无" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("over_char2")%>意见</td>
      <td><textarea name="suggestion_zrbm2" cols="64" rows="4" readonly><%=rs("suggestion_zrbm2")%></textarea>
       签章：<input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>
  
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>财务部收款</td>
      <td>
	  <%if rs("zj_pd_3")=1 then%>
      <input name="suggestion_cw" type="text" id="title" value="罚款已收取。收缴日期：<%=Now()%>" size="60"><br />
      收款人签章：
	  <%else%>
      <input name="suggestion_cw" type="text" id="title" value="奖励已发放。发放日期：<%=Now()%>" size="60"><br />
      发放人签章：
	  <%end if%><input type="text" name="cwsign"  size="8" /></td>
    </tr>
    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="提 交" name="send" onClick="form1.action='/asp/step_cw/JK_editNews_cwfakuan_tj.asp?newsid=<%=rs("newsid")%>';return checkvalue();">
        <input type="reset" value="重 填" name="clear">
        <input type = "button" name = "button1" value = "返 回" onClick = "javascript:history.back(-1);"></td>
    </tr>
  </table>
</form>
<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
