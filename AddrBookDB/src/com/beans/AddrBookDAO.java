package com.beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddrBookDAO implements Serializable {
	private static final long serialVersionUID = 202103;
	
	private static String driverClass = "oracle.jdbc.OracleDriver";		// oracle 주소
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // db 주소 thin(drive type) xe버전
	private static String username = "HR"; //사용자 (DB)
	private static String password = "1234"; //비밀번호
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
	
	//연결 종료 메서드
	private void disconnect() {
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
	
	//주소 추가 메서드
	public void addAddress(AddrBook addrBook) { //joinDate는 자동으로 추가되므로 add 불필요
		connDB();
		String sql = "INSERT INTO t_address (num, username, tel, email, gender) VALUES "
										+	"(abSeq.NEXTVAL, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			//parameter setting with AddrBook
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			//트랜잭션 수행완료
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//주소 목록
	public ArrayList<AddrBook> getListAll() {
		connDB();
		ArrayList<AddrBook> addrList = new ArrayList<>();
		String sql = "SELECT * FROM t_address";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrbook = new AddrBook();
				addrbook.setNum(rs.getInt("num"));
				addrbook.setUsername(rs.getString("username"));
				addrbook.setTel(rs.getString("tel"));
				addrbook.setEmail(rs.getString("email"));
				addrbook.setGender(rs.getString("gender"));
				addrbook.setJoinDate(rs.getDate("joinDate"));
				
				addrList.add(addrbook);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return addrList;
	}
	
	public AddrBook viewAddr(int num) {
		connDB();
		String sql = "select * from t_address where num = '"+num+"'";
		return null;
		
	}
	
}
