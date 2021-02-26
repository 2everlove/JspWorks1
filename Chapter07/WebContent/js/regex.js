/**
 * validation
 */

function checkMember(){
	const form = document.Member;
	const id = form.userid.value;
	const pwd = form.pwd.value;
	const name = form.name.value;
	const phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
	
	const regExId = /^[a-z | A-Z | ㅏ-ㅣ | ㄱ-ㅎ | 가-힣]*$/; //문자로 시작
	const regExPwd = /^[0-9]*$/;
	const regExName = /^[가-힣]*$/;
/*	const regExPhone = /^\d{3}-\d{3}|d{4}-\d{4}$/;*/
	const regExPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	
	if(!regExId.test(id)){
		alert("아이디는 숫자로 시작할 수 없습니다.");
		form.userid.select();
		return false;
	} else if(!regExPwd.test(pwd)){
		alert("비밀번호는 숫자만 입력해주세요.");
		form.pwd.select();
		return false;
	} else if(!regExName.test(name)){
		alert("이름은 한글로 입력해주세요.");
		form.name.select();
		return false;
	} else if(!regExPhone.test(phone)){
		alert("연락처를 다시 입력해주세요.");
		form.phone1.value;
		return false;
	}
		form.submit();
		return true;
}

function moveOnMax(phone2,phone3){
const form = document.Member;
  if(form.phone2.value.length >= phone2.maxLength){
    document.getElementById(phone3).focus();
  }
}

function press(f){ 
const form = document.Member;
	if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
	checkMember();
	form.submit(); //formname에 사용자가 지정한 form의 name입력 
	} 
}

