<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	if(request.getMethod().equals("GET")) {
    		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    		return;
    	}
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 확인</h1>
	<hr />
	<jsp:useBean id="hewon" class="xyz.itwill.bean.Hewon" scope="request"></jsp:useBean>
	
	<p>이름 = <jsp:getProperty property="name" name="hewon"/></p>
	<p>이름 = <jsp:getProperty property="phone" name="hewon"/></p>
	<p>이름 = <jsp:getProperty property="address" name="hewon"/></p>
</body>
</html>