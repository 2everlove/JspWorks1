<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파일 업로드 처리</title>
</head>
<body>
	<%
		String realFolder = "C:\\JspWorks1\\Chapter10\\WebContent\\upload";
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		//폼의 요청 name을 가져오기
		Enumeration<String> params = multi.getParameterNames(); //여러개의 이름 가져오기
		while(params.hasMoreElements()){
			String name = params.nextElement();
			String value = multi.getParameter(name);
			out.println(name + "=" + value + "<br>");
		}
		
		//폼의 요청 file name 가져오기
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()){
			String name = files.nextElement();
			String fileName = multi.getFilesystemName(name);
			String original = multi.getOriginalFileName(name);
			String type = multi.getContentType(name);
			File file = multi.getFile(name);
			
			out.println("요청 파라미터 이름 : "+name + "<br>");
			out.println("저장 파일 이름 : "+fileName+"<br>");
			out.println("실제 파일 이름 : "+original+"<br>");
			out.println("파일 컨텐츠 유형 : "+type+"<br>");
			if(file != null) 
				out.println("파일 크기 : "+type+"<br>");
	%>
	
	<p>이미지
	<p><img alt="그림" src="upload/<%=fileName %>">
	
	<% } %>
</body>
</html>