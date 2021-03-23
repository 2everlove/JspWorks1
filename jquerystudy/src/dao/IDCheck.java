package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idcheck")
public class IDCheck extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//ajax쪽에서 보내온 id 받기
		String id = request.getParameter("id");
		
		//dao - 중복 메서드 호출
		MemberDAO2 memberDAO = new MemberDAO2();
		boolean duplicatedID = memberDAO.duplicatedID(id);
		System.out.println(duplicatedID);
		
		//결과를 메시지로 전송
		if(duplicatedID==true) {
			out.print("not_usable");
		} else {
			out.print("usable");
		}
		
	}
	
	

}
