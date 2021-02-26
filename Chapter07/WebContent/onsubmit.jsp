<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 폼</title>
</head>
<script type="text/javascript">
	function checkForm(){
	    const form = document.loginForm;
	    const id = form.userid.value;
	    const pwd = form.pwd.value;
	    
	    if(id == ""){
			alert("아이디를 입력해주세요");
			form.userid.focus();
			return false;
	    } else if (pwd==""){
			alert("비밀번호를 입력해주세요");
			form.pwd.focus();
			return false;
	    }
	}
</script>
<body>
	<div id="container">
		<form name ="loginForm" action="login_process.jsp" method="post" onsubmit="return checkForm()">
			<p>
				<label for="id">아이디</label>
				<input type="text" name="userid" autofocus="autofocus">
			</p>
			<p>
				<label for="pwd">pw</label>
				<input type="password" name="pwd">
			</p>
			<p>
				<input type="submit" value="전송">
			</p>
		</form>
	</div>

</body>
</html>