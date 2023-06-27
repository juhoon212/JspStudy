<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwll.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendRedirect(request.getContextPath() + "/index.jsp?group=error&worker=error_400");
		return;
	}

	//POST 방식으로 요청하여 전달된 값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = Utility.encrypt(request.getParameter("passwd")); // 전달값을 암호화 처리하여 반환
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String mobileCombine = request.getParameter("mobile1") + "-" + request.getParameter("mobile2") +"-" 
														+ request.getParameter("mobile3");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	MemberDTO member = new MemberDTO();
	
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setMobile(mobileCombine);
	member.setZipcode(zipcode);
	member.setAddress(address);
	member.setAddress2(address2);
	
	MemberDAO.getMemberDAO().insertMember(member);
	
	response.sendRedirect(request.getContextPath()+"/index.jsp?group=member&worker=member_login");
%>
