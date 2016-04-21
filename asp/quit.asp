<%
If Session("logined") <> True Then
	Response.Redirect("/asp/menu.asp?action=quit")
End If
%>
