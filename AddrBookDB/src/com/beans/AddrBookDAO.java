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
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return addrList;
	}
	
	//세부 정보
	public AddrBook getOneDB(int num) {
		connDB();
		AddrBook addrbook = new AddrBook();
		String sql = "select * from t_address where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); //입력번호 세팅
			rs = pstmt.executeQuery();
			rs.next(); //1개의 자료
			addrbook.setNum(rs.getInt("num"));
			addrbook.setUsername(rs.getString("username"));
			addrbook.setTel(rs.getString("tel"));
			addrbook.setEmail(rs.getString("email"));
			addrbook.setGender(rs.getString("gender"));
			addrbook.setJoinDate(rs.getDate("joinDate"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return addrbook;
	}
	
	//주소 삭제
	public void remobeAddress(int num) {
		connDB();
		String sql = "delete from t_address where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); //트랜잭션 수행완료
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//주소 갱신(수정)
	public void updateAddr(AddrBook addrBook) { //joinDate는 자동으로 추가되므로 add 불필요
		connDB();
		String sql = "UPDATE t_address SET username=?, tel=?, email=?, gender=? WHERE num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			//parameter setting with AddrBook
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			pstmt.setInt(5, addrBook.getNum());
			//트랜잭션 수행완료
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//로그인 체크
	public boolean checkLogin(String email) {
		connDB();
		String sql = "select email from t_address where email=?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();  //sql qeury 실행문
			if(rs.next()) 
				return true; //이메일 일치
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}
	
	
	public String nameToEmail(String email) { //getUserName
		connDB();
		String sql = "select username from t_address where email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String username = rs.getString("username");
				return username; //1개의 자료
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return email;
	}
	
}
