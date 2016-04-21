<!--#include file ="../config.asp"-->
<%
dim Conn, rs
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open DBstr
  Set rs = Server.CreateObject("ADODB.Recordset")
  sql = "Select * from news where newsid=" & Request("newsid")
  rs.open sql, conn, 3, 2 
%>
<HTML>
<HEAD>
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
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

<style type="text/css">
#divCollapse
{
    display:block;
    top: 80px;
    right: 3px;             /*举例右边3像素*/
    position:fixed;    
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #FDDC92;
    padding-bottom: 3px;
    width: 40px;    
    background-color:gold;
}
.topic { font-family: "宋体"; font-size: 11pt; vertical-align: middle; line-height:16pt;
background-color:#F60}
.small { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:16pt;
background-color:#BDFCC9;}
input,textarea { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
a:link {color:#0F56A3;font-style:normal;cursor:hand;text-decoration:normal}
a:visited {color:#0F56A3;font-style:normal;text-decoration:normal}
a:active {color:#0F56A3;font-style:normal;text-decoration:normal}
a:hover {color:#CC0000;font-style:bold;text-decoration:none}
</style>
<script type="text/javascript">
function confirmif()
{
	if(confirm("确认要按此页内容修改单据么？提交后将不可恢复！"))
	{
	return true;
	}
	else
	{return false;
	}
}
function ifdelete()
{
	if(confirm("确认要彻底删除此张单据么？删除后将不可恢复！"))
	{
	return true;
	}
	else
	{return false;
	}
}

</script>

<TITLE>编辑单据</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY>
<div id="divCollapse">返回</div>
<form action="/asp/edit_jk/jk_edit_tj.asp?newsid=<%=rs("newsid")%>" method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF"  width="646">
    <tr > 
      <td colspan=4 align="center" class=topic>编辑单据</td>
    </tr>
    <tr class=small> 
      <td width="96" align=center>发单日期</td>
      <td width="540"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="80" maxlength="80"></td>
    </tr>
    <tr class=small>
      <td align=center>责任人</td>
      <td><input name="prisoner" type="text" id="time3" value="<%=rs("prisoner")%>" size="80" maxlength="80"></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>类别</td>
      <td>
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
    <tr class=small>
      <td align=center>所属部门</td>
      <td height="2" colspan="6" >①
        <select name="department" id="department">
      	<option value="<%=rs("department")%>" selected><%=rs("department")%></option>
		<option value="总经办">总经办</option>
        <option value="市场营销部">市场营销部</option>
        <option value="业务营运部">业务营运部</option>
        <option value="财务部">财务部</option>
        <option value="党委工作部">党委工作部</option>
        <option value="工会">工会</option>
        <option value="人力资源部">人力资源部</option>
        <option value="顾客服务部">顾客服务部</option>
        <option value="安全保卫部">安全保卫部</option>
        <option value="后勤管理部">后勤管理部</option>
        <option value="储运部">储运部</option>
        <option value="化妆销售部">化妆销售部</option>
        <option value="珠宝精品销售部">珠宝精品销售部</option>
        <option value="女装销售部">女装销售部</option>
        <option value="皮具销售部">皮具销售部</option>
        <option value="男装运动销售部">男装运动销售部</option>
        <option value="家用儿童销售部">家用儿童销售部</option>
        <option value="功能销售部">功能销售部</option>
        <option value="超市销售部">超市销售部</option>
        <option value="特卖场销售部">特卖场销售部</option>
      </select>
        ②
        <select name="over_char2" id="over_char2">
          <option value="<%=rs("over_char2")%>" selected><%=rs("over_char2")%></option>
       <option value="总经办">总经办</option>
        <option value="市场营销部">市场营销部</option>
        <option value="业务营运部">业务营运部</option>
        <option value="财务部">财务部</option>
        <option value="党委工作部">党委工作部</option>
        <option value="工会">工会</option>
        <option value="人力资源部">人力资源部</option>
        <option value="顾客服务部">顾客服务部</option>
        <option value="安全保卫部">安全保卫部</option>
        <option value="后勤管理部">后勤管理部</option>
        <option value="储运部">储运部</option>
        <option value="化妆销售部">化妆销售部</option>
        <option value="珠宝精品销售部">珠宝精品销售部</option>
        <option value="女装销售部">女装销售部</option>
        <option value="皮具销售部">皮具销售部</option>
        <option value="男装运动销售部">男装运动销售部</option>
        <option value="家用儿童销售部">家用儿童销售部</option>
        <option value="功能销售部">功能销售部</option>
        <option value="超市销售部">超市销售部</option>
        <option value="特卖场销售部">特卖场销售部</option>
      </select></td>
    </tr>

     <tr class=small>
      <td width="96" align=center>单据流程跳转</td>
       <td>
        <select name="danjupd">
        <option value="<%=rs("danjupd")%>" selected>
		<%if rs("danjupd") = 0 then %>顾客服务部初审
	<%elseif rs("danjupd") = 1 then%>人力资源部初审
    <%elseif rs("danjupd") = 2 then%>主管领导初审
    <%elseif rs("danjupd") = 3 then%>责任部门初审阅单
    <%elseif rs("danjupd") = 4 then%>顾客服务部复审
    <%elseif rs("danjupd") = 5 then%>人力资源部复审
    <%elseif rs("danjupd") = 6 then%>主管领导复审
    <%elseif rs("danjupd") = 7 then%>责任部门复审阅单
    <%elseif rs("danjupd") = 8 then%>财务部审核
    <%elseif rs("danjupd") = 9 then%>单据入库前确认
    <%elseif rs("danjupd") = 12 then%>主管领导初审打回
    <%elseif rs("danjupd") = 13 then%>主管领导复审打回
    <%else%>单据入库
	<%end if%></option>
        <option value="0">顾客服务部初审</option>
        <option value="1">人力资源部初审</option>
        <option value="2">主管领导初审</option>
        <option value="12">主管领导初审打回</option>
        <option value="3">责任部门初审阅单</option>
        <option value="4">顾客服务部复审</option>
        <option value="5">人力资源部复审</option>
        <option value="6">主管领导复审</option>
        <option value="13">顾客服务部初审</option>
        <option value="7">责任部门复审阅单</option>
        <option value="8">财务部审核</option>
        <option value="9">单据入库前确认</option>
        <option value="10">单据入库</option>
        </select>
    </td>
    </tr>
    <tr class=small>
      <td width="96" align=center>反映标题</td>
      <td><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="80"></td>
    </tr>
    <tr class=small> 
      <td width="96" align=center>反映内容</td>
      <td width="540"><textarea name="content" cols="64" rows="9"><%=rs("content")%></textarea>
      </td>
    </tr>
    <tr class=small>
      <td width="96" align=center>总监处理意见及建议</td>
      <td><textarea name="suggestion" cols="64" rows="5" id="suggestion"><%=rs("suggestion")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>是否奖惩</td>
      <td><select name="zj_pd_3" id="zj_pd_3">
          <option value="<%=rs("zj_pd_3")%>" selected>
          <%if rs("zj_pd_3")=0 then%>不予现金奖惩
          <%elseif rs("zj_pd_3")=1 then%>惩罚
          <%elseif rs("zj_pd_3")=2 then%>奖励
          <%else%>错误参数<%end if%></option>
          <option value="0">不予现金奖惩</option>
          <option value="1">惩罚</option>
          <option value="2">奖励</option></select><br />处罚金额：<input name="money" value="<%=rs("money")%>"><br />奖励金额：<input name="bonus" value="<%=rs("bonus")%>"></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>顾客服务部初审意见</td>
      <td><textarea name="suggestion_mgbz" cols="64" rows="5" id="suggestion"><%=rs("suggestion_mgbz")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>人力资源部审核意见</td>
      <td><textarea name="suggestion_hr" cols="64" rows="5" id="suggestion"><%=rs("suggestion_hr")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>主管领导意见</td>
      <td><textarea name="suggestion_zgld" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zgld")%></textarea>签阅账号：<%=rs("bossname")%></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>第一责任部门意见</td>
      <td><textarea name="suggestion_zrbm" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbm")%></textarea>签阅账号：<%=rs("zrbm_name")%></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>第二责任部门意见</td>
      <td><textarea name="suggestion_zrbm2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbm2")%></textarea>签阅账号：<%=rs("zrbm_name2")%></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>顾客服务部复审意见</td>
      <td><textarea name="suggestion_mgbz2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_mgbz2")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>人力资源部复审意见</td>
      <td><textarea name="suggestion_hr2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_hr2")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>主管领导复审意见</td>
      <td><textarea name="suggestion_zgld2" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zgld2")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>第一责任部门复核意见</td>
      <td><textarea name="suggestion_zrbmr" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbmr")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>第二责任部门复核意见</td>
      <td><textarea name="suggestion_zrbm2r" cols="64" rows="5" id="suggestion"><%=rs("suggestion_zrbm2r")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="96" align=center>财务部审核</td>
      <td><textarea name="suggestion_cw" cols="64" rows="5" id="suggestion"><%=rs("suggestion_cw")%></textarea></td>
    </tr>  
  </table>
<p align=center class=small style="background-color:#FFF">
<input type="submit" name="submit" value="保存修改" onClick="return confirmif();">
<input type="submit" name="submit" value="彻底删除" onClick="form1.action='/asp/edit_JK/delete.asp?newsid=<%=rs("newsid")%>';return ifdelete();">
  <input type = "button" name = "button1" value = "返 回" onClick = "javascript:history.back(-1);">
  
</p>
</form>
<%
rs.close
conn.close
set rs=nothing
set conn=nothing
%>
</BODY>
</HTML>
