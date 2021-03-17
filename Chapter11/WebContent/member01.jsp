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
		margin: 0 auto;
	}
	ul li{
		list-style: none;
	}
	label{
		float: left;
		width: 75px;
		margin-right: 10px;
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
		<h2>회원 가입</h2>
		<hr>
		<form action="member02_process_el.jsp" method="post">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" id="userid" name="id">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" id="psw" name="pwd">
				</li>
				<li>
					<label for="username">이름</label>
					<input type="text" id="psw" name="name">
				</li>
			</ul>
			<button type="submit">가입</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>