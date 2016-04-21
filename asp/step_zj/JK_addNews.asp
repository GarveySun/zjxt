<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script language="javascript">
function checkvalue()
{
if(document.getElementById("classname").value==""||document.getElementById("typename").value=="")
{alert("请选择类别。");
return false;
}
if(document.getElementById("department").value=="")
{alert("请选择所属部门。");
return false;
}
if(document.form1.prisoner.value=="")
{alert("请填写责任人。");
return false;
}
if(document.form1.title.value=="")
{alert("请填写标题。");
return false;}
if(document.form1.content.value=="")
{alert("请填写内容。");
return false;
}
if(document.getElementById("department").value==document.getElementById("department2").value)
{alert("请选择不同的所属部门。");
return false;
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
<STYLE type=text/css>
.topic { font-family: "宋体"; font-size: 11pt; vertical-align: middle; line-height:16pt;}
.small { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
BODY {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
TD {
	COLOR:#000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
DIV {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
A:link {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
A:hover {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: underline
}
A:visited {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: none
}
A:active {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; TEXT-DECORATION: underline
}
.h1 {
	COLOR: #000000; FONT-FAMILY: "宋体"; FONT-SIZE: 12px; LETTER-SPACING: 3px; TEXT-DECORATION: none; TEXT-INDENT: 20px; VERTICAL-ALIGN: 500%
}
</STYLE>
<TITLE>填写反映单</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 <p>&nbsp;</p>
<form  onSubmit="return checkvalue();" action="/asp/step_zj/JK_addNews_tj.asp" method="post" name="form1">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="707">
    <tr bgcolor="#FF4242"> 
      <td colspan=9 align="center" class=topic>填写反映单</td>
    </tr>
    <tr class=small>
      <td width="601" height="2" align=right bgcolor="#F9F9F9">类别</td>
      <td width="601" colspan="6" bgcolor="#F9F9F9">
        <select name="classname" id="classname" > 
        <option  value="" selected>- 请选择 -</option> 
        <option value="违纪单">违纪单</option>
        <option value="案例单">案例单</option>
        <option value="情况反映单">情况反映单</option>
        <option value="表扬单">表扬单</option>
        </select>
		<select name="typename" id="typename"> 
        <option  value="" selected>- 请选择 -</option> 
        </select>
      </td>
    </tr>
    <tr class=small>
      <td width="601" align=right bgcolor="#F9F9F9">责任部门</td>
      <td height="2" colspan="6" bgcolor="#F9F9F9">①
        <select name="department" id="department">
      	<option value="" selected></option>
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
        <select name="department2" id="department2">
          <option value="无" selected></option>
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
      <td width="601" height="1" align=right bgcolor="#F9F9F9">责任人</td>
      <td bgcolor="#F9F9F9" colspan="6"><input name="prisoner" type="text" id="prisoner" value="" size="66" maxlength="16"></td>
    </tr>
    <tr class=small>
      <td width="601" height="1" align=right bgcolor="#F9F9F9">发单人</td>
      <td bgcolor="#F9F9F9" colspan="6"><input name="name" type="text" id="name" value="<%=Session("name")%>" size="66" maxlength="64" readonly></td>
    </tr>
    <tr class=small>
      <td width="601" height="8" align=right bgcolor="#F9F9F9">反映标题</td>
      <td bgcolor="#F9F9F9" colspan="6"><input type="text" name="title" size="100" maxlength="50" value="" id="title"></td>
    </tr>
    <tr class=small>
      <td width="601" height="16" align=right bgcolor="#F9F9F9">反映内容</td>
      <td bgcolor="#F9F9F9" colspan="6"><textarea name="content" rows="10" cols="70"></textarea></td>
    </tr>
    <tr class=small>
      <td width="601" align=right bgcolor="#F9F9F9">处理意见及建议</td>
      <td colspan="6" bgcolor="#F9F9F9"><textarea name="suggestion" rows="10" cols="70" id="suggestion"></textarea></td>
    </tr>
    <tr class=small>
      <td width="601" height="30" align=right bgcolor="#F9F9F9">单据日期</td>
      <td colspan="6" bgcolor="#F9F9F9"><input name="time" type="text" id="time" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td align=center colspan=7 bgcolor="#ffefbf"><label>
        <input type="submit" name="onsubmit" id="onsubmit" value="提 交" >
      </label>
        <input type="reset" value="清 空" name="clear">
        <input type = "button" name = "button1" value = "返 回" onclick = "javascript:history.back(-1);">
        </td>
    </tr>

  </table>

</form>
 
<p align=center class=small>&nbsp; </p>
</BODY>
</HTML>
