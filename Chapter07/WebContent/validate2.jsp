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
		//id pw가 공백일 경우 검사
		if(form.userid.value==""){
		    alert("아이디를 입력해주세요");
		    form.usderid.focus();
		    return false; //안쓰면 전송됨
		} else if(form.pwd.value==""){
		    alert("비밀번호를 입력해주세요");
		    form.pwd.focus();
		    return false;
		} else
	    	form.submit(); //전송 메서드
	}
</script>
</head>
<body>
	<div id="container">
		<form name ="loginForm" action="validate2_process.jsp" method="post">
			<p>
				<label for="id">아이디</label>
				<input type="text" name="userid" autofocus="autofocus">
			</p>
			<p>
				<label for="pwd">비밀번호</label>
				<input type="password"  name="pwd">
			</p>
			<p>
				<input type="button" value="전송" onclick="checkForm()">
			</p>
		</form>
	</div>

</body>
</html>