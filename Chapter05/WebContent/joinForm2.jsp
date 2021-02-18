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
	body{margin: 0 auto;}
	#container{
		margin: 0 auto;
		width = 500px;
		align-items: center;
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
		<form action="joinInfo.jsp" method="post">
			<ul>
				<li>
					<label for="userid">아이디</label>
					<input type="text" id="userid" name="userid" autofocus="autofocus">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" id="passwd" name="passwd">
				</li>
				<li>
					<label for="name">이 름</label>
					<input type="text" id="name" name="name">
				</li>
				<li>
					<label for="phone">연락처</label>
					<input type="text" id="phone1" name="phone1" maxlength=4 size=4 placeholder="010" value="010">
					- <input type="text" id="phone2" name="phone2" maxlength="4" size=4>
					- <input type="text" id="phone3" name="phone3" maxlength="4" size=4>
				</li>
				<li>
					<label for="gender">성별</label>
					<input type="radio" id="gender" name="gender" checked="checked" value="남성">남성
					<input type="radio" id="gender" name="gender" value="여성">여성
				</li>
				<li>
					<label for="hobby">취미</label>
					<label><input type="checkbox" id="hobby1" name="hobby" checked="checked" value="독서">독서</label>
					<label><input type="checkbox" id="hobby2" name="hobby" value="운동">운동</label>
					<label><input type="checkbox" id="hobby3" name="hobby" value="영화">영화</label>
				</li>
			</ul>
			<p>
				<textarea name="comment" rows="3" cols="30" placeholder="자유롭게 소개를 해주세요."></textarea>
			</p>
			<button type="submit">가입하기</button>
			<button type="reset">초기화</button>
		</form>
	</div>
</body>
</html>