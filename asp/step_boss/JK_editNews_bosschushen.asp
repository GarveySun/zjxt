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
<TITLE>最新信息  更正</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="700">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>主管领导审核单据</td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>单据编号</td>
      <td width="540"><input name="newsid" type="text" id="newsid" value="<%=rs("newsid")%>" size="80" maxlength="80" readonly></td>
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
      <td width="540"><textarea name="content"cols="64" rows="4" readonly><%=rs("content")%></textarea></td>
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
        <%else%>
        <p>不予现金处罚</p>
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
      <td><textarea name="bosscontent" cols="64" rows="7"></textarea>
        签章：
        <input type="text" name="bosssign"  value="<%=Session("name")%>" size="8" /></td>
    </tr>
    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="审 核" name="send" onClick="form1.action='/asp/step_boss/JK_editNews_bosschushen_tj.asp?newsid=<%=rs("newsid")%>';return checkvalue();">
        <input type="button" value="打 回" name="button2" onClick="javascript:turnback();">
        <input type="reset" value="重 填" name="clear">
        <input type = "button" name = "button1" value = "返 回" onClick = "javascript:history.back(-1);"></td>
    </tr>
  </table>
</form>
<script language="javascript">
function checkvalue()
{
	if(document.form1.bosscontent.value=="")
	{
		alert("请您填写意见。");
		return false;
	}
}
function turnback() {
	
    if (document.form1.bosscontent.value === "") {
        if (confirm("不填写任何意见打回顾客服务部吗？")) {
            document.form1.action = "/asp/step_boss/JK_editNews_bossturnback.asp?newsid=<%=rs("newsid")%>";
            document.form1.submit();
        }
    } else {
        document.form1.action = "/asp/step_boss/JK_editNews_bossturnback.asp?newsid=<%=rs("newsid")%>";
        document.form1.submit();
    }
}
</script>

<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
