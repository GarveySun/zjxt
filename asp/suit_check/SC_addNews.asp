<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<HTML>
<HEAD>
<script src="../../jquery/jquery-1.9.1.min.js"></script>
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
<TITLE>填写工装审批单</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 <p>&nbsp;</p>
<form method="post" name="form1" enctype="multipart/form-data">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="700">
    <tr bgcolor="#FF4242"> 
      <td colspan=9 align="center" class=topic>工装审批单</td>
    </tr>
    <tr class=small>
      <td width="600" align=right bgcolor="#F9F9F9">提交部门：</td>
      <td height="2" colspan="6" bgcolor="#F9F9F9">
        <select name="department" id="department">
      	<option value="" selected></option>
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
       </td>
    </tr>
    <tr class=small>
      <td width="600" height="1" align=right bgcolor="#F9F9F9">提交人：</td>
      <td bgcolor="#F9F9F9" colspan="6"><input name="name" type="text" id="name" value="<%=Session("name")%>" size="66" maxlength="64" readonly></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right bgcolor="#F9F9F9">专柜名称：</td>
      <td bgcolor="#F9F9F9" colspan="6"><input type="text" name="shoppe" size="100" maxlength="50" value="" id="shoppe"></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right bgcolor="#F9F9F9">着装时间：</td>
      <td bgcolor="#F9F9F9" colspan="6"><input type="text" name="dresstime" size="100" maxlength="50" value="" id="dresstime"></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right bgcolor="#F9F9F9">上传照片：</td>
      <td bgcolor="#F9F9F9" colspan="6"><input class="fileinput" type="file" name="pic[]" value=""><br /><input class="fileinput" type="file" name="pic[]" value=""><br /><input class="fileinput" type="file" name="pic[]" value=""><br /><input class="fileinput" type="file" name="pic[]" value=""></td>
    </tr>
    <tr class=small>
      <td width="600" height="16" align=right bgcolor="#F9F9F9">备注说明：</td>
      <td bgcolor="#F9F9F9" colspan="6"><textarea name="content" rows="10" cols="70"></textarea></td>
    </tr>
   
    <tr class=small>
      <td width="600" height="30" align=right bgcolor="#F9F9F9">提交日期：</td>
      <td colspan="6" bgcolor="#F9F9F9"><input name="time" type="text" id="time" value="" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td align=center colspan=7 bgcolor="#ffefbf">
        <input type="button" name="onsubmit" id="onsubmit" value="提 交" >
        <input type = "button" name = "button1" value = "返 回" onclick = "javascript:history.back(-1);">
        </td>
    </tr>

  </table>

</form>
 
<script language="javascript">
var date = new Date();
    wdate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()
wdate += " " + date.getHours()+":"+ date.getMinutes();
document.form1.time.value = wdate;

$(document).ready(function(e) {
    $("#onsubmit").on('click',function(e) {
		$(".fileinput").each(function(e) {
            if($(this).val()==="") {
				$(this).remove();
			}
        });
		document.form1.action = "/asp/suit_check/upload.php";
		document.form1.submit();
	});
});

</script>
</BODY>
</HTML>
