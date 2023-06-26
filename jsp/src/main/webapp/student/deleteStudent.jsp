<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<%

	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	int rows = StudentDAO.getStudent().deleteStudent(no);
	
	
	if(rows > 0) {
		response.sendRedirect("displayStudent.jsp");
	} else {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	}
	
%>
