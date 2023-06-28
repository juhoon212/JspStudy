<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// 바인딩된 세션에서 권한 관련 정보의 객체를 삭제처리
    	session.removeAttribute("loginMember");
    
    response.sendRedirect(request.getContextPath() + "/index.jsp?groups=main&worker=main_page");
    %>
