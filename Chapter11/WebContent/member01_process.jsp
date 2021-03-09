<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입 처리</title>
<style type="text/css">
	#container{
		text-align: center;
		align-items: center;
		align-content: center;
		margin: 0 auto;
		width: 700px;
	}
	table{
		align-content: center;
	}
	table, th, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
	}
</style>
</head>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("passwd");
		String name = request.getParameter("username");
	%>
<body>
	<div id="container">
		<h2>회원정보</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
			</tr>
			<tr>
				<td><%=id %></td>
				<td><%=pwd %></td>
				<td><%=name %></td>
			</tr>
		</table>
	</div>
</body>
</html>