<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax_demo01</title>
</head>
<body>
<div id = "request">AJAX请求</div>
<div id = "click">点击这里</div>
</body>
<script>
	function getXMLHttp(){
		var xmlhttp;
		if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		}else{
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}
	
	window.onload = function(){
		document.getElementById("click").onclick = function(){
			var xmlhttp = getXMLHttp();
			//查询网络请求状态
			xmlhttp.onreadystatechange = function(){
				//成功
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					var ajaxResult = eval('('+ xmlhttp.responseText +')');
					var name = ajaxResult.name;
					var age = ajaxResult.age;
					//alert(name+"+"+age);
					document.getElementById("request").innerHTML="name:"+name+" age: "+ age;
				}	
			}
			
			//xmlhttp.open("GET","Demo01Servlet",true);
			xmlhttp.open("GET","Demo01Servlet?age=19&name=frank",true);
			xmlhttp.setRequestHeader("Content-types","application/x-www-form-urlencoded");
			//xmlhttp.send("age=18&name=frank");
			xmlhttp.send();
		};
	}
</script>
</html>