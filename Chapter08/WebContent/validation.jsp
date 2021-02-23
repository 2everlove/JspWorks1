<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(){
	    const form = document.loginForm;
	    const id = form.id.value;
	    const pwd = form.pwd.value;
	    const regExPwd = /^[0-9]*$/; //숫자만 가능
	    const regPwd = /^`${id}`$/;
	    if(id==""){
			alert("아이디를 입력햇주세요");
			form.id.focus();
			form.id.select();
			return false;
	    } else if(id.length<4||id.length>12){
			alert("아이디는 4~12자 까지 입력해주세요");
			form.id.select();
			return false;
	   /*  } else if(isNaN(pwd)){ //숫자가 아님
			alert("비밀번호는 숫자만 입력가능합니다");
			form.pwd.focus();
			return false; */
		} else if (!regExPwd.test(pwd)){ //숫자가 아니면 if문 들어감 //test()는 java의 equals()랑 비슷
		    alert("비밀번호는 숫자만 입력가능합니다");
			form.pwd.focus();
			return false;
		} else if(pwd==""){
			alert("비밀번호는 공백일 수 없다.")
			form.pwd.focus();
			form.pwd.select();
			return false;
	    } else if(pwd.match(id)){
			alert("비밀번호는 ID를 포함할 수 없다.")
			form.pwd.focus();
			form.pwd.select();
			return false;
	    /* } else if(pwd.search(id) > -1){
			alert("비밀번호는 ID를 포함할 수 없다.")
			form.pwd.focus();
			form.pwd.select();
			return false; */
	    /* } else if(!regPwd.test(pwd)){
			alert("비밀번호는 ID를 포함할 수 없습니다.")
			form.pwd.focus();
			form.pwd.select();
			return false; */
	    } else
	    	form.submit();
	}
</script>
</head>
<body>
	<form name="loginForm" action="fileupload01_process.jsp" method="post">
		<p>
			<label for="id">아이디</label>
			<input type="text" name="id" autofocus>
		</p>
		<p>
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd">
		</p>
		<input type="button" value="전송" onclick="checkForm()">
	</form>
</body>
</html>