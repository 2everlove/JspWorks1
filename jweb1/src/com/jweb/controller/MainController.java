package com.jweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jweb.board.BoardDAO;
import com.jweb.member.Member;
import com.jweb.member.MemberDAO;

@WebServlet("/*.do") //do 확장자인 모든 파일에 매핑
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
		response.setContentType("text/html; charset='utf-8'");
		
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
		}
		
		//forwading -> view로 보내기
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
		
	}//doPost()
}//class
