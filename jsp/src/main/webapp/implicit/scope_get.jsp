<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Scope set</h1>
	<hr>
	<%
		String pageName = (String)pageContext.getAttribute("pageName");
		String requestName = (String)request.getAttribute("request");
		String sessionName = (String)session.getAttribute("session");
		String applicationName = (String)application.getAttribute("application");
	%>
	
	<p>pageName = <%= pageName %></p>
	<p>requestName = <%= requestName %></p>
	<p>sessionName = <%= sessionName %></p>
	<p>applicationName = <%= applicationName%></p>
</body>
</html>