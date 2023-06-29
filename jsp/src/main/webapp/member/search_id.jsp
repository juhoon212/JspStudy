<%@page import="xyz.itwll.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 아이디 검색 --%>
   <%
   
   request.setCharacterEncoding("UTF-8");
   
   String Id = request.getParameter("name");
   String email = request.getParameter("email");
   
   
   
   String id = MemberDAO.getMemberDAO().findmember(Id, email);
   
   

   
   
   
   
   
   
   //실패로직
   
   if(request.getMethod().equals("GET")) {
	   response.sendRedirect(request.getContextPath() + "/index.jsp?group=error&worker=error_404");
	   return;
   }
   
   if(id == null) {
	   session.setAttribute("failMessage", "찾으실 아이디가 없습니다.");
	   response.sendRedirect(request.getContextPath() + "/index.jsp?group=member&worker=search_id_display");
	   return;
   }
   
   
   
   
   
   // 성공 로직
   		
   		
   		session.setAttribute("successMessage", "아이디 = " + id);
   		response.sendRedirect(request.getContextPath() + "/index.jsp?group=member&worker=search_id_display");
   
   
   %>
