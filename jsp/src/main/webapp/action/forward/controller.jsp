<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 전달값을 이용하여 다른 JSP 문서로 포워드 이동하는 JSP문서 --%>
    
   	<%
   		String pageName = request.getParameter("page");
   	
   		if(pageName == null) {
   			response.sendRedirect("main.jsp");
   			return;
   		} 
   		
   		String contextPath = pageName + ".jsp";
   		
   	%>

   	<jsp:forward page="<%=contextPath %>"></jsp:forward>