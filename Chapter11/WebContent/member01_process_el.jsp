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
		align-items: center;
		align-content: center;
		margin: 0 auto;
	}
	table{
		text-align: center;
		align-content: center;
	}
	table, th, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
	}
</style>
</head>

<body>
	<div id="container">
		<h2>회원정보</h2>
		<hr>
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
			</tr>
			<tr>
				<td>${param.id}</td>
				<%-- <%=requset.getParameter("id") %>--%>
				<td>${param.passwd}</td>
				<td>${param.username}</td>
			</tr>
		</table>
	</div>
</body>
</html>