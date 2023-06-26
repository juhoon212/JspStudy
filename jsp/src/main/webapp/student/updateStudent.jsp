<%@page import="xyz.itwll.dto.StudentDTO"%>
<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	
    	if(request.getMethod().equals("GET")) {
    		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    		return;
    	}
    
    	request.setCharacterEncoding("utf-8");
    	
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	String name = request.getParameter("name");
    	String phone = request.getParameter("phone");
    	String address = request.getParameter("address");
    	String birthday = request.getParameter("birthday");
    	
    	
    	
    
    	StudentDTO student = StudentDAO.getStudent().selectStudent(no);
    	
    	student.setNo(no);
    	student.setName(name);
    	student.setPhone(phone);
    	student.setAddress(address);
    	student.setBirthday(birthday);
    	
    	StudentDAO.getStudent().updateStudent(student);
    	
    	response.sendRedirect("displayStudent.jsp");
    	
    	
    	
    	
    	
    %>
