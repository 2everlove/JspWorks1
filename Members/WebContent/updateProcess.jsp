<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:useBean id="member" class="com.jweb.member.Member" />
<!-- 자료 수집 -->
<jsp:setProperty property="memberId" name="member"/>
<jsp:setProperty property="passwd" name="member"/>
<jsp:setProperty property="name" name="member"/>
<jsp:setProperty property="gender" name="member"/>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>
<%
	// dao - update();
	memDAO.updateMember(member);
	/* response.sendRedirect("memberView.jsp?memberId="+member.getMemberId()); */
	out.println("<script>alert('회원정보가 수정되었습니다.')");
	out.println("location.href='memberResult.jsp?msg=0'</script>");
	
	/* RequestDispatcher 클래스 가장 많이 사용 */
%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>