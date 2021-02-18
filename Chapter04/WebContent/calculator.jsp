<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>계산기 프로그램</title>
<style type="text/css">
	#container{
		width: 80%;
		margin : 0 auto;
		text-align: center;
	}
	p{
		text-align: center;
	}
</style>
</head>
<body>
	<%!
		//전역 멤버변수 선언
		private int num1 = 0;
		private int num2 = 0;
		private String op = "";
		private int result = 0;
		
		//계산 메서드
		public int calculate(){
			if(op.equals("+"))
				result = num1+num2;
			else if(op.equals("-"))
				result = num1-num2;
			else if(op.equals("x"))
				result = num1*num2;
			else if(op.equals("/"))
				if(num1==0||num2==0)
					result = 0;
				else
					result = num1/num2;
			
			return result;
		}
	%>
	
	<%
		if(request.getMethod().equals("POST")){
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
		}
			
	
	%>
	
	<div id="container">
		<form action="" method="post" name="form1">
			<input type="text" name="num1" autofocus="autofocus">
			<select name="op">
				<option>+</option>
				<option>-</option>
				<option>x</option>
				<option>/</option>
			</select>
			<input type="text" name="num2">
			<input type="submit" value="계산">
			<input type="reset" value="초기화">
		</form>
	</div>
	<p>계산 결과 : <%=calculate() %>
</body>
</html>