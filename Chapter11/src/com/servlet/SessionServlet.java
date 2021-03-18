package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sess")
public class SessionServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//세션 발급 - getSession()으ㅜㄹ 호출하여 세션이 없으면 새로 생성, 있으면 기존 세션을 가져옴
		HttpSession session = request.getSession();
		
		out.println("세션 아이디 : "+session.getId() +"<br>");
		out.println("최초 세션 생성 시작 : "+ new Date(session.getCreationTime())+"<br>");
		out.println("세션 유효 시간 : "+session.getMaxInactiveInterval()+"<br>");
		
		if(session.isNew()){
			out.println("새 세션이 만들어졌습니다.");
		}
	}

	
	
}
