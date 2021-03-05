<%@ page import="com.beans.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세 보기</title>
<link rel="stylesheet" href=css/address.css>
</head>
<body>
	<jsp:useBean id="abBook" class="com.beans.AddrBookDAO" scope="application"></jsp:useBean>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		AddrBook addrBook = abBook.getOneDB(num);
	%>
	<div id="container">
		<h2><%=addrBook.getUsername() %>님의 정보 수정하기</h2>
			<hr>
		<form action="AddrUpadteProcess.jsp?num=<%=addrBook.getNum()%>" method="post">
			<table>
				<tr>
					<th>번호</th>
					<td><input type="text" name="num" class="input" value="<%=addrBook.getNum() %>" disabled="disabled"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="username" class="input" value="<%=addrBook.getUsername() %>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="tel" class="input" value="<%=addrBook.getTel() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" class="input" value="<%=addrBook.getEmail() %>"></td>
				</tr>
				<tr>
					<th>성별</th>
						<td>
						<% 
							if(addrBook.getGender().equals("남")){
						%>
							<input type="radio" name="gender" class="input" value="남" checked >남
							<input type="radio" name="gender" class="input" value="여">여
						<%
							} else if (addrBook.getGender().equals("여")) {
						%>
							<input type="radio" name="gender" class="input" value="남">남
							<input type="radio" name="gender" class="input" value="여" checked="checked">여
						<% } %>
						</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="text" name="joinDate" class="input" value="<%=addrBook.getJoinDate() %>" disabled="disabled"></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="addrList.jsp"><input type="button" class="view__button" value="목록"></a>
						<input type="submit" class="view__button" value="저장">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>