<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간이란..</title>
</head>
<body>
	<h2>시간이란..</h2>
	<p>내일 죽을 것처럼 오늘을 살고<br>
		영원히 살것 처럼 내일을 꿈꾸어라</p>
	<img src="imgs/watch.jpg" alt="시계">
	<p id="demo">
	<script type="text/javascript">
		setInterval(myWatch, 1000);
		
		function myWatch(){
			var day = new Date();
			var date = day.toLocaleString();
			document.getElementById("demo").innerHTML = date;
		}
	</script>
</body>
</html>