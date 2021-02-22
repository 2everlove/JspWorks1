/**
 * 폼 유효성 검사
 */

function checkForm(){
	const form = document.loginForm;
	
	//아이다니 비밀번호 글자 수 체크
	if(form.userid.value.length < 4|| form.userid.value.length>12){
		alert("아이디 길이는 4~12자 이내로 입력 가능 합니다");
		form.userid.select(); //현재 입력상자의 범위 지정
		return false;
	} else if(form.pwd.value.length < 5){
		alert("비밀번호는 5자 이상 입력 가능 합니다");
		form.pwd.select(); //현재 입력상자의 범위 지정
		return false;
	}
	
	form.submit();
	
}