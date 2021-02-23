package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8"); //웹브라우저로 html형식으로 응답(전송)
		
		
		//출력클래스 사용
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("userid");
		String pwd = request.getParameter("passwd");
		String phone = request.getParameter("phone");
		
		String data = "<html><body>";
			data+="<p>아이디 : "+id;
			data+="<p>비밀번호 : "+pwd;
			data+="<p>폰번호 : "+phone;
			data+="</body></html>";
			
		out.println(data);
			/*
			 * out.println(id); out.println(pwd); out.println(phone);
			 */
	}

}
