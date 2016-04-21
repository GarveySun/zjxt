<HTML>
<HEAD>
<script src="../jquery/jquery-1.9.1.min.js"></script>
<script src="../js/Chart.min.js"></script>
<script language = "JavaScript">
var rolename = "<%=session("rolename")%>",
	department = "<%=session("department")%>"

 $(document).ready(function(e) {
	if (rolename === "超级管理员" ||rolename === "门店领导审批" ||department === "顾客服务部") {
	}else{
		var obj = document.getElementById("department");
		obj.options.length = 0;
		obj.add(new Option(department,department));
	}
	
	
    $("#classname").change(function(e) {
        if ($(this).val()=="违纪单")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>全部</option>");
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
		    $("#typename").append("<option value='all'>全部</option>");
			$("#typename").append("<option value='服务投诉'>服务投诉</option>");
			$("#typename").append("<option value='商品投诉'>商品投诉</option>");
			$("#typename").append("<option value='违纪共性问题'>违纪共性问题</option>");
			$("#typename").append("<option value='优质服务'>优质服务</option>");
			$("#typename").append("<option value='其它'>其它</option>");
		}
		else if ($(this).val()=="情况反映单")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>全部</option>");
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
		    $("#typename").append("<option value='all'>全部</option>");
			$("#typename").append("<option value='顾客表扬'>顾客表扬</option>");
			$("#typename").append("<option value='热情服务'>热情服务</option>");
			$("#typename").append("<option value='拾金不昧'>拾金不昧</option>");
			$("#typename").append("<option value='统一规范'>统一规范</option>");
			$("#typename").append("<option value='其它'>其它</option>");
		}
		else
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>全部</option>");
		}
    });
	
	$("#startid,#endid").keyup(function(e) {
        if ($("#startid").val()==="" && $("#endid").val()==="") {
			$("#tips").hide();
		}else{
			$("#tips").show();
		}
    });
	
	
	$("#count").on("click",function(e){
		AddTime();
		var condition = GetCondition();
		var backdata = $.ajax({
			url:"JK_select_tj_count.asp",
			data:condition,
			type:"POST",
			dataType:"json",
			success: function(data){
				GetCountdata(data);
			}
		});
	});
	
	
});

function GetCondition(){
	var condition = new Object();
	condition.startid = $("#startid").val();
	condition.endid = $("#endid").val();
	if (condition.startid === "" && condition.endid === "") {
		condition.startdate = $("#startdate").val();
		condition.enddate = $("#enddate").val();
	}else{
		condition.startdate = "2015-1-1";
		condition.enddate = "2099-12-31";
	}
	condition.classname = encodeURI($("#classname").val());
	condition.typename = encodeURI($("#typename").val());
	condition.department = encodeURI($("#department").val());
	condition.zj_pd_7 = encodeURI($("#zj_pd_7").val());
	condition.zj_pd_3 = $("#zj_pd_3").val();
	condition.zj_pd_rk = $("#zj_pd_rk").val();
	condition.name = encodeURI($("#name").val());
	condition.userid = $("#userid").val();
	
	return condition	
}

function GetCountdata(datastr){
	var data = eval(datastr);
	var DepartmentName = new Array(),DepartmentCount = new Array(),i=0;
	for (var key in data.department) {
		DepartmentName[i] = decodeURI(key);
		DepartmentCount[i] = data.department[key];
		i++;
	}
	$(".report").show();
	var reportstr = "共查询到"+data.total+"张符合条件的反映单，按销售部分类汇总如下："
	for (var i=0;i<DepartmentName.length;i++){
		reportstr = reportstr + DepartmentName[i]+":"+DepartmentCount[i]+"、"
	}
	reportstr = reportstr.substr(0,reportstr.length-1);
	$("#total").text(reportstr);
	
	if (isIE()){
		$("#alert").show();
	}else{
	DrawBar(DepartmentName,DepartmentCount);
	}
}

function isIE(){
return navigator.appName.indexOf("Microsoft Internet Explorer")!=-1 && document.all;
}


function DrawBar(name,data) {
	var barChartData = {
			labels : name,
			datasets : [
				{
					fillColor : "rgba(153,204,103,0.7)",
					strokeColor : "rgba(151,204,102,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : data
				}
			]
		}
	if (window.myBar) {
		console.log("myBar is going to be deatory")
		window.myBar.destroy();
	}
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myBar = new Chart(ctx).Bar(barChartData, {
		responsive : true
	});
}

