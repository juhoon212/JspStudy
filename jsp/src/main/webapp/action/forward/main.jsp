<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인페이지</h1>
	<hr>
	<%-- 
	<a href="login.jsp">로그인</a>
	<a href="join.jsp">회원가입</a>
	<a href="cart.jsp">장바구니</a>
	<a href="review.jsp">제품후기</a>
	 --%>
	
	<a href="controller.jsp?pageName=login">로그인</a>
	<a href="controller.jsp?pageName=join">회원가입</a>
	<a href="controller.jsp?pageName=cart">장바구니</a>
	<a href="controller.jsp?pageName=review">제품후기</a>
	
</body>
</html>