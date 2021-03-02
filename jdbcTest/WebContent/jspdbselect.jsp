<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	<%
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "hr";
		String password = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			out.println("DB 연결 성공 ("+conn+")<br>");
			String sql = "INSERT INTO t_student VALUES(205,'금성')";
			int idx = sql.indexOf("(");
			String value = sql.substring(idx);
			out.println("추가 완료 "+value);
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			if(pstmt != null){
				pstmt.close();
			}
			if(conn !=null){
				conn.close();
			}
		}
		
		
	%>
</body>
</html>