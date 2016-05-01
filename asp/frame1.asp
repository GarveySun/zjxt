<%
  If Session("logined") <> "True" Then
     Response.Redirect("../Default.asp")
  End If
%>
<html>
<head>
<title>总监电子反映单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="../jquery/jquery-1.9.1.min.js"></script>
</head>
<frameset cols=220,*" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="leftFrame" noresize="noresize" style="overflow-x:hidden;overflow-y:auto;" src="menu.asp">
  <frame name="mainFrame" src="see_list.asp">
</frameset>
<body >
</body>
</html>
