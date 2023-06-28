<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	

	String successMessage = (String)session.getAttribute("successMessage");
	String failMessage = (String)session.getAttribute("failMessage");
	
	
	
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

#id {
	list-style-type: none;
	margin-bottom: 10px;
}

li {
	list-style-type: none;
}

#button {
	margin: 10px;
}

.warn {
	color : red;
}

.warn-email {
	color : red;
}


</style>
<body>
<form action="<%=request.getContextPath()%>/member/search_id.jsp" method="post">
<ul>
<li>
<label for="name" >이름</label>
<input type="text" name="name" id="id" placeholder="찾으실 아이디의 이름 입력하세요"/><span class="warn"></span>

</li>
<li>
<label for="email">이메일</label>
<input type="text" name="email" id="email" placeholder="이메일을 입력하세요"/><span class="warn-email"></span>
</li>
<li>
<button type="submit" id="button">검색</button>
</li>
	<div> <%=successMessage %></div>
</ul>
</form>
</ul>

<script type="text/javascript">
let id = document.querySelector("#id");
let email = document.querySelector("#email");


document.querySelector("#button").addEventListener("click", (e) => {

	if(id.value == "") {
		document.querySelector(".warn").innerHTML = "아이디를 입력해주세요"
		e.preventDefault();
		return;
	}

	if(email.value == "") {
		document.querySelector(".warn-email").innerHTML = "이메일을 입력해주세요"
		e.preventDefault();
		return;
	}
	
	
	
	
})





</script>
</body>
</html>