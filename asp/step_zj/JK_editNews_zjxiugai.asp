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
<script language="javascript"> 
function checkvalue()
{
	if(document.form1.suggestion.value=="")
	{
		alert("请您填写意见。");
		return false;
	}
	if(document.form1.content.value=="")
	{
		alert("请您填写内容。");
		return false;
	}
}

function ifdelete()
{
	if(confirm("确认要删除此单据么？此操作不可恢复。"))
	{
	return true;
	}
	else
	{return false;
	}
}

 $(document).ready(function(e) {
    $("#classname").change(function(e) {
        if ($(this).val()=="违纪单")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- 请选择 -</option>");
			$("#typename").append("<option value='使用手机'>使用手机</option>");
			$("#typename").append("<option value='串岗'>串岗</option>");
			$("#typename").append("<option value='聊天'>聊天</option>");
			$("#typename").append("<option value='柜台说笑'>柜台说笑</option>");
			$("#typename").append("<option value='私人物品'>私人物品</option>");
			$("#typename").append("<option value='吃东西'>吃东西</option>");
			$("#typename").append("<option value='食品带入柜台'>食品带入柜台</option>");
			$("#typename").append("<option value='上班购物'>上班购物</option>");
			$("#typename").append("<option value='做与工作无关的事'>做与工作无关的事</option>");
			$("#typename").append("<option value='趴靠柜台'>趴靠柜台</option>");
			$("#typename").append("<option value='电脑上网'>电脑上网</option>");
			$("#typename").append("<option value='违纪警示'>违纪警示</option>");
			$("#typename").append("<option value='其它'>其它</option>");
		}
		else if ($(this).val()=="案例单")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- 请选择 -</option>");
			$("#typename").append("<option value='服务投诉'>服务投诉</option>");
			$("#typename").append("<option value='商品投诉'>商品投诉</option>");
			$("#typename").append("<option value='违纪共性问题'>违纪共性问题</option>");
			$("#typename").append("<option value='优质服务'>优质服务</option>");
			$("#typename").append("<option value='其它'>其它</option>");
		}
		else if ($(this).val()=="情况反映单")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- 请选择 -</option>");
			$("#typename").append("<option value='设备设施'>设备设施</option>");
			$("#typename").append("<option value='环境卫生'>环境卫生</option>");
			$("#typename").append("<option value='视觉陈列题'>视觉陈列</option>");
			$("#typename").append("<option value='物价质量'>物价质量</option>");
			$("#typename").append("<option value='仪容仪表'>仪容仪表</option>");
			$("#typename").append("<option value='班前会'>班前会</option>");
			$("#typename").append("<option value='营销策划'>营销策划</option>");
			$("#typename").append("<option value='应知应会'>应知应会</option>");
			$("#typename").append("<option value='联合检查'>联合检查</option>");
			$("#typename").append("<option value='经营管理'>经营管理</option>");
			$("#typename").append("<option value='其它'>其它</option>");
		}
		else if ($(this).val()=="表扬单")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- 请选择 -</option>");
			$("#typename").append("<option value='顾客表扬'>顾客表扬</option>");
			$("#typename").append("<option value='热情服务'>热情服务</option>");
			$("#typename").append("<option value='拾金不昧'>拾金不昧</option>");
			$("#typename").append("<option value='统一规范'>统一规范</option>");
			$("#typename").append("<option value='其它'>其它</option>");
		}
		else
		{
			$("#typename option").remove();
		    $("#typename").append("<option value=''>- 请选择 -</option>");
		}
    });
});
</script>
<link href="/css/bill.css" rel="stylesheet" type="text/css">
<TITLE>最新信息  更正</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<form method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="646">
    <tr bgcolor="#FF8080">
      <td colspan=4 align="center" class=topic>总监修改单据</td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>单据编号</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("newsid")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>发单日期</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>发单人</td>
      <td><input name="name" type="text" id="name" value="<%=rs("name")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>责任人</td>
      <td><input name="prisoner" type="text" id="time3" value="<%=rs("prisoner")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>类别</td>
       <td width="601" colspan="6" bgcolor="#F9F9F9">
        <select name="classname" id="classname" > 
        <option  value="<%=rs("classname")%>" selected><%=rs("classname")%></option> 
        <option value="违纪单">违纪单</option>
        <option value="案例单">案例单</option>
        <option value="情况反映单">情况反映单</option>
        <option value="表扬单">表扬单</option>
        </select>
		<select name="typename" id="typename"> 
        <option  value="<%=rs("typename")%>" selected><%=rs("typename")%></option> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#F9F9F9" class=small>
      <td align=center>所属部门</td>
      <td height="2" colspan="6" bgcolor="#F9F9F9">①
        <select name="department" id="department">
      	<option value="<%=rs("department")%>" selected><%=rs("department")%></option>
		<option value="总经办">总经办</option>
        <option value="市场营销部">市场营销部</option>
        <option value="业务营运部">业务营运部</option>
        <option value="财务部">财务部</option>
        <option value="党委工作部">党委工作部</option>
        <option value="工会">工会</option>
        <option value="人力资源部">人力资源部</option>
        <option value="卖场管理部">卖场管理部</option>
        <option value="安全保卫部">安全保卫部</option>
        <option value="后勤管理部">后勤管理部</option>
        <option value="储运部">储运部</option>
        <option value="化妆销售部">化妆销售部</option>
        <option value="珠宝精品销售部">珠宝精品销售部</option>
        <option value="女装销售部">女装销售部</option>
        <option value="皮具销售部">皮具销售部</option>
        <option value="男装运动销售部">男装运动销售部</option>
        <option value="家用儿童销售部">家用儿童销售部</option>
        <option value="功能卖场">功能卖场</option>
        <option value="超市销售部">超市销售部</option>
        <option value="特卖场销售部">特卖场销售部</option>
      </select>
        ②
        <select name="department2" id="department2">
          <option value="<%=rs("over_char2")%>" selected><%=rs("over_char2")%></option>
       <option value="总经办">总经办</option>
        <option value="市场营销部">市场营销部</option>
        <option value="业务营运部">业务营运部</option>
        <option value="财务部">财务部</option>
        <option value="党委工作部">党委工作部</option>
        <option value="工会">工会</option>
        <option value="人力资源部">人力资源部</option>
        <option value="卖场管理部">卖场管理部</option>
        <option value="安全保卫部">安全保卫部</option>
        <option value="后勤管理部">后勤管理部</option>
        <option value="储运部">储运部</option>
        <option value="化妆销售部">化妆销售部</option>
        <option value="珠宝精品销售部">珠宝精品销售部</option>
        <option value="女装销售部">女装销售部</option>
        <option value="皮具销售部">皮具销售部</option>
        <option value="男装运动销售部">男装运动销售部</option>
        <option value="家用儿童销售部">家用儿童销售部</option>
        <option value="功能卖场">功能卖场</option>
        <option value="超市销售部">超市销售部</option>
        <option value="特卖场销售部">特卖场销售部</option>
      </select></td>
     
    </tr>
 
    <tr bgcolor="#F9F9F9" class=small>
      <td width="96" align=center>反映标题</td>
      <td><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="80" ></td>
    </tr>
    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>反映内容</td>
      <td width="540"><textarea name="content" cols="64" rows="9"><%=rs("content")%></textarea></td>
    </tr>

    <tr bgcolor="#FFFFFF" class=small>
      <td width="96" align=center>总监处理意见及建议</td>
      <td><textarea name="suggestion" cols="64" rows="5" id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
