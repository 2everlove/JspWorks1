package com.jweb.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
	
	//페이징 처리된 목록 출력 메서드
	public ArrayList<Board> getBoardList(String field, String text, int page){
		connDB();
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "select * from("
				+ "SELECT ROWNUM num, board.* "
				+ "FROM (SELECT * FROM t_board WHERE " + field + " LIKE ? "
				+ "ORDER BY regdate DESC) board"
				+ ") "
				+ "WHERE num BETWEEN ? AND ?";
		//title(memberId) Like "%a%"
		//레코드 시작 수 : 1, 11, 21, 31 ->1+(page-1)*10
		//레코드 끝 수 = 10, 20 30 -> (page)*10
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+text+"%");
			pstmt.setInt(2, 1+(page-1)*10);
			pstmt.setInt(3, page*10);
			//쿼리 실행
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date regDate = rs.getDate("regDate");
				int hit = rs.getInt("hit");
				String memberId = rs.getString("memberId");
				
				Board board = new Board();
				board.setBnum(bnum);
				board.setTitle(title);
				board.setContent(content);
				board.setRegDate(regDate);
				board.setHit(hit);
				board.setMemberId(memberId);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectRS();
		}
		return list;
	}//
	
	/*//게시글 전체 목록 출력 메서드
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
	}//*/
	
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
