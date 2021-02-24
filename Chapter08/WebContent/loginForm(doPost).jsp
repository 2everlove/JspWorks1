<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>서블릿 예제</title>
<style type="text/css">
	*{
		box-sizing: border-box;
		background-color: black;
		color: white;
	}
	#container{
		width: 80%;
		text-align: center;
		margin: 0 atuo;
	}
	input{
		border: 1px solide #white;
	}
	.area{
		background-color: #ccc;
		color: black;
	}
	input[type="submit"]{
		background-color: #2f3542;
	}
</style>
</head>
<body>
	<%
		
	%>
	<div id="container">
		<form action="login4" method="post">
			<p>
				<label for="id">아이디</label>
				<input type="text" class="area" name="userid" autofocus>
			</p>
			<p>
				<label for="pwd">비밀번호</label>
				<input type="password" class="area" name="passwd">
			</p>
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>