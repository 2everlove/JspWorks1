<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jquery Ex</title>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function fn_process(){
	    var value = $('.t_input').val(); //입력 값을 가져와서 변수에 담음
	    $(t_output).val(value); //변수를 받아서 매개로 출력
	}
	
</script>
</head>
<body>
	<input type="text" class="t_input">
	<input type="button" value="입력" onclick="fn_process()">
	<div id="result"> 결과 : <br>
	
	<input type="text" id="t_output" disabled>
	</div>
</body>
</html>