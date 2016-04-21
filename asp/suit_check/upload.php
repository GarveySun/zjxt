<?php
header("Content-type: text/html; charset=gb2312"); 
	//包含一个文件上传类《细说PHP》中的上传类
	include "fileupload.class.php";
	include "changeimg.php";
	$up = new fileupload;
	//设置属性(上传的位置， 大小20M， 类型， 名是是否要随机生成)
	$up -> set("path", "../../suit_photos/");
	$up -> set("maxsize", 20000000);
	$up -> set("allowtype", array("gif", "png", "jpg","jpeg","bmp"));
	$up -> set("israndname", true);
	//使用对象中的upload方法， 就可以上传文件， 方法需要传一个上传表单的名子 pic, 如果成功返回true, 失败返回false
	if($up -> upload('pic')) {
		echo '<pre>';
		//获取上传后文件名子
		var_dump($up->getFileName());
		echo '</pre>';
		
		
		foreach($up->getFileName() as $pic){
			imagedestroy($im);
			$im=imagecreatefromjpeg("../../suit_photos/".$pic);//参数是图片的存方路径
			$maxwidth="800";//设置图片的最大宽度
			$maxheight="800";//设置图片的最大高度
			$name='../../suit_photos/'.$pic;//图片的名称，随便取吧
			$filetype="";//图片类型
			resizeImage($im,$maxwidth,$maxheight,$name,$filetype);//调用上面的函数
		}
?>
<!doctype html>
<html>
<head>
<meta charset="gb2312">
<script src="../../jquery/jquery-1.9.1.min.js"></script>
<title>上传成功</title>
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
		//获取上传失败以后的错误提示
		echo '文件上传阶段出现错误：';
		var_dump($up->getErrorMsg());
		echo '</pre>';
   }
?>   