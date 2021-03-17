<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입 폼</title>
<style>
	*{box-sizing: border-box;}
	#container{
		text-align: center;
		margin: 0 auto;
	}
	ul li{
		list-style: none;
	}
	label{
		float: left;
		width: 75px;
		margin-left: 30%;
	}
	li{
		margin-bottom: 10px;
	}
	input{
		border : 1px solide #ccc;
		border-radius: 2px;
	}
	button[type="submit"] {
		margin-left:40px;
		margin-right:20px;
	}
</style>
</head>
<body>
	<div id="container" style="margin: 0 auto;">
		<h2>로그인</h2>
		<hr>
		<form action="loginProcess.jsp" method="post">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" id="id" name="id">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" id="pwd" name="pwd">
				</li>
			</ul>
			<button type="submit">로그인</button>
			<button type="reset">취소</button>
		</form>
		<p><a href="http://localhost:8081/Chapter11/member01.jsp">회원 가입</a></p>
		<p><a href="<%=request.getContextPath()  %>/member01.jsp">회원 가입</a></p>
		<p><%=request.getContextPath()  %></p>
		<p><a href="${pageContext.request.contextPath }/member01.jsp">회원 가입</a></p>
	</div>
</body>
</html>