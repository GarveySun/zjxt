<HTML>
<HEAD>
<script src="../jquery/jquery-1.9.1.min.js"></script>
<script src="../js/Chart.min.js"></script>
<script language = "JavaScript">
var rolename = "<%=session("rolename")%>",
	department = "<%=session("department")%>";

$(document).ready(function(e) {
	//如果登陆账号不是以下几种，则删除责任单位只可选所在部门
	if (rolename !== "超级管理员" && rolename !== "门店领导审批" && department !== "顾客服务部") {
		var obj = document.getElementById("department");
		obj.options.length = 0;
		obj.add(new Option(department,department));
	}
	
	//动态classname and typename
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
	
	//如果单据编号字段被填入数值，则显示下单日期失效的效果及说明
	$("#startid,#endid").keyup(function(e) {
        if ($("#startid").val()==="" && $("#endid").val()==="") {
			$("#tips").hide();
			$(".date").removeClass("disable");
		}else{
			$("#tips").show();
			$(".date").addClass("disable");
		}
    });
	
	//给按钮绑定AJAX事件
	$("#count").on("click",function(e){
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

//把设置存入对象
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

//接收到数据库查询返回的信息后输出简报+画图
function GetCountdata(datastr){
	var data = eval(datastr);
	var DepartmentName = new Array(),DepartmentCount = new Array(),i=0;
	for (var key in data.department) {
		DepartmentName[i] = decodeURI(key);
		DepartmentCount[i] = data.department[key];
		i++;
	}
	i=0;
	var ClassName = new Array(),ClassNameCount = new Array();
	for (var key in data.classname) {
		ClassName[i] = decodeURI(key);
		ClassNameCount[i] = data.classname[key];
		i++;
	}
	i=0
	var zjName = new Array(),zjCount = new Array();
	for (var key in data.zjname) {
		zjName[i] = decodeURI(key);
		zjCount[i] = data.zjname[key];
		i++;
	}
	$(".report").show();
	var totalstr = "共查询到"+data.total+"张符合条件的反映单。";
	var indepartmentstr = "按销售部统计："
	for (var i=0;i<DepartmentName.length;i++){
		indepartmentstr = indepartmentstr + DepartmentName[i]+":"+DepartmentCount[i]+"、"
	}
	indepartmentstr = indepartmentstr.substr(0,indepartmentstr.length-1);
	var inclassname = "按单据类别统计："
	for (var i=0;i<ClassName.length;i++) {
		inclassname += ClassName[i]+":"+ClassNameCount[i]+"、"
	}
	inclassname = inclassname.substr(0,inclassname.length-1);
	var inzjname = "按下单账号统计："
	for (var i=0;i<zjName.length;i++) {
		inzjname += zjName[i]+":"+zjCount[i]+"、"
	}
	inzjname = inzjname.substr(0,inzjname.length-1);
	$("#total").text(totalstr);
	$("#indepartment").text(indepartmentstr);
	$("#inclassname").text(inclassname);
	$("#inzjname").text(inzjname);
	
	
	if (isIE()){
		$("#alert").show();
	}else{
	DrawBar(DepartmentName,DepartmentCount);
	Drawclassnamepie(ClassName,ClassNameCount);
	Drawzjnamepie(zjName,zjCount);
	}
}

function isIE(){
return navigator.appName.indexOf("Microsoft Internet Explorer")!=-1 && document.all;
}

//画柱状图（列名数组，数据数组）
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
	var ctx = document.getElementById("depcanvas").getContext("2d");
	window.myBar = new Chart(ctx).Bar(barChartData, {
		responsive : true
	});
}

function Drawclassnamepie(name,data) {
	var pieData = new Array();
	for (var i in name) {
		pieData[i] = {
			value:data[i],
			color:getpiecolor(i,false),
			highlight:getpiecolor(i,true),
			label:name[i]
		}
	}
	if (window.classPie) {
		console.log("classPie is going to be deatory")
		window.classPie.destroy();
	}
	var ctx = document.getElementById("classcanvas").getContext("2d");
	window.classPie = new Chart(ctx).Pie(pieData);
}

function Drawzjnamepie(name,data) {
	var pieData = new Array();
	for (var i in name) {
		pieData[i] = {
			value:data[i],
			color:getpiecolor(i+3,false),
			highlight:getpiecolor(i+3,true),
			label:name[i]
		}
	}
	if (window.zjnamePie) {
		console.log("zjnamePie is going to be deatory")
		window.zjnamePie.destroy();
	}
	var ctx = document.getElementById("zjcanvas").getContext("2d");
	window.zjnamePie = new Chart(ctx).Pie(pieData,{
		percentageInnerCutout : 50,
		animateScale : true
		
		});
}

function getpiecolor(index,highlight) {
	var	color = [
		"#DD0029",
		"#FAF500",
		"#51A625",
		"#029197",
		"#392884",
		"#A3007F",
		"#1E57A4"];
	var highlightcolor = [
		"#E54746",
		"#FFF883",
		"#5BBD2A",
		"#00A7AE",
		"#514695",
		"#B04990",
		"#4070B2"];
	while (index > 6) {
		index -= 7;
	}
	if (highlight) {
		return highlightcolor[index];
	}else{
		return color[index];
	}	
}
//查询按钮函数
function SearchNews(){
	form1.action="JK_select_tj_serch.asp";
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
div.report p{text-align:left}
div#total{ font-size:18px; font-weight:bold}
.disable{ color:#999;}
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
          <tr class="small date">
            <td width="144" align="right">下单日期：</td>
            <td width="523">
              <input name="startdate" class="date" type="text" id="startdate" style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-01"%>" >&mdash;&mdash;
            <input name="enddate" class="date" type="text" id="enddate"  style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" ></td>
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
    <p id="indepartment"></p>
    <div class="chart">
        <canvas id="depcanvas" height="400" width="700"></canvas>
    </div>
    <p id="inclassname"></p>
    <div class="chart">
        <canvas id="classcanvas" height="400" width="700"></canvas>
    </div>
    <p id="inzjname"></p>
    <div class="chart">
        <canvas id="zjcanvas" height="400" width="700"></canvas>
    </div>
    <div id="alert">您的浏览器不支持绘制图表，请用新版本的360浏览器极速模式或者谷歌Chrome浏览器查询。</div>
</div>
</div>
</BODY>
</HTML>
