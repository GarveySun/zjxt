var Config = {
	departments : [
	"总经办",
	"市场营销部",
	"业务营运部",
	"财务部",
	"党委工作部",
	"工会",
	"人力资源部",
	"顾客服务部",
	"安全保卫部",
	"行政后勤部",
	"储运部",
	"化妆销售部",
	"珠宝精品销售部",
	"女装销售部",
	"男装运动销售部",
	"皮具销售部",
	"家用儿童销售部",
	"超市销售部",
	"功能销售部",
	"特卖场销售部"],
	
	classnames : [
		{ classname : "违纪单" ,
		typename : ["使用手机","串岗","聊天","柜台说笑","私人物品","吃东西","食品带入柜台",
				"上班购物","做与工作无关的事","趴靠柜台","电脑上网","违纪警","其它"]
		},
		{ classname: "案例单" ,
		typename : ["服务投诉","商品投诉","违纪共性问题","优质服务","其它"]
		},
		{ classname: "情况反映单" ,
		typename : ["设备设施","环境卫生","视觉陈列题","物价质量","仪容仪表","班前会","营销策划","应知应会","联合检查","经营管理","其它"]
		},
		{ classname: "表扬单" ,
		typename : ["顾客表扬","热情服务","拾金不昧","统一规范","其它"]
		}],
	
	Setdepartment:function (selectid){
		for (var i=0;i<this.departments.length;i++) {
			$("#"+selectid).append("<option value=\""+this.departments[i]+"\">"+this.departments[i]+"</option>");
		}
	},
	
	Setclassname:function (selectid){
		for (var i=0;i<this.classnames.length;i++) {
			$("#"+selectid).append("<option value=\""+this.classnames[i].classname+"\">"+this.classnames[i].classname+"</option>");
		}
	},
	
	Changetypename:function (classid,typeid){
		var classname = $("#"+classid).val();
		console.log(classname);
		for (var i=0;i<this.classnames.length;i++){
			if (classname === this.classnames[i].classname){
				for (var j=0;j<this.classnames[i].typename.length;j++){
					$("#"+typeid).append("<option value=\""+this.classnames[i].typename[j]+"\">"+this.classnames[i].typename[j]+"</option>");
				}
				break;
			}
		}
	}
		
};

