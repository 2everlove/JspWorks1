<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EL 예제</title>
</head>
<body>
	<h3>문자, 숫자 데이터 표현</h3>
	<%-- <jsp:useBean id="" class=""></jsp:useBean> --%>
	${300} <br>
	${"하늘"}<br>
	${10+1}<br>
	${10+"1"}<br>
	
	<h3>산술 연산자</h3>
	\${7+4} = ${7+4}<br>
	\${7-4} = ${7-4}<br>
	\${7*4} = ${7*4}<br>
	\${7/4} = ${7/4}<br>
	\${7%4} = ${7%4}<br>
	
	<h3>비교 연산자</h3>
	\${10==10} : ${10==10}<br>
	\${10 eq 10} : ${10 eq 10}<br>
	
	\${"face"=="face"} : ${"face"=="face"}<br>
	\${"face" eq "face"} : ${"face" eq "face"}<br>
	
	\${10!=10} : ${10!=10}<br>
	\${10 ne 10} : ${10 ne 10}<br>
	
	\${10 > 20} : ${10 gt 20}<br>
	\${10 < 20} : ${10 lt 20}<br>
	
	\${10 >= 10} : ${10 ge 10}<br>
	\${10 <= 10} : ${10 le 10}<br>
	
	<h3>논리 연산자</h3>
	\${(10==10) && (10>20)} : ${(10==10) and (10>20)}<br>
	\${(10==10) || (10>20)} : ${(10==10) or (10>20)}<br>
	\${!(10>20)} : ${not(10>20)}<br>
	
	
	
	
</body>
</html>