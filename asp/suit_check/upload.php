<?php
header("Content-type: text/html; charset=gb2312"); 
	//����һ���ļ��ϴ��ࡶϸ˵PHP���е��ϴ���
	include "fileupload.class.php";
	include "changeimg.php";
	$up = new fileupload;
	//��������(�ϴ���λ�ã� ��С20M�� ���ͣ� �����Ƿ�Ҫ�������)
	$up -> set("path", "../../suit_photos/");
	$up -> set("maxsize", 20000000);
	$up -> set("allowtype", array("gif", "png", "jpg","jpeg","bmp"));
	$up -> set("israndname", true);
	//ʹ�ö����е�upload������ �Ϳ����ϴ��ļ��� ������Ҫ��һ���ϴ��������� pic, ����ɹ�����true, ʧ�ܷ���false
	if($up -> upload('pic')) {
		echo '<pre>';
		//��ȡ�ϴ����ļ�����
		var_dump($up->getFileName());
		echo '</pre>';
		
		
		foreach($up->getFileName() as $pic){
			imagedestroy($im);
			$im=imagecreatefromjpeg("../../suit_photos/".$pic);//������ͼƬ�Ĵ淽·��
			$maxwidth="800";//����ͼƬ�������
			$maxheight="800";//����ͼƬ�����߶�
			$name='../../suit_photos/'.$pic;//ͼƬ�����ƣ����ȡ��
			$filetype="";//ͼƬ����
			resizeImage($im,$maxwidth,$maxheight,$name,$filetype);//��������ĺ���
		}
?>
<!doctype html>
<html>
<head>
<meta charset="gb2312">
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<title>�ϴ��ɹ�</title>
</head>
<body>
<form method="post" name="form1" action = "/asp/suit_check/SC_addNews_tj.asp">
<input name="department" value="<?php echo $_POST['department']?>" >
<input name="name" value="<?php echo $_POST['name']?>" >
<input name="shoppe" value="<?php echo $_POST['shoppe']?>" >
<input name="dresstime" value="<?php echo $_POST['dresstime']?>" >
<input name="content" value="<?php echo $_POST['content']?>" >
<input name="time" value="<?php echo $_POST['time']?>" >

<?php
$i = 0;
foreach($up->getFileName() as $value){
	echo "<input name=\"picname"."$i"."\" value=\"";
	echo $value;
	echo '" >';
	$i += 1;
}
?>
</form>
<script>
$(document).ready(function(e) {
    document.form1.submit();
});
</script>
</body>
</html>
<?php
   } else {
		echo '<pre>';
		//��ȡ�ϴ�ʧ���Ժ�Ĵ�����ʾ
		echo '�ļ��ϴ��׶γ��ִ���';
		var_dump($up->getErrorMsg());
		echo '</pre>';
   }
?>   