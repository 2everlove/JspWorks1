package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvc02")
public class MVCServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
		if(request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
		} else if (request.getParameter("num") == null){
			num = 0;
		}
		String result = "";
		if(num%2 != 0)
			result = "홀수";
		else
			result = "짝수";
		
		//result를 저장 - request는 서버의 저장소
		request.setAttribute("result", result);
		
		//jsp로 데이터를 보냄(forwarding)
		RequestDispatcher dispatcher = request.getRequestDispatcher("mvc02.jsp");
		dispatcher.forward(request, response);
		//					저장해서 응답했다.
		
	}//method

}//class
