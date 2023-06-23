<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보등록</h1>
	<hr />
	<form action="non_useBean_action.jsp" method="post"></form>
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"/></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">회원등록</button></td>
		</tr>
	</table>
</body>
</html>