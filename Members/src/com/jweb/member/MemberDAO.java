package com.jweb.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
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
	
	//DB 연결 종료 - pstmt, conn 종료
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
	
	//회원 추가
	public void addMember(Member member) {
		connDB();
		String sql="insert into t_member(memberId, passwd, name, gender) VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
	}
	
	//회원 목록
	public ArrayList<Member> getListAll(){
		connDB();
		ArrayList<Member> memberList = new ArrayList<>();
		String sql="select * from t_member";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("memberId"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joinDate"));
				
				memberList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();
		}
		return memberList;
	}
	
	//회원 1명 출력하기 메서드
	public Member getOndDB(String memId) {
		connDB();
		Member member = new Member();
		
		//sql 처리 : select 일 경우 executeQuery();
		String sql="select * from t_member where memberId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			rs.next();
			member.setMemberId(rs.getString("memberId"));
			member.setPasswd(rs.getString("passwd"));
			member.setName(rs.getString("name"));
			member.setGender(rs.getString("gender"));
			member.setJoinDate(rs.getDate("joinDate"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();
		}
		return member;
	}
	
	//회원 삭제
	public void deleteMember(String memId){
		connDB();
		String sql="delete from t_member where memberId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			//실행 : insert, update, delete - executeUpdate()
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//회원 정보 수정
	public void updateMember(Member member) {
		connDB();
		String sql="update t_member set passwd = ?, name = ?, gender = ? where memberId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getMemberId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//회원 로그인 체크 = 아이디 일치:1, 비밀번호 일치:1, 아이디 불일치:0, 비밀번호 불일치:-1, 데이터베이스 오류:-2
	public int login(String memberId, String passwd) {
		connDB();
		String sql = "SELECT memberId, passwd FROM t_member WHERE memberId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) { //아이디가 일치
				String dbPw = rs.getString("passwd");
				if(dbPw.equals(passwd)){ //매개로 전달받은 비밀번호 변수 비교
					return 1; //비밀번호 일치
				} else {
					return -1;//비밀번호 불일치
				}
			} else {
				return 0; //아이디 불일치
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();
		}
		return -2; //데이터베이스 오류
	}
	
	//인증된 memberId의 이름 가져오는 메서드
		public String getLoginNameById(String memberId) {
			connDB();
			String sql="select * from t_member where memberId = ?";
			String name = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.execute();
				rs = pstmt.executeQuery();
				if(rs.next())
				 name = rs.getString("name");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnectRS();
			}
			return name;
		}//
	
	
}//class
