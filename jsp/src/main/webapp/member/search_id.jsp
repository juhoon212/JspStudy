<%@page import="xyz.itwll.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 아이디 검색 --%>
   <%
   
   String Id = request.getParameter("name");
   String email = request.getParameter("email");
   
   
   
   MemberDTO member = MemberDAO.getMemberDAO().findmember(Id, email);
   String findId = member.getId();
   

   
   
   
   
   
   
   //실패로직
   
   if(request.getMethod().equals("GET")) {
	   response.sendRedirect(request.getContextPath() + "/index.jsp?group=error&worker=error_404");
	   return;
   }
   
   if(findId == null) {
	   session.setAttribute("failMessage", "찾으실 아이디가 없습니다.");
	   response.sendRedirect(request.getContextPath() + "/index.jsp?group=member&worker=search_id.jsp");
   }
   
   
   
   
   
   // 성공 로직
   		
   		
   		session.setAttribute("successMessage", "아이디 = " + findId);
   		response.sendRedirect(request.getContextPath() + "/index.jsp?group=member&worker=search_id_display.jsp");
   
   
   %>
