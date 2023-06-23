<%@page import="xyz.itwill.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	if(request.getMethod().equals("GET")) {
    		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    		return;
    	}
    
    
    // Post방식으로 요청하여 전달된 값에 대한 캐릭터셋 변경
    
    request.setCharacterEncoding("utf-8");
    
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    
    // JavaBean 클래스로 객체를 생성하여 전달값으로 필드값 변경
    
    Hewon hewon = new Hewon();
    hewon.setName(name);
    hewon.setPhone(phone);
    hewon.setAddress(address);
    
   // session.setAttribute("hewon", hewon);
   // response.sendRedirect("non_useBean_display.jsp"); 
    
   request.setAttribute("hewon", hewon);
   
   // 포워드 이동 : 요청 JSP 문서에서 응답 JSP 문서로 스레드를 이동하여 응답 처리
   // => 클라이언트의 요청 URL 주소 미변경 - 서버에서 JSP 문서 이동
   
    
    
    // 리다이렉트 이동 : 클라이언트에게 URL 주소를 전달하여 다른 JSP문서를 요청하여 실행결과를 응답받아 출력
    // => 클라이언트의 요청 URL 주소 변경 - 클라이언트를 이용하여 JSP 문서 이동
    // => session 내장객체에 속성값을 저장하여 포워드 이동되는 JSP문서에서 반환받아 사용
    // => 포워드 이동되는 JSP 문서가 실행 종료되면 request 내장객체에 저장된 속성값 자동 소멸
    
    request.getRequestDispatcher("non_useBean_display.jsp").forward(request, response);
    
    %>
