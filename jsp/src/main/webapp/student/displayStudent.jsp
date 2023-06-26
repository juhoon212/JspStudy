﻿<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@page import="xyz.itwll.dto.StudentDTO"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
</head>
<body>
	<h1 align="center">학생리스트</h1>
	<table align="center" cellspacing="0" cellpadding="1" width="800">
		<tr align="right">
			<td>
				<input type="button" value="학생추가" onclick="location.href='insertFormStudent.jsp'">
			</td>
		</tr>
	</table>
	
	<%
	
		List<StudentDTO> list = StudentDAO.getStudent().selectAllStudent();
		
	%>
	
	<table align="center" border="1" cellspacing="0" cellpadding="1" width="800">
		<tr bgcolor="yellow">
			<th width="100"></th>
			<th width="100">이름</th>
			<th width="150">전화번호</th>
			<th width="250">주소</th>
			<th width="100">생년월일</th>
			<th width="50">삭제</th>
			<th width="50">변경</th>
		</tr>
		
		<!-- 학생정보 출력-->
		<%
			for (StudentDTO student : list) { %>
		<tr align="center">
			<td width="100"><%= student.getNo()%></td>				
			<td width="100"><%= student.getName()%></td>				
			<td width="150"><%= student.getPhone() %></td>				
			<td width="250"><%= student.getAddress() %></td>				
			<td width="100"><%= student.getBirthday() %></td>				
			<td width="50"><input type="button" value="삭제" onclick="location.href='deleteStudent.jsp?no=<%=student.getNo()%>'"></td>				
			<td width="50"><input type="button" value="변경" onclick="location.href= 'updateFormStudent.jsp?no=<%=student.getNo()%>'"></td>				
		</tr>
		<% } %>	
	</table>
</body>
</html>






