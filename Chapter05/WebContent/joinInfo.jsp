<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>import name, value</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	th{
		text-align: center;
		border-bottom: 2px solid black;
	}
	th, td{
		padding: 4px;
		text-indent: 5px;
		width: 150px;
	}
</style>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		
		<%
			request.setCharacterEncoding("utf-8");
			
			Enumeration<String> paramNames = request.getParameterNames();
			while(paramNames.hasMoreElements()){
				String name = paramNames.nextElement(); //name을 얻어옴
				if(name.equals("phone1")||name.equals("phone2")||name.equals("phone3")){//phone
					if(name.equals("phone1")){
						out.println("<tr><td>phone</td><td>");
						out.println(request.getParameter(name)+" -");
					} else if(name.equals("phone2")){
						out.println(request.getParameter(name)+" -");
					} else if(name.equals("phone3")){
						out.println(request.getParameter(name));
						out.println("</td></tr>");
					}
				} else if(name.equals("hobby")){ //hobby
					String[] hobby = request.getParameterValues("hobby");
					out.println("<tr><td>"+name+"</td><td>");
					for(String h : hobby){
						out.print(h + " ");
					}
					out.println("</td></tr>");
				} else { //etc
					String value = request.getParameter(name); //name을 매개로 값을 가져옴
					out.println("<tr><td>"+name+"</td><td>"+value+"</td></tr>");
				}
			}
	
		%>
	</table>
</body>
</html>