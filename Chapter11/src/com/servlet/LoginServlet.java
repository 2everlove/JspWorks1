package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		if(id.equals("korea") && pwd.equals("2021")) {
			session.setAttribute("userId", id);
			out.println(id+"님이 로그인 되었습니다");
		} else {
			
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			
		}
			
	}
	

}
