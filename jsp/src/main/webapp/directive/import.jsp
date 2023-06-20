
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<String> nameList = new ArrayList<>();
	nameList.add("홍길동");
	nameList.add("임꺽정");
	nameList.add("전우치");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>page Directive - import 속성</h1>
	<hr>
	<p>page Directive의 import 속성에는 JSP 문서에서 사용할 클래스 또는 인터페이스를 속성값으로
	설정 - 클래스 또는 인터페이스를 패키지를 사용하여 명확하게 표현하여 제공하기 위한 사용</p>
	<hr>
	<ul>
	<%
		for (String name : nameList) { %>
			<li><%=name %></li>
		<% }%>
	</ul>
	
	
</body>
</html>