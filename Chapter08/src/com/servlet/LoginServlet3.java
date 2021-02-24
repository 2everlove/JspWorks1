package com.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class LoginServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet3() {
    	
	}

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("userid");
		String pwd = request.getParameter("passwd");
		String[] subject = request.getParameterValues("subject");
		
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : "+ pwd); 
		System.out.print("수강한 과목 : ");
		for(String subjects : subject) {
			System.out.print(subjects+" ");
		}
	}

}
