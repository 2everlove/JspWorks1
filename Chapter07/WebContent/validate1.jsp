<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 폼</title>
<script type="text/javascript">
	function checkForm(){
	    const form = document.loginForm;
	    
	    alert("아이디 : "+form.userid.value+"\n패스워드 : "+form.pwd.value);
	}
</script>
</head>
<body>
	<div id="container">
		<form name ="loginForm" action="session_process.jsp" method="post">
			<p>
				<label for="id">아이디</label>
				<input type="text" name="userid" autofocus="autofocus">
			</p>
			<p>
				<label for="pwd">pw</label>
				<input type="password" name="pwd">
			</p>
			<p>
				<input type="submit" value="전송" onclick="checkForm()">
			</p>
		</form>
	</div>

</body>
</html>