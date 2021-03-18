package com.jweb.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
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
	}//
	
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
	}//
	
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
	}//
	
	//새 글 추가
	public void insertBoard(Board board) {
		connDB();
		String sql="insert into t_board (bnum, title, content, memberId) values (bSeq.NEXTVAL ,? ,? , ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getMemberId());
			//실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}//
	
	//게시글 전체 목록 출력 메서드
	public ArrayList<Board> getListAll(){
		connDB();
		ArrayList<Board> boardList = new ArrayList<>();
		String sql = "select * from t_board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getDate("regDate"));
				board.setHit(rs.getInt("hit"));
				board.setMemberId(rs.getString("memberId"));
				//ArrayList에 board 담기
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();;
		}
		return boardList;
	}//
	
	//게시판 목록 보기
	public ArrayList<Board> getBoardList() {
		connDB();
		ArrayList<Board> boardList = new ArrayList<>();
		String sql = "select * from t_board order by bnum desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getDate("regDate"));
				board.setHit(rs.getInt("hit"));
				board.setMemberId(rs.getString("memberId"));
				
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();
		}
		
		return boardList;
	}//
	
	//게시판 상세보기
	public Board getOneBoard(int bnum) {
		connDB();
		Board board = new Board();
		String sql="select * from t_board where bnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			//쿼리 실행
			rs = pstmt.executeQuery();
			rs.next(); //1명이 있음
			board.setBnum(rs.getInt("bnum"));
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
			board.setRegDate(rs.getDate("regDate"));
			board.setHit(rs.getInt("hit"));
			board.setMemberId(rs.getString("memberId"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();;
		}
		return board;
	}//
	
	//게시판 특정대상 목록 보기
		public ArrayList<Board> getOneBoardList(String memberId) {
			connDB();
			ArrayList<Board> boardList = new ArrayList<>();
			String sql = "select * from t_board where memberId = ? order by bnum desc";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Board board = new Board();
					board.setBnum(rs.getInt("bnum"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegDate(rs.getDate("regDate"));
					board.setHit(rs.getInt("hit"));
					board.setMemberId(rs.getString("memberId"));
					
					boardList.add(board);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnectRS();
			}
			
			return boardList;
		}//
		
	//게시글 삭제
	public void deleteBoard(int bnum) {
		connDB();
		String sql="delete from t_board where bnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			//쿼리 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}//
	
	//게시글 정보 수정 - 수정 -> 가입한다고 생각(insert랑 비슷)
	public void updateBoard(Board board) {
		connDB();
		String sql="update t_board set title = ?, content = ? where bnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBnum());
			
			//update, delete 일땐 executeUpdate();
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}		
	}//
	
	//조회수 1 증가
	public void updateHit(int bnum) {
		connDB();
		String sql ="select * from t_board where bnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum); //바이딩(세팅)
			//쿼리실행
			rs = pstmt.executeQuery();
			int hit = 0;
			if(rs.next()) { //조회수 1증가
				hit = rs.getInt("hit") + 1;
			}
			//update
			sql = "update t_board set hit = ? where bnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, bnum);
			//쿼리 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//
		
}//class 닫기
