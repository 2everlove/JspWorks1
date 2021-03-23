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
	$(document).ready(function(){
	    msg1();
	    $("#id1").click(function(){
			/* $("#box").append("<br>안녕하세요.").css("color","red").css("background-color","grey"); 메시지 : 를 없애지 않고 추가됨(append)*/
			$("#box").text("<br>안녕하세요.").css("color": "red", "background-color": "grey");/* 메시지 : 를 덮어쓰고 추가됨 */
	    });
	    
	});
	function msg1(){
	    alert("msg1(): 문서 로드 후 자동으로 경고 창을 표시합니다.");
	}
</script>
</head>
<body>
	<p><button id="id1">클릭하면 메시지를 변경합니다.</button></p>
	<div id="box">메시지 : </div>
</body>
</html>