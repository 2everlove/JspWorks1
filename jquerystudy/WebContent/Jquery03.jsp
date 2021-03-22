<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jquery Ex - Insert image</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function addImage(){
	    $(".box").html("<img src='img/ff.jpg' width='300' height='250'>")
	    $(".button1").attr("id", "button2")
	}
</script>
</head>
<body>
	<input id="button1" type="button" value="이미지" onclick="addImage()">
	<div class="box"></div>
</body>
</html>