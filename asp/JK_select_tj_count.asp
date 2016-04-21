<!--#include file ="config.asp"-->
<!--#include file ="quit.asp"-->
<script language="jscript" runat="server">
 function jsdecodeURI(str){
	 return decodeURI(str)
 }
 
 function jsencodeURI(str){
	 return encodeURI(str)
 }
</script>
<%
dim Conn, rs,num
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open DBstr
Set rs = Server.CreateObject("ADODB.Recordset")
Key  = Request("Key")
Sort = Request("Sort")
Page = Clng(Request("Page"))


startdate=request("startdate")
enddate=request("enddate")
classname = jsdecodeURI(request("classname"))
typename_jk = jsdecodeURI(request("typename"))
department = jsdecodeURI(request("department"))
zj_pd_7 = jsdecodeURI(request("zj_pd_7"))
name_jk = jsdecodeURI(request("name"))

sql = "Select n.*,u.name from news n,users u where n.userid=u.userid"

'只有不限定单据编号时日期维度才生效
if request("startid")="" and request("endid")="" then
	sql = sql &" and date between '"&startdate&"' and '"&enddate&"'"
end if

if classname<>"all" then
	if typename_jk<>"all" then
		sql=sql&" and n.classname='"&classname&"' and n.typename='"&typename_jk&"'"
	else
		sql=sql&" and n.classname='"&classname&"'"
	end if
end if

if department<>"all" then
	sql=sql&" and n.department='"&department&"'"
end if

if zj_pd_7<>"all" then
	sql = sql &" and n.zj_pd_7 = '"&zj_pd_7&"'"
end if

if request("zj_pd_3")<>"all" then
	sql = sql &" and n.zj_pd_3 = '"&request("zj_pd_3")&"'"
end if 

if request("zj_pd_rk")<>"all" then
	sql = sql &" and n.zj_pd_rk = '"&request("zj_pd_rk")&"'"
end if 

if request("userid")<>"" then
	sql = sql &" and n.userid = '"&request("userid")&"'"
end if

if name_jk<>"" then
	sql = sql &" and u.name = '"&name_jk&"'"
end if 

if request("startid")<>"" then
	sql = sql &" and n.newsid >= '"&request("startid")&"'"
end if

if request("endid")<>"" then
	sql = sql &" and n.newsid <= '"&request("endid")&"'"
end if

sql=sql&" order by n.newsid desc" 
'sql = "Select n.*,u.name from news n,users u where n.userid=u.userid and date between '2015-1-1' and '2017-1-1'"
rs.open sql, conn, 3, 2 

dim newscount,AlreadyCount,j,DepartmentCount(19),DepartmentName(19)

'j是记录当前循环中已经记录了几个统计分类
j = 0
NewsCount = 0
AlreadyCount = false
while not rs.eof
	for i=0 to j
		if rs("department") = DepartmentName(i) then
			DepartmentCount(i) = DepartmentCount(i)+1
			AlreadyCount = true
		end if
	next
	if AlreadyCount then
		AlreadyCount = false
	else
		DepartmentName(j) = rs("department")
		DepartmentCount(j) = 1
		AlreadyCout = false
		j=j+1
	end if
	NewsCount=NewsCount+1
	rs.movenext
wend

dim json,department
json = "{""total"":"""&newscount&""","

department = """department"":{"
for i=0 to Ubound(DepartmentName)
	if DepartmentName(i)<>"" then
		department = department&""""&jsencodeURI(DepartmentName(i))&""":"""&DepartmentCount(i)&""","
	end if
next
department = left(department,len(department)-1)&"}"
json =json&department&"}"
response.Write(json)



%>