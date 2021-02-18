<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form Processing</title>
<style>
	*{box-sizing: border-box;}
	body{margin: 0 auto;}
	#container{
		margin: 0 auto;
		width = 500px;
		align-items: center;
	}
	h3{
		margin-left: 40px
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
	textarea{
		margin : 20px 0 20px 40px;
		clear: both;
	}
	button[type="submit"] {
		margin-left:40px;
		margin-right:20px;
	}
</style>
</head>
<body>
	<div id="container">
	<h3>회원 가입</h3>
	<hr>
		<form action="form01_process.jsp" method="post">
			<ul>
				<li>
					<label for="name">이름</label>
					<input type="text" id="name" name="name" autofocus="autofocus">
				</li>
				<li>
					<label for="address">주소</label>
					<input type="text" id="address" name="address">
				</li>
				<li>
					<label for="mail">이메일</label>
					<input type="email" id="mail" name="mail">
				</li>
			</ul>
			<button type="submit">전송</button>
		</form>
	</div>
</body>
</html>