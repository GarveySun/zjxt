<HTML>
<HEAD>
<script src="../jquery/jquery-1.9.1.min.js"></script>
<script src="../js/Chart.min.js"></script>
<script language = "JavaScript">
var rolename = "<%=session("rolename")%>",
	department = "<%=session("department")%>"

 $(document).ready(function(e) {
	if (rolename === "��������Ա" ||rolename === "�ŵ��쵼����" ||department === "�˿ͷ���") {
	}else{
		var obj = document.getElementById("department");
		obj.options.length = 0;
		obj.add(new Option(department,department));
	}
	
	
    $("#classname").change(function(e) {
        if ($(this).val()=="Υ�͵�")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>ȫ��</option>");
			$("#typename").append("<option value='ʹ���ֻ�'>ʹ���ֻ�</option>");
			$("#typename").append("<option value='����'>����</option>");
			$("#typename").append("<option value='����'>����</option>");
			$("#typename").append("<option value='��̨˵Ц'>��̨˵Ц</option>");
			$("#typename").append("<option value='˽����Ʒ'>˽����Ʒ</option>");
			$("#typename").append("<option value='�Զ���'>�Զ���</option>");
			$("#typename").append("<option value='ʳƷ�����̨'>ʳƷ�����̨</option>");
			$("#typename").append("<option value='�ϰ๺��'>�ϰ๺��</option>");
			$("#typename").append("<option value='���빤���޹ص���'>���빤���޹ص���</option>");
			$("#typename").append("<option value='ſ����̨'>ſ����̨</option>");
			$("#typename").append("<option value='��������'>��������</option>");
			$("#typename").append("<option value='Υ�;�ʾ'>Υ�;�ʾ</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else if ($(this).val()=="������")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>ȫ��</option>");
			$("#typename").append("<option value='����Ͷ��'>����Ͷ��</option>");
			$("#typename").append("<option value='��ƷͶ��'>��ƷͶ��</option>");
			$("#typename").append("<option value='Υ�͹�������'>Υ�͹�������</option>");
			$("#typename").append("<option value='���ʷ���'>���ʷ���</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else if ($(this).val()=="�����ӳ��")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>ȫ��</option>");
			$("#typename").append("<option value='�豸��ʩ'>�豸��ʩ</option>");
			$("#typename").append("<option value='��������'>��������</option>");
			$("#typename").append("<option value='�Ӿ�������'>�Ӿ�����</option>");
			$("#typename").append("<option value='�������'>�������</option>");
			$("#typename").append("<option value='�����Ǳ�'>�����Ǳ�</option>");
			$("#typename").append("<option value='��ǰ��'>��ǰ��</option>");
			$("#typename").append("<option value='Ӫ���߻�'>Ӫ���߻�</option>");
			$("#typename").append("<option value='Ӧ֪Ӧ��'>Ӧ֪Ӧ��</option>");
			$("#typename").append("<option value='���ϼ��'>���ϼ��</option>");
			$("#typename").append("<option value='��Ӫ����'>��Ӫ����</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else if ($(this).val()=="���ﵥ")
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>ȫ��</option>");
			$("#typename").append("<option value='�˿ͱ���'>�˿ͱ���</option>");
			$("#typename").append("<option value='�������'>�������</option>");
			$("#typename").append("<option value='ʰ����'>ʰ����</option>");
			$("#typename").append("<option value='ͳһ�淶'>ͳһ�淶</option>");
			$("#typename").append("<option value='����'>����</option>");
		}
		else
		{
			$("#typename option").remove();
		    $("#typename").append("<option value='all'>ȫ��</option>");
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
	var reportstr = "����ѯ��"+data.total+"�ŷ��������ķ�ӳ���������۲�����������£�"
	for (var i=0;i<DepartmentName.length;i++){
		reportstr = reportstr + DepartmentName[i]+":"+DepartmentCount[i]+"��"
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
          <tr class="small">
            <td width="144" align="right">�µ����ڣ�</td>
            <td width="523">
              <input name="startdate" type="text" id="startdate" style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-01"%>" >&mdash;&mdash;
            <input name="enddate" type="text" id="enddate"  style="width:100px" value="<%=Year(Now) & "-" & Month(Now) & "-" & Day(Now)%>" ></td>
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
        <option value="Υ�͵�">Υ�͵�</option>
        <option value="������">������</option>
        <option value="�����ӳ��">�����ӳ��</option>
        <option value="���ﵥ">���ﵥ</option>
        </select>&mdash;&mdash;
		<select style="width:100px"  name="typename" id="typename"> 
        <option  value="all" selected>ȫ��</option> 
        </select>
</td>
          </tr>
          <tr class="small">
            <td align=right>���ε�λ��</td>
            <td><select style="width:140px"  name="department" id="department">
              <option value="all" selected>ȫ��</option>
              <option value="�ܾ���">�ܾ���</option>
              <option value="�г�Ӫ����">�г�Ӫ����</option>
              <option value="ҵ��Ӫ�˲�">ҵ��Ӫ�˲�</option>
              <option value="����">����</option>
              <option value="��ί������">��ί������</option>
              <option value="����">����</option>
              <option value="������Դ��">������Դ��</option>
              <option value="�˿ͷ���">�˿ͷ���</option>
              <option value="��ȫ������">��ȫ������</option>
              <option value="�������ڲ�">�������ڲ�</option>
              <option value="���˲�">���˲�</option>
              <option value="��ױ���۲�">��ױ���۲�</option>
              <option value="�鱦��Ʒ���۲�">�鱦��Ʒ���۲�</option>
              <option value="Ůװ���۲�">Ůװ���۲�</option>
              <option value="��װ�˶����۲�">��װ�˶����۲�</option>
              <option value="Ƥ�����۲�">Ƥ�����۲�</option>
              <option value="���ö�ͯ���۲�">���ö�ͯ���۲�</option>
              <option value="�������۲�">�������۲�</option>
              <option value="�������۲�">�������۲�</option>
              <option value="���������۲�">���������۲�</option>
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
    <br />
    <div id="alert">�����������֧�ֻ���ͼ�������°汾��360���������ģʽ���߹ȸ�Chrome�������ѯ��</div>
</div>
<div class="chart">
	<canvas id="canvas" height="400" width="700"></canvas>
</div>
</div>
</BODY>
</HTML>
