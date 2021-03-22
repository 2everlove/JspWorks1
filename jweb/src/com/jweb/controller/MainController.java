package com.jweb.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jweb.board.Board;
import com.jweb.board.BoardDAO;
import com.jweb.member.Member;
import com.jweb.member.MemberDAO;

@WebServlet("*.do") //do 확장자인 모든 파일에 매핑
public class MainController extends HttpServlet{
	private static final long serialVersionUID = 100;
	MemberDAO memberDAO;
	BoardDAO boardDAO;
	
	@Override
	public void init() throws ServletException { //초기화 - init에 instance를 생성안하면 필요할때마다 계속 생성해야함 -> init에 공통 모듈 넣자
		memberDAO = new MemberDAO(); //memberDAO 객체 생성
		boardDAO = new BoardDAO(); //boardDAO 객체 생성
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response); // ?memberId = river(get방식이므로 get방식을 서버에서 사용하려면 doGet() 필요함)
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//클라이언트의 요청 path 정보 추출
		String uri = request.getRequestURI();
		System.out.println("URI : "+uri);
		String command = uri.substring(uri.lastIndexOf("/")); // path
		System.out.println("uri.lastIndexOf('/') : "+uri.lastIndexOf("/"));
		System.out.println("Path : "+command);
		/* request.getContextPath().lastIndexOf("/"); */
		String nextPage = null;
		
		if(command.equals("/memberForm.do")) {
			nextPage = "/memberForm.jsp";
		} else if(command.equals("/memberAdd.do")) {
			//폼 입력자료 수집
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			//Member 객체에 set()
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPasswd(passwd);
			member.setName(name);
			member.setGender(gender);
			
			//dao - inset
			memberDAO.addMember(member);
			
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", memberId);
			
			//model인 member 저장
			request.setAttribute("member", member);
			request.setAttribute("msg", "join");
			
			//view
			nextPage = "/memberResult.jsp";
		} else if (command.equals("/loginForm.do")) {
			nextPage = "/loginForm.jsp";
		} else if (command.equals("/loginProcess.do")) {
			//폼에 입력된 자료 수집
			String id = request.getParameter("memberId");
			String pwd = request.getParameter("passwd");
			/*
			 * String name = request.getParameter("name"); String gender =
			 * request.getParameter("gender");
			 */
			
			//dao - loginCheck()호출
			memberDAO.login(id, pwd);
			int loginResult = memberDAO.login(id, pwd);
			String name = memberDAO.getLoginNameById(id);
			
			//아이디 비번 일치하면 세션 발급
			if(loginResult==1) {
				HttpSession session = request.getSession();
				session.setAttribute("sessionId", id);
				session.setAttribute("name", name);
				
				request.setAttribute("msg", "login");
			}
			//model and view
			request.setAttribute("loginResult", loginResult);
			/* request.setAttribute("name", name); */
			/* nextPage = "/menu.jsp"; */
			nextPage = "/memberResult.jsp";
		} else if (command.equals("/logout.do")) {
			//세션해제
			HttpSession session = request.getSession();
			session.invalidate();
			nextPage = "/main.jsp";
		} else if(command.equals("/memberView.do")) { //회원 정보 요청
			
			//1명 회원 가져오기
			HttpSession session = request.getSession();
			String sessionId = (String) session.getAttribute("sessionId");
			
			//dao - getOneDB()
			Member member = memberDAO.getOndDB(sessionId);
			int boardNum = boardDAO.getOneBoardList(member.getMemberId()).size();
			
			//model and view
			request.setAttribute("member", member);
			request.setAttribute("boardNum", boardNum);	
			
			
			nextPage = "/memberView.jsp";
		} else if(command.equals("/memberUpdate.do")) {
			//폼의 데이터 수집
			String memberId = request.getParameter("memberId");
			String pwd = request.getParameter("passwd");
			String name = request.getParameter("name"); 
			String gender =	request.getParameter("gender");
			
			//member 객체 생성 - set()
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPasswd(pwd);
			member.setName(name);
			member.setGender(gender);
			
			//dao - updateMember()
			memberDAO.updateMember(member);
			
			//model and view
			request.setAttribute("member", member);
			request.setAttribute("msg", "update");
			nextPage = "/memberResult.jsp";
		} else if(command.equals("/memberDelete.do")) {
			//쿼리 문자열 받기
			String memberId = request.getParameter("memberId");
			
			//dao - deleteMember() 호출
			memberDAO.deleteMember(memberId);
			
			//삭제 후 로그아웃
			HttpSession session = request.getSession();
			session.invalidate();
			
			//model and view
			request.setAttribute("msg", "delete");
			
			nextPage = "/memberResult.jsp"; //이걸 안하면 request쪽에 null이 뜸 (doGet, dispatcher.foward())
		} else if(command.equals("/boardList.do")) {
			//dao - getListAll() 호출
			ArrayList<Board> boardList = boardDAO.getBoardList();
			
			//model and view
			request.setAttribute("boardList", boardList);
			nextPage = "/boardList.jsp";
		} else if(command.equals("/boardWriteForm.do")) {
			nextPage = "/boardWriteForm.jsp";
		} else if(command.equals("/boardWriteAdd.do")) {
			//폼 입력 자료 수집
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			//세션 아이디 발급
			HttpSession session = request.getSession();
			String sessionId = (String) session.getAttribute("sessionId");
			
			//Board 객체에서 set
			Board board = new Board();
			board.setTitle(title);
			board.setContent(content);
			board.setMemberId(sessionId);
			
			boardDAO.insertBoard(board);
			
			request.setAttribute("board", board);
			nextPage = "/boardList.do";
		} else if(command.equals("/boardDelete.do")) {
			//bnum 받기
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			//dao - deleteBoard() 호출
			boardDAO.deleteBoard(bnum);
			
			//model and view
			nextPage = "/boardList.do";
		} else if(command.equals("/boardView.do")) {
			// 쿼리 받기 - bnum
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			//dao - 조회수 호출
			boardDAO.updateHit(bnum);
			
			//dao - getOneDb()를 Board 객체에 넣기
			Board board = boardDAO.getOneBoard(bnum);
			Member member = memberDAO.getOndDB(board.getMemberId());
			
			//view and model
			request.setAttribute("board", board);
			request.setAttribute("member", member);
			nextPage = "/boardView.jsp";
		} else if(command.equals("/boardUpdate.do")) {
			//폼의 입력자료 수집
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			//board 객체 생성
			Board board = new Board();
			board.setTitle(title);
			board.setContent(content);
			board.setBnum(bnum);
			
			
			//dao - update
			boardDAO.updateBoard(board);
			
			
			//view and model
			request.setAttribute("board", board);
			request.setAttribute("alert", "update");
			nextPage = "/boardList.do";
		} else if(command.equals("/boardListOne.do")) {
			String memberId = request.getParameter("memberId");
			
			//dao - getListAll() 호출
			ArrayList<Board> boardList = boardDAO.getOneBoardList(memberId);
			
			//model and view
			request.setAttribute("boardListOne", boardList);
			nextPage = "/boardListOne.jsp";
		}
		
		//forwading -> view로 보내기
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
		
	}//doPost()
	
}//class
