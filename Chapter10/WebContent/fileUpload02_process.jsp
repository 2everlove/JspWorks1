<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파일 업로드 예제</title>
<style type="text/css">
	*{
		box-sizing: border-box;
		text-align: center;
	}
	table{
		width: 600px;
		margin: 0 auto;
		align-items: center;
	}
	table, th, td{
		border: 1px solid black;
	}
	table, td{border-collapse: collapse;}
	img{
		
	}
</style>
</head>
<body>
	<%
		String realFolder = "C:\\JspWorks1\\Chapter10\\WebContent\\upload";
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		//일반 데이터 가져오기
		String name1 = multi.getParameter("name1");
		String title1 = multi.getParameter("title1");
		
		String name2 = multi.getParameter("name2");
		String title2 = multi.getParameter("title2");
		
		String name3 = multi.getParameter("name3");
		String title3 = multi.getParameter("title3");
		
		//폼의 파일 데이터 가져오기
		Enumeration<String> files = multi.getFileNames();
		
		String file3 = files.nextElement();
		String filename3 = multi.getFilesystemName(file3);
		
		String file2 = files.nextElement();
		String filename2 = multi.getFilesystemName(file2);
		
		String file1 = files.nextElement();
		String filename1 = multi.getFilesystemName(file1);		
	%>
</body>
	<h2>파일의 정보</h2>
	<table>
		<tr>
			<th>이름</th>
			<th>제목</th>
			<th width=200>파일</th>
			<th>이미지</th>
		</tr>
		<tr>
			<%
				out.print("<td>"+name3+"</td>"); 
				out.print("<td>"+title3+"</td>"); 
				out.print("<td>"+filename3+"</td>"); 
				out.print("<td width=100px><img src='upload/"+filename3+"' width=100 height=50></td>");
			%>
		</tr>
		<tr>
			<%
				out.print("<td>"+name2+"</td>"); 
				out.print("<td>"+title2+"</td>"); 
				out.print("<td>"+filename2+"</td>");
				out.print("<td width=100px><img src='upload/"+filename2+"' width=100 height=50></td>");
			%>
		</tr>
			<%
				out.print("<tr><td>"+name1+"</td>"); 
				out.print("<td>"+title1+"</td>"); 
				out.print("<td>"+filename1+"</td>"); 
				out.print("<td width=100px><img src='upload/"+filename1+"' width=100 height=50></td></tr>");
			%>
	</table>
</html>