<%if rs("suggestion_mgbz")="无" then'卖管初审未审，不罗列任何结果
elseif rs("suggestion_mgbz2")="无" then'这是没经过复审的单子，不罗列复审结果%>
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>顾客服务部意见</td>
      <td><p><%=rs("suggestion_mgbz")%> </p>
        <% if rs("zj_pd_3") = 1 then %>
        <p style="left:20Px;">现金处罚 <%=rs("money")%>元</p>
        <%elseif rs("zj_pd_3")=2 then%>
        <p style="left:20Px;">现金奖励 <%=rs("bonus")%>元</p>
        <%else%>
        <p>不予现金处罚</p>
        <%end if%></td>
    </tr> 
<%else%>    
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center>顾客服务部意见</td>
      <td><p>初审意见：<%=rs("suggestion_mgbz")%> </p>
        <P>复审意见：<%=rs("suggestion_mgbz2")%> <br />
        <%if rs("zj_pd_3") = 1 and rs("zj_pd_32")= 1 then %>
        <p>初审现金处罚 <%=rs("money")%>元，二次审核裁定处罚金额为<%=rs("money2")%>元。</p>
        <%elseif rs("zj_pd_3") = 1 and rs("zj_pd_3")= 0 then%>
        <p>初审现金处罚<%=rs("money")%>元，二次审核裁定不予现金处罚</p>
        <%elseif rs("zj_pd_3") = 0 and rs("zj_pd_3")= 0 then%>
        <p>不予现金处罚。</p>
        <%elseif rs("zj_pd_3") = 2 then %>
        <p>现金奖励 <%=rs("bonus")%>元。</p>
        <%end if%></td>
    </tr>    
