<%@ page import="com.bean.Calculator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

<%-- <jsp:useBean id="calculate" class="com.bean.Calculator" scope="request" /> --%>
<jsp:useBean id="calc" class="com.bean.Calculator" />
<jsp:setProperty property="num1" name="calc"/>
<jsp:setProperty property="num2" name="calc"/>
<jsp:setProperty property="op" name="calc"/>
	
	<div id="container">
		<h3>계산기</h3>
		<hr>
	
	<%
		calc.calculate();
	%>
	<p>계산 결과 : <jsp:getProperty property="result" name="calc"/><br>
	<hr>
	<a href="calc.jsp">돌아가기</a></p>
	</div>
	
	<%-- <% 
		Calculator calc = new Calculator();
		int num1;
		int num2;
		int result;
		String op;
		
		if(request.getParameter("num1")==""){
			num1 = 0;
		} else {
			num1 = Integer.parseInt(request.getParameter("num1"));
		}
		
		if(request.getParameter("num2")==""){
			num2 = 0;
		} else {
			num2 = Integer.parseInt(request.getParameter("num2"));
		}

		op = request.getParameter("op");
		
		calc.setNum1(num1);
		calc.setNum2(num2);
		calc.setOp(op);
		
		calc.calculate();
	%>
	
	<p>계산 결과 : <%=calc.getResult() %><br>
	<hr>
	<a href="calc.jsp">돌아가기</a></p> --%>
</body>
</html>