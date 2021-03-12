<%-- <%@page import="com.jweb.Member"%> --%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<%
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String) session.getAttribute("sessionId");
	}
%>
<body>
	<jsp:include page="menu.jsp"/>
	<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>
	<jsp:useBean id="member" class="com.jweb.member.Member"/>
	<div id="container">
		<div class="title">
			<h1>회원목록</h1>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>가입일</th>
				<th>회원보기</th>
			</tr>
			<% 
				/* for(Member member : memDAO.getListAll()){ */
				for(int i=0;i<memDAO.getListAll().size();i++){
					member = memDAO.getListAll().get(i);
					if(sessionId.equals(member.getMemberId())){
			%>
			<tr>
				<td style="background-color: #eee"><%=member.getMemberId() %></td>
				<td style="background-color: #eee"><%=member.getName() %></td>
				<td style="background-color: #eee"><%=member.getGender() %></td>
				<td style="background-color: #eee"><%=member.getJoinDate() %></td>
				<td style="background-color: #eee"><a href="memberView.jsp?memberId=<%=member.getMemberId() %>"><input type="button" value="보기" autofocus></a></td>
			</tr>
			<% 		} else { %>
			<tr>
				<td><%=member.getMemberId() %></td>
				<td><%=member.getName() %></td>
				<td><%=member.getGender() %></td>
				<td><%=member.getJoinDate() %></td>
				<td><a href="memberView.jsp?memberId=<%=member.getMemberId() %>"><input type="button" value="보기"></a></td>
			</tr>
			<% }} %>
		</table>
	</div>
</body>
</html>