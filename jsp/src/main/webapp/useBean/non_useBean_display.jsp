<%@page import="xyz.itwill.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 내장객체에 저장된 속성값을 반환받아 클라이언트에게 전달하여 응답하는 JSP 문서 --%>
    
    <%
    	if(session.getAttribute("hewon") == null) {
    		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    		return;
    	}
    
    Hewon hewon = (Hewon)session.getAttribute("hewon");
    
    session.removeAttribute("hewon");
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>이름 = <%= hewon.getName() %></p>
</body>
</html>