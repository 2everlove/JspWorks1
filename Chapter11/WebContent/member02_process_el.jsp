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
		align-content: center;
		margin: 0 auto;
	}
	hr{margin-bottom: 20px}
	table{
		width: 400px;
		text-align: center;
		align-content: center;
		margin: 0 auto;
	}
	table, th, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
	}
</style>
</head>
<jsp:useBean id="member" class="com.bean.Member"/>
<jsp:setProperty property="id" name="member"/>
<jsp:setProperty property="pwd" name="member"/>
<jsp:setProperty property="name" name="member"/>
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
				<td>${member.id}</td>
				<%-- <%=requset.getParameter("id") %>--%>
				<td>${member.pwd}</td>
				<td>${member.name}</td>
			</tr>
		</table>
	</div>
</body>
</html>