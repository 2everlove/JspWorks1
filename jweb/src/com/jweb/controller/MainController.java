package com.jweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jweb.board.BoardDAO;
import com.jweb.member.Member;
import com.jweb.member.MemberDAO;

@WebServlet("*.do") //do 확장자인 모든 파일에 매핑
public class MainController extends HttpServlet{
	private static final long serialVersionUID = 100;
	MemberDAO memberDAO;
	BoardDAO boardDAO;
	
	@Override
	public void init() throws ServletException { //초기화
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
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//클라이언트의 요청 path 정보 추출
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/")); // path
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
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			//dao - loginCheck()호출
			memberDAO.login(id, pwd);
			int loginResult = memberDAO.login(id, pwd);
			
			//아이디 비번 일치하면 세션 발급
			if(loginResult==1) {
				HttpSession session = request.getSession();
				session.setAttribute("sessionId", id);
				request.setAttribute("msg", "login");
			}
			
			//model and view
			request.setAttribute("loginResult", loginResult);
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
		}
		
		//forwading -> view로 보내기
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
		
	}//doPost()
}//class
