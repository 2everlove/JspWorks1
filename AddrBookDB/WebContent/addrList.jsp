<%@page import="com.beans.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주소 목록</title>
<link rel="stylesheet" href=css/address.css>
</head>
<body>
	<jsp:useBean id="abBook" class="com.beans.AddrBookDAO" scope="application"></jsp:useBean>
	
	<div id="container">
		<h2>주소 목록</h2>
		<p><a href="addrForm.html">주소 추가</a></p>
		<hr>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>가입일</th>
				<th>상세보기</th>
			</tr>
			<%
				for(int i=0; i<abBook.getListAll().size(); i++){
					AddrBook addrBook = abBook.getListAll().get(i);
				
			%>
			<tr>
				<td><%= addrBook.getNum() %></td>
				<td><%= addrBook.getUsername() %></td>
				<td><%= addrBook.getGender() %></td>
				<td><%= addrBook.getJoinDate() %></td>
				<td><a href="addrView.jsp?num=<%=addrBook.getNum()%>"><input type="button" value="보기"></a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>