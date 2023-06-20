<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 선언문(Declaration) : 필드 또는 메소드를 선언하는 명령을 작성하는 영역 제공--%>
<%-- 서블릿 클래스의 명령으로 해석 --%>
<%!
	int count = 0; 
%>
<%-- 스크립틀릿(Scriptlet) : 요청을 처리하기 위한 Java 명령을 작성하는 영역 제공 --%>
<%
	// 요청 처리 메소드에서 생성되어 사용되는 지역변수
	// => 지역변수는 변수가 선언된 메소드 종료 시 자동 소멸
	count++;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>스크립트 요소(Script Element)</h1>
		<hr>
		<%--<p>JSP문서의 요청 횟수 = <% out.println(count); %></p> --%>
		
		<%-- 표현식(Expression) : 값(변수값, 연산 결과값, 메소드 반환값)을 응답파일에 포함하기 위한 영역 제공 --%>
		<p>JSP 문서의 요청 횟수 = <%=count%></p>
</body>
</html>