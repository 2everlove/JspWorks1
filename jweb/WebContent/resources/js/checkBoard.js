/**
 * 
 */
//글쓰기 양식 유효성 검사
function checkBoard() {
	const form = document.writeForm;
	const title = form.title.value;
	const content = form.content.value;
	
	if(title==""){
		alert('제목을 입력해주세요.');
		form.title.select();
		return false;
	}
	else if(content==""){
		alert('내용을 입력해주세요.');
		form.content.select();
		return false;
	}
		form.submit();
};//