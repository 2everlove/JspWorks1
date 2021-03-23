<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO2" scope="application"/>
<%
	//자바 부분
	//폼에서 넘어온 자료 수집 부분
	String memberId =request.getParameter("memberId");
	String passwd = request.getParameter("passwd");
	
	//로그인 체크 처리
	int result = memDAO.login(memberId, passwd);
	
	if(result==1) { //아이디, 비번 일치
		session.setAttribute("sessionId", memberId);
		out.println("<script>");
		out.println("alert('["+memberId+"]님 로그인 되었습니다.')");
		out.println("location.href='memberResult.jsp?msg=2'");
		/* response.sendRedirect("memberResult.jsp?msg=2"); */
		out.println("</script>");
		/* response.sendRedirect("memberList.jsp"); //목록페이지로 이동 */
	} else if(result==0){
		out.println("<script>");
		out.println("alert('아이디가 일치하지 않습니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
	} else if(result==-1) {
		out.println("<script>");
		out.println("alert('비밀번호가 일치하지 않습니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
	} else if(result==-2) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.\n관리자에게 문의 부탁드립니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
	}
%>
</head>
<body>

</body>
</html>