function AddTime(){
	var starttime = $("#startdate").val(),
		endtime = $("#enddate").val();
	$("#startdate").val(starttime+" 00:00:00");
	$("#enddate").val(endtime+" 23:59:59");
}

function SearchNews(){
	form1.action="JK_select_tj_serch.asp";
	AddTime();
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
.chart{margin-left:auto; margin-right:auto; max-width:700px; max-height:450px}
div.report{width:700px; margin-left:auto; margin-right:auto; line-height:26px; display:none}
h3{width:inherit; text-align:center}
div#alert{ color:red; display:none}
-->
</style>
<TITLE>查询总监电子反映单</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<p>&nbsp;</p>
<form method="post" name="form1">
<table align=center cellspacing="0" cellpadding="1" width="700">
          <tr bgcolor="#00cc66">
            <td colspan="2" align="center"><span class="topic">查询总监电子反映单</span></td>
          </tr>
          <tr class="small">
            <td width="144" align="right">下单日期：</td>
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
            <td width="144" align=right>单据类别：</td>
            <td>
        <select style="width:100px" name="classname" id="classname" > 
        <option  value="all" selected>全部</option> 
        <option value="违纪单">违纪单</option>
        <option value="案例单">案例单</option>
        <option value="情况反映单">情况反映单</option>
        <option value="表扬单">表扬单</option>
        </select>&mdash;&mdash;
		<select style="width:100px"  name="typename" id="typename"> 
        <option  value="all" selected>全部</option> 
        </select>
</td>
          </tr>
          <tr class="small">
            <td align=right>责任单位：</td>
            <td><select style="width:140px"  name="department" id="department">
              <option value="all" selected>全部</option>
              <option value="总经办">总经办</option>
              <option value="市场营销部">市场营销部</option>
              <option value="业务营运部">业务营运部</option>
              <option value="财务部">财务部</option>
              <option value="党委工作部">党委工作部</option>
              <option value="工会">工会</option>
              <option value="人力资源部">人力资源部</option>
              <option value="顾客服务部">顾客服务部</option>
              <option value="安全保卫部">安全保卫部</option>
              <option value="行政后勤部">行政后勤部</option>
              <option value="储运部">储运部</option>
              <option value="化妆销售部">化妆销售部</option>
              <option value="珠宝精品销售部">珠宝精品销售部</option>
              <option value="女装销售部">女装销售部</option>
              <option value="男装运动销售部">男装运动销售部</option>
              <option value="皮具销售部">皮具销售部</option>
              <option value="家用儿童销售部">家用儿童销售部</option>
              <option value="超市销售部">超市销售部</option>
              <option value="功能销售部">功能销售部</option>
              <option value="特卖场销售部">特卖场销售部</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>解决情况：</td>
            <td>
            <select style="width:140px" name="zj_pd_7" id="zj_pd_7">
              <option value="all" selected>全部</option>
              <option value="已解决">已解决</option>
              <option value="未解决">未解决</option>
              <option value="总监撤单">总监撤单</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>奖惩情况：</td>
            <td>
            <select style="width:140px" name="zj_pd_3" id="zj_pd_3">
              <option value="all" selected>全部</option>
              <option value="2">奖励</option>
              <option value="1">罚款</option>
              <option value="0">其他</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>单据状态：</td>
            <td>
            <select style="width:140px" name="zj_pd_rk" id="zj_pd_rk">
              <option value="all" selected>全部</option>
              <option value="0">流转中</option>
              <option value="1">入库</option>
            </select></td>
          </tr>
         <% if session("department")="顾客服务部"or session("name")="dalou" then%>
          <tr class="small">
            <td align=right>发单人工号：</td>
            <td><input name="userid" type="text" id="userid" value=""></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>发单人姓名：</td>
            <td><input name="name" type="text" id="name" value=""></td>
          </tr>
          <% end if %>
          

          <tr class="small">
            <td align=center colspan=2><input type="button" value="查 询" name="send" onClick="SearchNews();"> 
              <input style="margin:0px 15px" type="button" id="count" value="统 计"> 
            <input type = "button" name = "button1" value = "返 回" onClick = "javascript:history.back(-1);"></td>
          </tr>
        </table>
</form>
<div align="center" style="width:100%">
<div class="report">
	<h3 align="center">统计情况汇总</h3>
    <div id="total" align="left"></div>
    <br />
    <div id="alert">您的浏览器不支持绘制图表，请用新版本的360浏览器极速模式或者谷歌Chrome浏览器查询。</div>
</div>
<div class="chart">
	<canvas id="canvas" height="400" width="700"></canvas>
</div>
</div>
</BODY>
</HTML>
