
<%@page import="xyz.itwill.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}


	request.setCharacterEncoding("utf-8");
	
	
%>

<%-- useBean Tag : JSP 문서에 Java 객체(JavaBean)을 제공하기 위한 태그 --%>
<%-- 형식 jsp:useBean id="식별자" class="JavaBean 클래스" scope="사용범위" --%>
<%-- => 내장객체에 저장된 속성값을 객체로 반환받아 제공하거나 속성값이 없는 경우 객체를 생성
		하여 내장객체의 속성값으로 저장하여 제공
 --%>
 <%-- id 속성 : useBean 태그로 제공되는 객체를 구분하기 위한 식별자를 속성값으로 설정 --%>
 <%-- => 내장객체에 저장된 속성값에 대한 속성명으로 사용 --%>
 <%-- class 속성 : useBean 태그로 제공되는 객체의 자료형을 속성값으로 설정 --%>
 <%-- scope 속성 : useBean 태그로 제공되는 객체의 사용범위(Scope)를 속성값으로 설정 --%>
 <%-- => scope 속성을 생략한 경우 [page] 속성을 기본값으로 설정하여 사용 --%>
<jsp:useBean id="hewon" class="xyz.itwill.bean.Hewon" scope="request"></jsp:useBean>
<%--
	Hewon hewon = new Hewon(); => 와 같음
	request.setAttribute("hewon", hewon);
--%>

<%-- setProperty Tag : useBean 태그로 제공된 객체의 필드값을 변경하기 위한 태그 --%>
<%-- Setter 메소드를 호출하여 객체의 필드값 변경 --%>
<%-- name 속성 : useBean 태그로 제공된 객체의 식별자(id 속성값)을 속성값으로 설정 --%>
<%-- Property 속성 : 값을 변경할 필드명을 속성값으로 설정 --%>
<%-- => 필드명을 기반으로 작성된 Setter 메소드 자동 호출 --%>
<%-- value 값을 생략할 시에는 JSP문서 요청 시 전달된 값을 반환받아 필드값 변경 --%>
<%-- => JSP 문서 요청 시 전달된 값의 이름과 setProperty 태그의 propery 속성값(객체 필드명)이 반드시 
	동일해야만 전달값을 반환받아 객체 필드값으로 변경
--%>
<%--  <jsp:setProperty property="name" name="hewon" value="홍길동"/> --%>
<jsp:setProperty property="name" name="hewon"/>
<%-- hewon.setName(request.getParameter("name")) 과 동일 --%>

<jsp:forward page="useBean_display.jsp"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>