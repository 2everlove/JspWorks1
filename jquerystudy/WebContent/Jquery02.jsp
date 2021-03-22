<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jquery Ex</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	window.onload = function(){
	    document.getElementById("intro").style.backgroundColor="pink";
	    document.querySelector(".pos").style.color="blue";
	}
</script>
</head>
<body>
	<h2>Welcome to WebMarket</h2>
	<p id="intro">My name is Steve
	<p class="pos">I live in California
</body>
</html>