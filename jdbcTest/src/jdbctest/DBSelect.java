package jdbctest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBSelect {
	//WebContent/WEB-INF/ojdbc8.jar 필요 --> 위치 - C:\serverConfig\DBMS\sqldeveloper\jdbc\lib\ojdbc8.jar
	private static String driverClass = "oracle.jdbc.OracleDriver";		// oracle 주소
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // db 주소 thin(drive type) xe버전
	private static String username = "HR"; //사용자 (DB)
	private static String password = "1234"; //비밀번호
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	public static void main(String[] args) {
		try {
			Class.forName(driverClass); //driver loading
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("DB 연결 성공 ("+conn+")");
			
			//학생 목록 조회
			String sql = "SELECT * FROM t_student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //db의 반환값을 가져욤
			int i=1;
			while(rs.next()) { //자료가 있으면 출력
				System.out.print(i+"번 | "+"학번 : "+rs.getInt("studentid"));
				System.out.println(" | 이름 : "+rs.getString("name"));
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
