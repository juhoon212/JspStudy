<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 글저장 태그를 클릭한 경우 [review/review_write_action.jsp]문서 - 입력값(게시글정보)--%>
<%-- 비로그인 상태의 사용자가 JSP문서를 요청한 경우  --%>

<%--  --%>
<%@include file="/security/login_check.jspf" %>

<%
	// 전달값을 반환받아 저장 - 전달값이 없는 경우 변수에 초기값 저장
	String ref = "0", restep = "0", relevel = "0", pageNum="1";
	if(request.getParameter("ref") != null) { //전달값이 있는 경우 - 답글
		ref = request.getParameter("ref");
		restep = request.getParameter("restep");
		relevel = request.getParameter("relevel");
		pageNum = request.getParameter("pageNum");
	}
	
%>

<style type="text/css">
table {
	margin : 0 auto;
}

th {
	text-align: left;
}
</style>

<% if(ref.equals("0")) { // 새글인 경우 %>
	<h1>새글쓰기</h1> 
<% } else { %>
	<h1>답글쓰기</h1>
<% } %>

<%-- 파일을 입력받아 전달하기 위해 반드시 encytype 속성값을 [multipart/form-data] 로 설정 --%>
<form action="<%=request.getContextPath()%>/review/review_write_action.jsp"
 method="post" enctype="multipart/form-data" id="reviewForm">
 	<input type="hidden" name="ref" value="<%= ref %>" />
 	<input type="hidden" name="restep" value="<%= restep %>" />
 	<input type="hidden" name="relevel" value="<%= relevel %>" />
 	<input type="hidden" name="pageNum" value="<%= pageNum %>" />
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="subject" id="subject" size="40" />
				<input type="checkbox" name="secret" value="2">비밀글
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" id="rContent" cols="60" rows="7"></textarea>
			</td>
		</tr>
		<tr>
			<th>리뷰이미지</th>
			<td>
				<input type="file" name="reviewimg" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">글저장</button>
				<button type="reset" id="resetBtn">다시쓰기</button>
			</th>
		</tr>
	</table>
 </form>
 
 <div id="message" style="color : red;"></div>
 
 <script type="text/javascript">
$("#subject").focus();

$("#reviewForm").submit(function() {
	if($("#subject").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#subject").focus();
		return false;
	}
	
	if($("#rContent").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#rContent").focus();
		return false;
	}
});

$("#resetBtn").click(function() {
	$("#subject").focus();
	$("#message").text("");
});
</script>