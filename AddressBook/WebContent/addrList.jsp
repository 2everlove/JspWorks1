<%@ page import="com.dao.AddrBook" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주소 목록</title>
<link rel="stylesheet" href=css/address.css>
</head>
<body>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
	<div id="container">
		<h2>주소 목록</h2>
		<hr>
		<p><a href="addrForm.html">주소록 추가</a></p>
		<hr>
		<table id="table__2">
			<tr>
				<th>이름</th><th class="wi">연락처</th><th class="wi">이메일</th><th>성별</th>
			</tr>		
			<%
				/* for(int i=0; i<abDAO.getListAll().size(); i++){
					AddrBook addrBook = abDAO.getListAll().get(i); */
				for(AddrBook addrBook : abDAO.getListAll()){
					
			%>
			<tr>
				<td><%=addrBook.getUsername() %> </td>
				<td><%=addrBook.getTel() %> </td>
				<td><%=addrBook.getEmail() %> </td>
				<td><%=addrBook.getGender() %> </td>
			</tr>
			<%
				}
			%>
		</table>
	
	</div>
</body>
</html>