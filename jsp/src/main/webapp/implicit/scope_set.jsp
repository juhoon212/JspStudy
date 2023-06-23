<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	pageContext.setAttribute("pageName", "홍길동"); // page Scope = 자기자신
    	request.setAttribute("request", "임꺽정"); // request scope = jsp -> jsp
    	session.setAttribute("session", "전우치"); // session scope = 동일 클라이언트
    	application.setAttribute("application", "일지매"); // application Scope => 같은 WAS
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>객체의 사용범위(Scope) - </h1>
	<hr>
	
	
	
</body>
</html>