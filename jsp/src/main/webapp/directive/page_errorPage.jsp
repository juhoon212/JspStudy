<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSP 문서에서 page Directive의 errorPage 속성을 이용하여 JSP문서 실행시 예외가 발생되면 에러페이지로 응답되도록 
	설정이 가능하지만 JSP 문서마다 속성을 설정해야하는 문제점 발생--%>
<%-- WAS 프로그램에 의해 에러코드(4XX or 5XX)가 전달될 떄 에러페이지로 응답되도록 설정 가능 --%>
<%-- => [web.xml] 파일에 에러코드 대신 응답될 에러페이지의 URL 주소 설정 --%>
<%-- 모든 웹프로그램 실행 시 발생되는 에러코드 대신 에러페이지로 응답 처리 --%>
    
<%
	String text = null;
	//String text = "ABCDEFG";
	//int i = 10/0;
	
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
	
	<h1>page Directive - errorPage 속성</h1>
	<hr>
	<p>page Directive의 errorPage 속성에는 JSP 문서 실행 시 에러(예외)가 발생될 경우 클라이언트
	500 상태코드 대신 에러페이지로 응답하기 위한 웹문서의 URL 주소를 속성값으로 설정
	- 클라이언트의 URL 주소 미변경</p>
	<hr>
	<p>문자열의 문자 갯수 = <%=text.length()%>
</body>
</html>