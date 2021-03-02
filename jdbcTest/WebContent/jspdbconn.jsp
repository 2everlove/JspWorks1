<%@page import="java.sql.ResultSet"%>
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
<style type="text/css">
	*{box-sizing: border-box;}
	table, th, td{border: 1px solid #ccc;}
	table{border-collapse: collapse;}
	th{width: 100px;}
	td{text-align: center;}
</style>
</head>
<body>
	<%
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "hr";
		String password = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			out.println("DB 연결 성공 ("+conn+")<br>");
			String sql = "select * from t_student order by studentid desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			out.print("<table><tr>");
			out.print("<th>학번</th><th>이름</th></tr>");
			while(rs.next()){
				out.print("<tr><td>"+rs.getInt("studentid")+"</td><td>"+rs.getString("name")+"</td></tr>");
			}
				out.print("</table>");
			
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