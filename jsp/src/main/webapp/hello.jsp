<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
Date now = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
String displayNow = dateFormat.format(now);


%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
</head>
<body>
	<h1>Hello, JSP!!</h1>
	<hr>
	<%-- JSP주석 --%>
	<p>JSP(Java Server Page) : 서블릿보다 쉽게 웹프로그램 작성하기 위한 기술
	- 스크립트 요소(Script Element), 지시어(Directive), 표준 액션 태그(Standard Action Tag)</p>
	<hr>
	<div id="display"><%=displayNow%></div>
	
	<script type="text/javascript">
	setInterval(() => {
		location.reload()
	}, 1000);
	
	</script>
</body>
</html>