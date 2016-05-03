<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<script src="../../js/config.js"></script>
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
	//通过自定义方法为部门选项增加部门
	Config.Setdepartment("department");
	Config.Setdepartment("department2");
	//增加单据类别
	Config.Setclassname("classname");
	
	$("#classname").change(function(e){
		$("#typename option").remove();
		$("#typename").append("<option value='all' selected>全部</option>");
		Config.Changetypename("classname","typename");
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
      	<option value="" selected>请选择</option>
      </select>
        ②
        <select name="department2" id="department2">
          <option value="无" selected>无</option>
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
