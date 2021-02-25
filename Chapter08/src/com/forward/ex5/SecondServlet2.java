package com.forward.ex5;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dir/second")
public class SecondServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SecondServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		
		out.println("<html><style>*{box-sizing:box-sizing; background-color:black; color:white;}</style><body>");
		out.println("이름 : "+name+"<br>");
		out.println("RequestDispatcher를 이용한 forward 실습입니다.");
		out.println("</body></html>");
	}

}
