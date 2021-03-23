/**
 * 폼 유효성 검사
	영문자,숫자 혼용 : 정규 표현식

 */

function press(){ 
	if(window.event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
		checkMember();
	} 
};//

function checkMember() {
    const form = document.regForm;
    const pwd = form.passwd.value;
    const pwd_confirm = form.passwd_confirm.value;
    const id = form.memberId.value;
    const name = form.name.value;
	const gender = form.gender.value;
	const regExPwd1 = /^[a-zA-Z0-9]{6,15}$/;
/*	const regExPwd = /[a-z | A-Z ]{6,15}/;*/
	const chk_num = pwd.search(/[0-9]/g);
	const chk_eng = pwd.search(/[a-zA-Z]/g);
	const id_message = form.id_message.value;
	/*const regExPwdfunc = /[~!@#$%^&*()_+|<>?:{}]/;*/
	if (id==""){
	    alert("아이디가 입력되지 않았습니다.");
	    form.memberId.focus();
	    return false;
	} 
	else if (id.length < 4 || id.length > 12){
		alert("아이디는 4자~12자까지 입력 가능합니다.");
	    form.memberId.focus();
	    return false;
	} 
	else if (id_message=="false"){
		alert("아이디가 중복되어있습니다.")
		form.memberId.focus();
	    return false;
	}
	else if (pwd==""){
	    alert("비밀번호가 입력되지 않았습니다.");
	    form.passwd.focus();
	    return false;
	} 
	else if (pwd_confirm==""){
	    alert("비밀번호를 다시 입력해주세요.");
	    form.passwd_confirm.focus();
	    return false;
	} 
	else if (pwd.length<6 || pwd.length>15){
		alert("비밀번호는 6자~15자까지 가능합니다.");
	    form.passwd.select();
	    return false;
	} 
	else if (!regExPwd1.test(pwd) || chk_num<0 || chk_eng<0){
		alert("비밀번호는 영문자, 숫자, 특수문자 조합으로만 가능합니다.");
	    form.passwd.select();
	    return false;
	/*} else if (!regExPwd1.test(pwd) || !regExPwdfunc.test(pwd)){
		alert("비밀번호는 영문자, 숫자, 특수문자 조합으로만 가능합니다.");
	    form.passwd.select();
	    return false;*/
	} 
	else if(pwd!=pwd_confirm){
	    alert("비밀번호를 동일하게 입력해주세요.");
	    form.passwd.select();
	    return false;
	} 
	else if (name==""){
	    alert("이름을 입력해 주세요.");
	    form.name.focus();
	    return false;
	}
	if(confirm("입력한 정보가 맞으시면 확인을 눌러주세요.\n아이디 : "+id+"\n이름 : "+name+"\n성별 : "+gender))
		form.submit();		    
};//

