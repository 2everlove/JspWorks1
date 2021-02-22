/**
 * form validate check (id_en) ,(pw-num)
 */

function checkForm(){
	const form = document.loginForm;

	for(var i=0; i<form.userid.value.length;i++){
		var ch = form.userid.value.charAt(i);
		/*아이디 (영어 소문자)*/
		if((ch<'a'||ch>'z')&&(ch>='A'||ch<='Z')&&(ch>=0||ch<=9)){
			alert("아이디는 영문 소문자만 가능");
			form.useid.select();
			return false;
		}
		/*비밀번호(숫자만 입력)*/
		if(isNaN(form.pwd.value)){
			alert("비밀번호는 숫자만 입력가능합니다");
			form.pwd.select();
			return false;
		}
		form.submit();
	}
}