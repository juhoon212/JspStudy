<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwll.dto.ReviewDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%-- 게시글(새글 또는 답글)을 전달받아 REVIEW 테이블에 삽입하고 review/review_list.jsp 문서로--%>
    <%-- 이동하기 위한 URL 주소를 클라이언트에게 전달하여 응답하는 JSP 문서 --%>
    <%-- => 요청 JSP문서로 전달되는 값은 [multipart/form-data] 형태로 값이 전달되므로 COS 라이브러리의
     MultipartRequest 클래스 사용 --%>
     <%-- => 전달받은 파일은 /review_images 서버 디렉토리에 업로드 처리하여 저장 --%>
    <%@include file="/security/login_check.jspf" %>
    <%
    	if(request.getMethod().equals("GET")) {
    		response.sendRedirect(request.getContextPath() + "/index.jsp?group=error&worker=error_404");
    		return;
    	}
    	
    
    	// 전달 파일을 저장할 서버 디렉토리의 파일 시스템 경로를 반환받아 저장
    	String saveDirectory = request.getServletContext().getRealPath("/review_images");
    
		// MultipartRequest 객체 생성 - 모든 전달파일을 서버 디렉토리에 업로드 처리하여 저장    
    	
		MultipartRequest multipartRequest = new MultipartRequest(request, 
				saveDirectory,20*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
		
    	// 전달값을 반환받아 저장
    	
    	int ref = Integer.parseInt(multipartRequest.getParameter("ref"));
    	int restep = Integer.parseInt(multipartRequest.getParameter("restep"));
    	int relevel = Integer.parseInt(multipartRequest.getParameter("relevel"));
    	String pageNum = multipartRequest.getParameter("pageNum");
    	String subject = multipartRequest.getParameter("subject");
    	
    	int status = 1; // 전달값이 없는 경우 초기값 저장 - 일반글
    	
    	if(multipartRequest.getParameter("secret") != null) { // 전달값이 있는 경우 -비밀글
    		status = Integer.parseInt(multipartRequest.getParameter("secret")); 
    	}
    	
    	String content = multipartRequest.getParameter("content");
    	
    	// 업로드 처리된 파일명을 반환받아 저장
    	String reviewimg = multipartRequest.getFilesystemName("reviewimg");
    	
    	// Review_Seq 시퀀스의 다음값을 검색하여 반환하는 DAO 클래스의 메소드 호출
    	// => 게시글의 글번호로 저장
    	// => 새글인 경우에는 게시글의 그룹번호(REF 컬럼값)로 저장
    	int num = ReviewDAO.getDAO().selectNextNum();
    	
    	// 게시글 작성한 클라이언트의 IP주소를 반환받아 저장
    	// request.getRemoteAddr() : JSP문서를 요청한 클라이언트의 IP 주소를 반환하는 메소드
    	String ip = request.getRemoteAddr();
    	
    	// System.out.println("ip = " + ip);
    	
    	// 게시글을 새글과 답글로 구분하여 REVIEW 테이블의 컬럼값으로 저장될 변수값 변경
    	// => review_write.jsp 문서에서 전달된 ref. restep. relevel 변수값 변경 - 새 글 : 초기값, 답글 : 부모 게시글의
    	// 변수값 변경 - 새글 : 초기값, 답글 : 부모글로부터 전달된 값
    	
    	if(ref == 0) { // 새글인 경우
    		// REVIEW 테이블의 REF 컬럼값에는 시퀀스의 다음값(num변수값)을 저장하고 RESTEP 컬럼과
    		// RELEVEL 컬럼에는 restep 변수값(0) 과 level1 변수값(0)을 저장
    		
    		ref = num;
    	} else { // 답글인 경우
    		
    		///REVIEW 테이블에 저장된 기존 게시글에서 REF 컬럼값이 ref 변수값(부모글)과 같은 게시글 
		//중 RESTEP 컬럼값이 restep 변수값(부모글)보다 큰 모든 게시글의 RESTEP 컬럼값을 1 증가
		//되도록 변경 처리
		// => 새로운 답글이 기존 답글보다 먼저 검색되도록 기존 답글의 순서를 증가
		// => REVIEW 테이블에 저장된 게시글의 RESTEP 컬럼값을 변경하는 DAO 클래스의 호출
		
		ReviewDAO.getDAO().updateRestep(ref, restep);
    		
    		
    		//REVIEW 테이블의 REF 컬럼값에는 ref 변수값(부모글)을 저장하고 RESTEP 컬럼과 RELEVEL
    		//컬럼에는 restep 변수값(부모글)과 relevel 변수값(부모글)을 1 증가하여 저장
    		restep++;
    		relevel++;
    	}
    	
    	//DTO 객체를 생성하고 전달값(변수값)으로 필드값 변경
    	ReviewDTO review=new ReviewDTO();
	review.setNum(num);
	review.setReviewid(loginMember.getId());
	//사용자로부터 입력받아 전달된 값에 태그 관련 문자값이 존재할 경우 웹프로그램 실행시 문제 발생
	// => XSS(Cross Site Scripting) 공격 : 사용자가 악의적인 스크립트를 입력하여 페이지가 깨지거나
	//다른 사용자의 사용을 방해하거나 쿠키 및 기타 개인 정보를 특정 사이트로 전송하는 공격
	//review.setSubject(subject);
	
	//XSS 공격을 방어하기 위해 전달값을 변환하여 필드값으로 저장
	//review.setSubject(Utility.stripTag(subject));//사용자가 입력한 태그 관련 문자열을 제거하여 저장
	review.setSubject(Utility.escapeTag(subject));//사용자가 입력한 태그를 문자열로 처리하여 저장
	review.setContent(Utility.escapeTag(content));

	review.setReviewimg(reviewimg);
	review.setRef(ref);
	review.setRestep(restep);
	review.setRelevel(relevel);
	review.setIp(ip);
	review.setStatus(status);
    	
    	//게시글을 전달받아 REVIEW 테이블에 삽입하는 DAO 클래스의 메소드 호출
    	ReviewDAO.getDAO().insertReview(review);
    	
    	//페이지 이동
    	response.sendRedirect(request.getContextPath()+"/index.jsp?group=review&worker=review_list&pageNum="+pageNum);
    	
    	
    	
    %>
    