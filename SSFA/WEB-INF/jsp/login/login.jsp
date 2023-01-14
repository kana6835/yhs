<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SALES SFA : login</title>
<style type="text/css">
</style>
</head>
<body>
사업소 : <input type="text" id = "shop" value = "NKA0001"><br>
아이디 : <input type="text" id = "id" value = "HSYU"><br>
패스워드 : <input type="password" id = "pw" value = "Tester16"><br>
 
<button id = "login">로그인</button> 
<button id = "sample">샘플페이지</button>
</body>
<jsp:include page="../include/common.jsp"/>
<script>
$(document).ready(function(){
	var sessionTimeOut = '${param.timeOut}';
	if(sessionTimeOut == "Y"){
		alert("세션이 만료되어 로그아웃 되었습니다.");
	}
	$("#login").click(function(){
		p = {
				SHOPCD	: $("#shop").val(),
				USERCD	: $("#id").val(),
				PW	: $("#pw").val(),
				USERIP	: "1.1.1.1"
			}
		var r = _ajax("./getUserInfo.do",p);
		if(r.rc){
			alert("로그인 성공");	
		}else{
			alert(r.rm);
			return;
		}
	});
	$("#sample").click(function(){
		location.href = "../sample/sample.do";
	});
});
</script>
</html>