<%end if%>   
    
<%if rs("suggestion_hr")="无" then
elseif rs("suggestion_hr2")="无" then%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>人力资源部意见</td>
      <td><p><%=rs("suggestion_hr")%></p>
      </td>
    </tr>
<%else%>     
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center>人力资源部意见</td>
      <td><p>初审意见：<%=rs("suggestion_hr")%></p>
      <p>复审意见：<%=rs("suggestion_hr2")%></p>
      </td>
    </tr>   
<%end if%>    
    
<%if rs("suggestion_zgld")="无" then
elseif rs("suggestion_zgld2")="无" then%>      
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>主管领导意见</td>
      <td><p><%=rs("suggestion_zgld")%></p>
        主管领导签章：
          <input type="text" value="<%=rs("bossname")%>" size="8" readonly />
</td>
    </tr>
<%else%>      
      <tr bgcolor="#FFFFFF" class=small>
      <td align=center>主管领导意见</td>
      <td><p>初审意见：<%=rs("suggestion_zgld")%></p>
      <p>复审意见：<%=rs("suggestion_zgld2")%></p>
        主管领导签章：
          <input type="text" value="<%=rs("bossname")%>" size="8" readonly />
      </td>
      </tr>  
<%end if%>     
 
 
 <%if rs("suggestion_zrbm")="无" then'第一责任部门意见为无，则不显示
elseif rs("over_char2")="无" and rs("suggestion_zrbmr")="无"then'否则判断是否有第二责任部门%>    
    <tr bgcolor="#FFFFFF" class=small>
      <td align=center>相关部门意见</td>
      <td><p><%=rs("suggestion_zrbm")%></p>
       签章：
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%elseif rs("over_char2")="无" and rs("suggestion_zrbmr")<>"无"then%>
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center>相关部门意见</td>
      <td><p>初审意见：<%=rs("suggestion_zrbm")%></p>
      <p>复审意见：<%=rs("suggestion_zrbmr")%></p>
       签章：
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
       </td>
    </tr>
<%elseif rs("suggestion_zrbmr")="无"then%>
      <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("department")%>意见</td>
      <td><p><%=rs("suggestion_zrbm")%></p>
             签章：
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />
      </td>
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("over_char2")%>意见</td>
      <td><p><%=rs("suggestion_zrbm2")%></p>
             签章：
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
      </td>
      </tr>
<%else%>    
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("department")%>意见</td>
      <td><p>初审意见：<%=rs("suggestion_zrbm")%></p>
      <p>复审意见：<%=rs("suggestion_zrbmr")%></p>
             签章：
          <input type="text" value="<%=rs("zrbm_name")%>" size="8" readonly />

      </td>
     <tr bgcolor="#FFFFFF" class=small>
      <td align=center><%=rs("over_char2")%>意见</td>
      <td><p>初审意见：<%=rs("suggestion_zrbm2")%></p>
      <p>复审意见：<%=rs("suggestion_zrbm2r")%></p>
             签章：
          <input type="text" value="<%=rs("zrbm_name2")%>" size="8" readonly />
      </td>
    </tr>
<%end if%>     


    <tr bgcolor="#ffefbf">
      <td align=center colspan=2><input type="submit" value="提  交" name="send" onClick="form1.action='/asp/step_zj/JK_addNews_xg.asp?newsid=<%=rs("newsid")%>';return checkvalue();">
        <input type="submit" value="删  除" name="delete" onClick="form1.action='/asp/step_zj/JK_addNews_zjxiugai_tjdelete.asp?newsid=<%=rs("newsid")%>';return ifdelete();">
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
