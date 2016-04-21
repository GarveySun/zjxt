<HTML>
<HEAD>
<style type="text/css">
<!--
.topic { font-family: "宋体"; font-size: 11pt; vertical-align: middle; line-height:16pt;}
.small { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input  { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
a:link {color:#0F56A3;font-style:normal;cursor:hand;text-decoration:normal}
a:visited {color:#0F56A3;font-style:normal;text-decoration:normal}
a:active {color:#0F56A3;font-style:normal;text-decoration:normal}
a:hover {color:#CC0000;font-style:bold;text-decoration:none}
-->
</style>
<STYLE type=text/css>BODY {
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
<TITLE>密码更改</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 <form action="/asp/changepw_tj.asp" method="post">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD"> 
    <tr bgcolor="#FF8686"> 
      <td colspan=4 align="center" class=topic>密码更改</td> 
  </tr> 
  <tr bgcolor="#bdf3eb" class=small>  
      <td align=right bgcolor="#FFFFFF">&nbsp;原密码&nbsp;</td> 
      <td bgcolor="#FFFFFF">&nbsp;
<input type="password" name="password" size="16" maxlength=16 value="">
        &nbsp;</td> 
  </tr> 
  <tr bgcolor="#eaeaf4" class=small>  
      <td align=right bgcolor="#F9F9F9">&nbsp;新密码&nbsp;</td> 
      <td bgcolor="#F9F9F9">&nbsp; 
        <input type="password" name="password1" size="16" maxlength=16 value="">
        &nbsp;</td> 
  </tr> 
  <tr bgcolor="#bdf3eb" class=small>  
      <td align=right bgcolor="#FFFFFF">&nbsp;再输入一次新密码&nbsp;</td> 
      <td bgcolor="#FFFFFF">&nbsp;
<input type="password" name="password2" size="16" maxlength=16 value="">
        &nbsp;</td> 
  </tr> 
    <tr bgcolor="#FFFFFF"> 
      <td align=center colspan=2> 
        <input type="submit" value="确 认" name="send">
        <input type = "button" name = "button1" value = "返 回" onclick = "javascript:history.back(-1);"></td> 
  </tr>
 </table>
  <p align="center">注意:1.更新密码两次要一致.2.输入密码长度最多16位.</p>
</form>
 
<p align=center class=small>&nbsp; </p>
</BODY>
</HTML>
