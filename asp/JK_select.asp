<HTML>
<HEAD>
<script src="../jquery/jquery-1.9.1.min.js"></script>
<script src="../js/Chart.min.js"></script>
<script src="../js/config.js"></script>
<script language = "JavaScript">
var rolename = "<%=session("rolename")%>",
	department = "<%=session("department")%>",
	hidedep = false;

$(document).ready(function(e) {
	//ͨ���Զ��巽��Ϊ����ѡ�����Ӳ���
	Config.Setdepartment("department");
	//���ӵ������
	Config.Setclassname("classname");
	//�����½�˺Ų������¼��֣���ɾ�����ε�λֻ��ѡ���ڲ���
	if (rolename !== "��������Ա" && rolename !== "�ŵ��쵼����" && department !== "�˿ͷ���") {
		var obj = document.getElementById("department");
		obj.options.length = 0;
		obj.add(new Option(department,department));
		hidedep = true;
	}
	
	//��̬classname and typename
	$("#classname").change(function(e){
		if (hidedep){
			if ($(this).val()==="������"){
				var obj = document.getElementById("department");
				obj.options.length = 0;
				$("#department").append("<option value='all' selected>ȫ��</option>");
				Config.Setdepartment("department");
			}else{
				var obj = document.getElementById("department");
				obj.options.length = 0;
				obj.add(new Option(department,department));
			}
		}
		$("#typename option").remove();
		$("#typename").append("<option value='all' selected>ȫ��</option>");
		Config.Changetypename("classname","typename");
	});
	
	$("#typename").on("change",function(e){
		if ($(this).val()==="����"){
			Writeothertypename();
		}		
	});
	
	//������ݱ���ֶα�������ֵ������ʾ�µ�����ʧЧ��Ч����˵��
	$("#startid,#endid").keyup(function(e) {
        if ($("#startid").val()==="" && $("#endid").val()==="") {
			$("#tips").hide();
			$(".date").removeClass("disable");
		}else{
			$("#tips").show();
			$(".date").addClass("disable");
		}
    });

	//����ť��AJAX�¼�
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

function Writeothertypename(){
	var classname = $("#classname").val();
	for (var i=0;i<Config.classnames.length;i++){
		if(classname === Config.classnames[i].classname){
			var othertypename="";
			for(var j=0;j<Config.classnames[i].typename.length-1;j++){
				othertypename +=Config.classnames[i].typename[j]+",";
			}
			othertypename = othertypename.substr(0,othertypename.length-1);
			$("#ifothers").val(othertypename);
			break;
		}
	}
}


function UnlockDepartment(){
	var obj = document.getElementById("department");
	obj.options.length = 0;
	obj.add(new Option(department,department));
}

//�����ô������
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
	condition.ifothers =encodeURI($("#ifothers").val());
	
	return condition	
}

//���յ����ݿ��ѯ���ص���Ϣ�������+��ͼ
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
	var totalstr = "����ѯ��"+data.total+"�ŷ��������ķ�ӳ����";
	var indepartmentstr = "�����۲�ͳ�ƣ�"
	for (var i=0;i<DepartmentName.length;i++){
		indepartmentstr = indepartmentstr + DepartmentName[i]+":"+DepartmentCount[i]+"��"
	}
	indepartmentstr = indepartmentstr.substr(0,indepartmentstr.length-1);
	var inclassname = "���������ͳ�ƣ�"
	for (var i=0;i<ClassName.length;i++) {
		inclassname += ClassName[i]+":"+ClassNameCount[i]+"��"
	}
	inclassname = inclassname.substr(0,inclassname.length-1);
	var inzjname = "���µ��˺�ͳ�ƣ�"
	for (var i=0;i<zjName.length;i++) {
		inzjname += zjName[i]+":"+zjCount[i]+"��"
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

//����״ͼ���������飬�������飩
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
		console.log(i)
		pieData[i] = {
			value:data[i],
			color:getpiecolor(i,false),
			highlight:getpiecolor(i,true),
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
//��ѯ��ť����
function SearchNews(){
	form1.action="JK_select_tj_serch.asp";
	form1.submit();
}

</script>
<style type="text/css">
<!--
.topic { font-family: "����"; font-size: 11pt; vertical-align: middle; line-height:16pt;}
.small { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:16pt;}
input,textarea { font-family: "����"; font-size:  9pt; vertical-align: middle; line-height:12pt;}
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
<TITLE>��ѯ�ܼ���ӷ�ӳ��</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html" charset="gb2312">
</HEAD>
<BODY>
<p>&nbsp;</p>
<form method="post" name="form1">
<table align=center cellspacing="0" cellpadding="1" width="700">
          <tr bgcolor="#00cc66">
            <td colspan="2" align="center"><span class="topic">��ѯ�ܼ���ӷ�ӳ��</span></td>
          </tr>
          <tr class="small date">
            <td width="144" align="right">�µ����ڣ�</td>
            <td width="523">
              <input name="startdate" class="date" type="text" id="startdate" style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-01"%>" >&mdash;&mdash;
            <input name="enddate" class="date" type="text" id="enddate"  style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" ></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>���ݱ�ţ�</td>
            <td><input style="width:100px" name="startid" type="text" id="startid" value="">&mdash;&mdash;
            <input style="width:100px" name="endid" type="text" id="endid" value="">
            <span id="tips" style="color:#666; display:none">��ʾ������޶����ݱ�ţ�������ά�ȡ�����ʧЧ��</span></td>
          </tr>
    <tr class="small">
            <td width="144" align=right>�������</td>
            <td>
        <select style="width:100px" name="classname" id="classname" > 
        <option  value="all" selected>ȫ��</option> 
        </select>&mdash;&mdash;
		<select style="width:100px"  name="typename" id="typename"> 
        <option  value="all" selected>ȫ��</option> 
        </select>
        <input type="text" style="display:none" value="" name="ifothers" id="ifothers">
</td>
          </tr>
          <tr class="small">
            <td align=right>���ε�λ��</td>
            <td><select style="width:140px"  name="department" id="department">
              <option value="all" selected>ȫ��</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>��������</td>
            <td>
            <select style="width:140px" name="zj_pd_7" id="zj_pd_7">
              <option value="all" selected>ȫ��</option>
              <option value="�ѽ��">�ѽ��</option>
              <option value="δ���">δ���</option>
              <option value="�ܼ೷��">�ܼ೷��</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>���������</td>
            <td>
            <select style="width:140px" name="zj_pd_3" id="zj_pd_3">
              <option value="all" selected>ȫ��</option>
              <option value="2">����</option>
              <option value="1">����</option>
              <option value="0">����</option>
            </select></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>����״̬��</td>
            <td>
            <select style="width:140px" name="zj_pd_rk" id="zj_pd_rk">
              <option value="all" selected>ȫ��</option>
              <option value="0">��ת��</option>
              <option value="1">���</option>
            </select></td>
          </tr>
         <% if session("department")="�˿ͷ���"or session("name")="dalou" then%>
          <tr class="small">
            <td align=right>�����˹��ţ�</td>
            <td><input name="userid" type="text" id="userid" value=""></td>
          </tr>
          <tr class="small">
            <td width="144" align=right>������������</td>
            <td><input name="name" type="text" id="name" value=""></td>
          </tr>
          <% end if %>
          

          <tr class="small">
            <td align=center colspan=2><input type="button" value="�� ѯ" name="send" onClick="SearchNews();"> 
              <input style="margin:0px 15px" type="button" id="count" value="ͳ ��"> 
            <input type = "button" name = "button1" value = "�� ��" onClick = "javascript:history.back(-1);"></td>
          </tr>
        </table>
</form>
<div align="center" style="width:100%">
<div class="report">
	<h3 align="center">ͳ���������</h3>
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
    <div id="alert">�����������֧�ֻ���ͼ�������°汾��360���������ģʽ���߹ȸ�Chrome�������ѯ��</div>
</div>
</div>
</BODY>
</HTML>
