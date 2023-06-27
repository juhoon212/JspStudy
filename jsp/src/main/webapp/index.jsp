<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 템플릿 페이지를 구현한 JSP문서 --%>
<%-- => 클라이언트의 모든 요청에 대한 응답 결과를 제공하는 JSP문서 --%>
<%-- => 템플릿 페이지의 몸체부에는 클라이언트 요청에 의한 전달값을 이용하여 JSP문서의 실행 결과를 제공받아 포함 --%>

<%
	String group = request.getParameter("group");
	
	if(group == null) {
		group = "main";
	}
		
		
	String worker = request.getParameter("worker");
	if(worker == null) {
		worker = "main_page";
	}
	
	String contentPath = group + "/" + worker + ".jsp";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div id="header">
		<jsp:include page="header_main.jsp"></jsp:include>
	</div>
	
	<div id="content">
 		<jsp:include page="<%= contentPath %>"></jsp:include>
		
	</div>
	
	<div id="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>