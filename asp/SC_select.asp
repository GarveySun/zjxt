<HTML>
<HEAD>
<script src="../jquery/jquery-1.9.1.min.js"></script>
<script src="../../js/config.js"></script>
<script language = "JavaScript">
var rolename = "<%=session("rolename")%>",
	department = "<%=session("department")%>"
	
$(document).ready(function(e) {
	//通过自定义方法为部门选项增加部门
	Config.Setdepartment("department");

	$("#startid,#endid").keyup(function(e) {
        if ($("#startid").val()==="" && $("#endid").val()==="") {
			$("#tips").hide();
		}else{
			$("#tips").show();
		}
    });
	
	if (rolename === "超级管理员" ||department === "顾客服务部") {
	}else{
		var obj = document.getElementById("department");
		obj.options.length = 0;
		obj.add(new Option(department,department));
	}
});


function SearchSuitcheck(){
	form1.action="SC_select_tj_serch.asp";
	form1.submit();
}
</script>
<style type="text/css">
<!--
.topic { font-family: "宋体"; font-size: 11pt; vertical-align: middle; line-height:16pt;}
.small { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "宋体"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
a:link {color:#0F56A3;font-style:normal;cursor:hand;text-decoration:normal}
a:visited {color:#0F56A3;font-style:normal;text-decoration:normal}
a:active {color:#0F56A3;font-style:normal;text-decoration:normal}
a:hover {color:#CC0000;font-style:bold;text-decoration:none}
table{border-collapse:collapse;border:none;}
td{border:solid #000000 1px}
-->
</style>
<TITLE>查询工装审批单</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<p>&nbsp;</p>
<form method="post" name="form1">
<table align=center cellspacing="0" cellpadding="1" width="700">
          <tr bgcolor="#00cc66">
            <td colspan="2" align="center"><span class="topic">查询工装审批单</span></td>
          </tr>
          <tr class="small">
            <td width="144" align="right">提交日期：</td>
            <td width="523">
              <input name="startdate" type="text" id="startdate" style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-01"%>" >&mdash;&mdash;
            <input name="enddate" type="text" id="enddate"  style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" ></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>单据编号：</td>
            <td><input style="width:100px" name="startid" type="text" id="startid" value="">&mdash;&mdash;
            <input style="width:100px" name="endid" type="text" id="endid" value="">
            <span id="tips" style="color:#666; display:none">提示：如果限定单据编号，则日期维度↑将会失效。</span></td>
          </tr>
          <tr class="small">
            <td align=right>所属部门：</td>
            <td><select style="width:140px"  name="department" id="department">
              <option value="all" selected>全部</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>解决情况：</td>
            <td>
            <select style="width:140px" name="danjupd" id="danjupd">
              <option value="all" selected>全部</option>
              <option value="0">未审核</option>
              <option value="99">审核通过</option>
              <option value="1">审核未通过</option>
            </select></td>
          </tr>
          <tr class="small">
            <td align=right>专柜名称：</td>
            <td><input name="shoppe" type="text" id="shoppe" value=""></td>
          </tr>
          

          <tr class="small">
            <td align=center colspan=2><input type="button" value="查 询" name="send" onClick="SearchSuitcheck();"> 
            <input type = "button" name = "button1" value = "返 回" onClick = "javascript:history.back(-1);"></td>
          </tr>
        </table>
</form>
</BODY>
</HTML>
