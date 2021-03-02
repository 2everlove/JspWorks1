package jdbctest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnection {
	private static String driverClass = "oracle.jdbc.OracleDriver";		// oracle 주소
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // db 주소 thin(drive type) xe버전
	private static String username = "HR"; //사용자 (DB)
	private static String password = "1234"; //비밀번호
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
			
	public static void main(String[] args) {
		String sql = "INSERT INTO t_student VALUES (201,'지구')"; //sql 문법
		try {
			Class.forName(driverClass); //driver loading
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("DB 연결 성공 ("+conn+")");
			
			
			
			//학생 추가
			pstmt = conn.prepareStatement(sql); //sql 처리할 객체 생성
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			int idx = sql.indexOf("(");
			String value = sql.substring(idx);
			System.out.println("추가 완료 "+value);
			
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
