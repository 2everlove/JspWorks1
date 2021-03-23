package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO2 {
	private static String driverClass = "oracle.jdbc.OracleDriver";		// oracle 주소
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // db 주소 thin(drive type) xe버전
	private static String username = "jweb"; //사용자 (DB)
	private static String password = "4321"; //비밀번호
	
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//DB 연결 메서드
	private void connDB() {
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DB 연결 종료 - rs, pstmt, conn 종료
	private void disconnectRS() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//ID 중복 검사 메서드
	public boolean duplicatedID(String memberId) {
		connDB();
		boolean result = false;
		String sql = "SELECT decode(COUNT(*), 1, 'true', 'false') AS result FROM t_member WHERE memberid = ?";
		//오라클 decode()함수 이용: id의 개수가 1개이면 true, 아니면 false;
		//칼럼 이름 : result
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			//쿼리 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getBoolean("result"); //db에서 result 칼럼을 가져옴
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();
		}
		return result;
	}
		
	
}//class
