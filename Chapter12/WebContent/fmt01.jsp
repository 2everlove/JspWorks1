<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- el언어는 jstl-1.2.jar라는 파일이 web-inf>lib>에 포함되어야함 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>format 태그</title>
</head>
<body>
	<p>숫자 : <fmt:formatNumber value="3210100"/>
	<p>type="number" <fmt:formatNumber value="3210100" type="number"/>
	<p>groupingUsed="false" <fmt:formatNumber value="3210100" groupingUsed="false"/>
	<p>groupingUsed="true" <fmt:formatNumber value="3210100" groupingUsed="true"/>
	
	<p>통화 : <fmt:formatNumber value="3210100" type="currency"/>
	<p><fmt:formatNumber value="3210100" type="currency" currencySymbol="$"/>
	
	<p>백분율 : <fmt:formatNumber value="0.25" type="percent"/>
	<p>소수자릿수 설정 : <fmt:formatNumber pattern="#,##0.0" value="1234.567"/>
	
</body>
</html>