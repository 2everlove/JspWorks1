package ajaxtest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax2") // 요청 매핑 주소 : ajax2
public class AjaxTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //보내니깐 response
		
		//xml 데이터 만들기
		String result = "";
		result =  "<main><book>"+
					"<title><![CDATA[<b>JSP 웹 프로그래밍</b>]]></title>"+
					"<writer><![CDATA[저자: 송미영]]></writer>"+
					"</book></main>"; //CDATA = 파싱하지 않는 문자데이터, 즉 tag도 포함해서 전송
		out.print(result); //browser에 result 보냄
		System.out.println(result);
	}
	
	

}
