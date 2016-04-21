<%
  If Session("logined") <> "True" Then
     Response.Redirect("../Default.asp")
  End If
%>
<html>
<head>
<title>总监电子反映单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
</head>
<frameset cols=220,*" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="leftFrame" scrolling="no" noresize src="menu.asp">
  <frame name="mainFrame" src="see_list.asp">
</frameset>
<noframes> 
<body bgcolor="#FFFFFF" text="#000000">
</body>
</noframes> 
</html>
