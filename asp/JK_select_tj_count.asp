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


startdate=request("startdate")&" 00:00:00"
enddate=request("enddate")&" 23:59:59"
classname_jk = jsdecodeURI(request("classname"))
typename_jk = jsdecodeURI(request("typename"))
department = jsdecodeURI(request("department"))
zj_pd_7 = jsdecodeURI(request("zj_pd_7"))
name_jk = jsdecodeURI(request("name"))
ifothers_jk = jsdecodeURI(request("ifothers"))

sql = "Select n.*,u.name from news n,users u where n.userid=u.userid"

'只有不限定单据编号时日期维度才生效
if request("startid")="" and request("endid")="" then
	sql = sql &" and date between '"&startdate&"' and '"&enddate&"'"
end if

if classname_jk<>"all" then
	if typename_jk="all" then
		sql=sql&" and n.classname='"&classname_jk&"'"
	elseif typename_jk<>"其它"then
		sql=sql&" and n.classname='"&classname_jk&"' and n.typename='"&typename_jk&"'"
	else
		dim othertype,sqltype
		othertype = split(ifothers_jk,",")
		sqltype = " and ("
		for i=0 to Ubound(othertype)
			sqltype = sqltype&" n.typename<> '"&othertype(i)&"' or"
		next
		sqltype = left(sqltype,len(sqltype)-3)&")"
		sql=sql&" and n.classname='"&classname_jk&"'"&sqltype
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
rs.open sql, conn, 3, 2 

dim newscount,AlreadyCount(2),j(2),DepartmentCount(19),DepartmentName(19),ClassName(5),ClassNameCount(5),zjName(20),zjCount(20)

'j是记录当前循环中已经记录了几个统计分类
j(0) = 0
j(1) = 0
j(2) = 0
NewsCount = 0
AlreadyCount(0) = false
AlreadyCount(1) = false
AlreadyCount(2) = false
'循环统计所有符合条件的单据
while not rs.eof
	'统计按责任部门分组
	if rs("over_char2")<>"无" then
		for i=0 to j(0)
			if rs("over_char2") = DepartmentName(i) then
				DepartmentCount(i) = DepartmentCount(i)+1
				AlreadyCount(0) = true
			end if
		next
		if AlreadyCount(0) then
			AlreadyCount(0) = false
		else
			DepartmentName(j(0)) = rs("over_char2")
			DepartmentCount(j(0)) = 1
			AlreadyCount(0) = false
			j(0)=j(0)+1
		end if
	end if
	for i=0 to j(0)
		if rs("department") = DepartmentName(i) then
			DepartmentCount(i) = DepartmentCount(i)+1
			AlreadyCount(0) = true
		end if
	next
	if AlreadyCount(0) then
		AlreadyCount(0) = false
	else
		DepartmentName(j(0)) = rs("department")
		DepartmentCount(j(0)) = 1
		AlreadyCount(0) = false
		j(0)=j(0)+1
	end if
	
	'按单据类别统计
	for i=0 to j(1)
		if rs("classname") = ClassName(i) then
			ClassNameCount(i) = ClassNameCount(i)+1
			AlreadyCount(1) = true
		end if
	next
	if AlreadyCount(1) then
		AlreadyCount(1) = false
	else
		ClassName(j(1)) = rs("classname")
		ClassNameCount(j(1)) = 1
		AlreadyCount(1) = false
		j(1)=j(1)+1
	end if

	'按总监姓名统计
	for i=0 to j(2)
		if rs("name") = zjName(i) then
			zjCount(i) = zjCount(i)+1
			AlreadyCount(2) = true
		end if
	next
	if AlreadyCount(2) then
		AlreadyCount(2) = false
	else
		zjName(j(2)) = rs("name")
		zjCount(j(2)) = 1
		AlreadyCount(2) = false
		j(2)=j(2)+1
	end if

	NewsCount=NewsCount+1
	rs.movenext
wend

dim json,department,classnamestr,zjnamestr
json = "{""total"":"""&newscount&""","

departmentstr = """department"":{"
for i=0 to Ubound(DepartmentName)
	if DepartmentName(i)<>"" then
		departmentstr = departmentstr&""""&jsencodeURI(DepartmentName(i))&""":"""&DepartmentCount(i)&""","
	end if
next
departmentstr = left(departmentstr,len(departmentstr)-1)&"}"

classnamestr = """classname"":{"
for i=0 to Ubound(ClassName)
	if ClassName(i)<>"" then
		classnamestr = classnamestr&""""&jsencodeURI(ClassName(i))&""":"""&ClassNameCount(i)&""","
	end if
next
classnamestr = left(classnamestr,len(classnamestr)-1)&"}"

zjnamestr = """zjname"":{"
for i=0 to Ubound(zjName)
	if zjName(i)<>"" then
		zjnamestr = zjnamestr&""""&jsencodeURI(zjName(i))&""":"""&zjCount(i)&""","
	end if
next
zjnamestr = left(zjnamestr,len(zjnamestr)-1)&"}"

json =json&departmentstr&","&classnamestr&","&zjnamestr&"}"
response.Write(json)



%>