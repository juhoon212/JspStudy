<%@page import="xyz.itwll.dto.MemberDTO"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@page import="javax.swing.JTree.DynamicUtilTreeNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 로그인정보를 전달받아 로그인 처리하고 [main/main_page.jsp]로 이동 --%>
    <%-- => 로그인 정보로 인증이 실패한 경우 [member/member_login.jsp] 문서를 요청하기 위한 URL주소 --%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendRedirect(request.getContextPath() + "index.jsp?group=error&worker=error_404");
		return;
	}
	
	// 전달값을 반환받아 저장
	String id = request.getParameter("id");
	String passwd = Utility.encrypt(request.getParameter("passwd"));
	
	// 아이디를 전달받아 Member 테이블에 저장된 회원정보를 검색하여 DTO 객체로 반환하는 DAO클래스
	MemberDTO member = MemberDAO.getMemberDAO().selectMember(id);
	
	
	
	if(member == null || !member.getPasswd().equals(passwd)) {
		session.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다");
		session.setAttribute("id", id);
		response.sendRedirect(request.getContextPath() + "index.jsp?group=member&worker=member_login");
		return;
	}
	
	// 인증성공 - 바인딩된 세션에 권한 관련 정보의 객체를 속성값으로 저장
	session.setAttribute("loginMember", member);
	
	
	response.sendRedirect(request.getContextPath() + "index.jsp?group=main&worker=main_page");
	
	
%>