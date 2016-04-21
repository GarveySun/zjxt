function checkopen(newsid1)
{
//var XmlHttp = new ActiveXObject("Microsoft.XMLHTTP") 
var Xmlhttp=null;
if (window.XMLHttpRequest)
  {// code for all new browsers
  Xmlhttp=new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {// code for IE5 and IE6
  Xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
if (Xmlhttp!=null)
  {
Xmlhttp.open("POST","checkopen.asp?newsid=newsid1", false ); 
Xmlhttp.send(); 
  }
else
  {
  alert("Your browser does not support XMLHTTP.");
  }
}