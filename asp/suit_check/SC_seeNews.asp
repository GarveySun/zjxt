<!--#include file ="../config.asp"-->
<!--#include file ="../quit.asp"-->
<%
dim Conn, rs
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "Select * from suit_check where newsid=" & Request("newsid")&"order by newsid desc"
rs.open sql, conn, 3, 2
%>
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
.dresspic{
	width:400px}
</STYLE>
<TITLE>查看工装审批单</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="GB2312">
</HEAD>
<BODY bgcolor="#FFFFFF">
 
<form method="post" name="form1" enctype="multipart/form-data">
  <table align=center border="1" cellspacing="0" cellpadding="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#F2FDFD" width="700">
    <tr bgcolor="#FF4242"> 
      <td colspan=9 align="center" class=topic>查看工装审批单</td>
    </tr>
    <tr class=small>
      <td width="600" align=right>单据编号</td>
      <td height="2" colspan="6">
       <input name="newsid" type="text" id="newsid" value="<%=rs("newsid")%>" size="66" maxlength="64" readonly>
       </td>
    </tr>
    <tr class=small>
      <td width="600" align=right >提交部门：</td>
      <td height="2" colspan="6">
       <input name="department" type="text" id="department" value="<%=rs("department")%>" size="66" maxlength="64" readonly>
       </td>
    </tr>
    <tr class=small>
      <td width="600" height="1" align=right>提交人：</td>
      <td colspan="6"><input name="name" type="text" id="name" value="<%=rs("proposer")%>" size="66" maxlength="64" readonly></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right>专柜名称：</td>
      <td colspan="6"><input type="text" name="shoppe" size="100" maxlength="50" value="<%=rs("shoppe")%>" id="shoppe"></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right>着装时间：</td>
      <td colspan="6"><input type="text" name="dresstime" size="100" maxlength="50" value="<%=rs("dresstime")%>" id="dresstime"></td>
    </tr>
    <tr class=small>
      <td width="600" height="8" align=right>着装照片：</td>
      <td colspan="6">
      <%for i=0 to 3
	  		if rs("picname"&i)<>"0" then
				%><img class="dresspic" src="../../suit_photos/<%=rs("picname"&i)%>" /><br /><br /><%
			end if
		next%>
      </td>
    </tr>
    <tr class=small>
      <td width="600" height="16" align=right>备注说明：</td>
      <td colspan="6"><textarea name="content" rows="10" cols="70"><%=rs("content")%></textarea></td>
    </tr>
   <tr class=small>
      <td width="600" height="16" align=right>顾客服务部意见：</td>
      <td colspan="6"><textarea name="content" rows="10" cols="70"><%=rs("suggestion")%></textarea></td>
    </tr>
    <tr class=small>
      <td width="600" height="30" align=right>提交日期：</td>
      <td colspan="6"><input name="time" type="text" id="time" value="<%=rs("time")%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td align=center colspan=7 bgcolor="#ffefbf">
        
        <input type = "button" name = "button1" value = "关 闭" onclick = "javascript:window.close();">
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
