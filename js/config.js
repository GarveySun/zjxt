var Config = {
	
//�����������飬�޸Ĵ˴��ܰ�����ҳ����ֳ��Ĳ��Ÿĵ������Ѿ�д�����ݿ�Ĳ��֣���һ���˺ŵ��������ţ�����Ϊ��
	departments : [
	"�ܾ���",
	"�г�Ӫ����",
	"ҵ��Ӫ�˲�",
	"����",
	"��ί������",
	"����",
	"������Դ��",
	"�˿ͷ���",
	"��ȫ������",
	"�������ڲ�",
	"���˲�",
	"��ױ���۲�",
	"�鱦��Ʒ���۲�",
	"Ůװ���۲�",
	"��װ�˶����۲�",
	"Ƥ�����۲�",
	"���ö�ͯ���۲�",
	"�������۲�",
	"�������۲�",
	"���������۲�"],


/*
���������������ͣ��������¸�ʽ���Ӽ��ɡ�
һ��classnames������������Ԫ�أ�ÿ��Ԫ���Ǹô���Ķ��󣬶������д����������Ժ�С�����顣
Ҫ����С��Ļ���������һ��Ҫ����󣬷��򽫵���JK_select.asp��Writeothertypename()���������²�ѯ����ʱ������©	
*/
	classnames : [
		{ classname : "Υ�͵�" ,
		typename : ["ʹ���ֻ�","����","����","��̨˵Ц","˽����Ʒ","�Զ���","ʳƷ�����̨",
				"�ϰ๺��","���빤���޹ص���","ſ����̨","��������","Υ�;�ʾ","����"]
		},
		{ classname: "������" ,
		typename : ["����Ͷ��","��ƷͶ��","Υ�͹�������","���ʷ���","����"]
		},
		{ classname: "�����ӳ��" ,
		typename : ["�豸��ʩ","��������","�Ӿ�������","�������","�����Ǳ�","��ǰ��","Ӫ���߻�","Ӧ֪Ӧ��","���ϼ��","��Ӫ����","����"]
		},
		{ classname: "���ﵥ" ,
		typename : ["�˿ͱ���","�������","ʰ����","ͳһ�淶","����"]
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

