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
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<link href="/css/bill.css" rel="stylesheet" type="text/css">
<TITLE>顾客服务部审核</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="646">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>顾客服务部审核单据</td>
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
      <td width="540"><textarea name="content" cols="64" rows="9"><%=rs("content")%></textarea></td>
    </tr>
    <%
if rs("suggestion")<>"" then
%>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>总监处理意见及建议</td>
      <td><textarea name="suggestion" cols="64" rows="5" id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
    <%end if%>
    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>顾客服务部意见</td>
      <td><textarea name="maiguancontent" cols="64" rows="5"><%if rs("suggestion_mgbz")<>"无" then response.Write(rs("suggestion_mgbz")) end if%></textarea></td>
      </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td height="48" align=center>是否罚款/奖励</td>
      <td><select name="zj_pd_3" id="zj_pd_3">
      <%if rs("zj_pd_3")=0 then%>
      <option value="0" selected>否</option>
      <option value="1">罚款</option>
      <option value="2">奖励</option>
      <%elseif rs("zj_pd_3")=1 then%>
      <option value="0">否</option>
      <option value="1" selected>罚款</option>
      <option value="2">奖励</option>
      <%elseif rs("zj_pd_3")=2 then%>
      <option value="0">否</option>
      <option value="1">罚款</option>
      <option value="2" selected>奖励</option>
      <%else%>
      <option value="99">参数异常,请联系开发者</option>
      <%end if%>
      </select> 
      <span class="money"><input type="text" id="money" name="money" size="10" value="0">
        元</span></td>
    </tr>

    <%if rs("suggestion_hr")<>"无" then%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>人力资源部意见</td>
      <td><p><%=rs("suggestion_hr")%></p>
      </td>
    </tr>
<%end if%>    
    
<%if rs("suggestion_zgld")<>"无" then%>      
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>主管领导意见</td>
      <td><p><%=rs("suggestion_zgld")%></p>
        签章：
          <input type="text" value="<%=rs("bossname")%>" size="8" readonly />
</td>
    </tr>
<%end if%>     

<%if rs("suggestion_zrbm")<>"无" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>相关部门意见</td>
      <td><p><%=rs("suggestion_zrbm")%></p>
       签章：
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>

<%if rs("suggestion_zrbm2")<>"无" then%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>相关部门意见</td>
      <td><p><%=rs("suggestion_zrbm2")%></p>
       签章：
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
       </td>
    </tr>
<%end if%>
    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="审 核" name="send" id="send" onClick="form1.action='/asp/step_bz/JK_addNews_buzhangchushen_tj.asp?newsid=<%=rs("newsid")%>';return checkform();">
        <input type="submit" value="撤 单" name="delete" onClick="form1.action='/asp/step_bz/JK_addNews_buzhangdelete_tj.asp?newsid=<%=rs("newsid")%>';return ifdelete();">
         <input type="reset" value="重 填" name="clear">
        <input type = "button" name = "button1" value = "返 回" onClick = "javascript:history.back(-1);"></td>
    </tr>
  </table>
</form>
<script type="text/javascript">
$(document).ready(function(e) {
	ifmoneyshow();
	$("#zj_pd_3").on("change",function(e){
		ifmoneyshow();
	});
});

function ifmoneyshow(){
	if (document.form1.zj_pd_3.value == 0){
		$(".money").hide();
	}else{
		$(".money").show();
	}

}
 
function checkform(){
	if(document.form1.maiguancontent.value==""){
		alert("请您填写意见。");
		return false;
	}else{
		return true;
	}
};

function ifdelete(){
	if(confirm("确认要撤销此单据么？初审中被撤销的单据将直接入库。")){
		return true;
	}else{
		return false;
	};
};
</script>

<%
  Set rs = Nothing
  Set Conn = Nothing
%>
</BODY>
</HTML>
