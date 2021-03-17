package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/hello") - 방법1

/*
 * 	WebContent/WEB-INF/web.xml - 방법2
 	<servlet>
		<servlet-name>helloController</servlet-name> <!--그냥 별칭-->
		<servlet-class>com.controller.HelloController</servlet-class> <!--Java파일 위치-->
	</servlet>
	<servlet-mapping>
		<servlet-name>helloController</servlet-name>
		<url-pattern>/hello</url-pattern>
	</servlet-mapping>
 */
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		//model - 데이터 생성
		String message = "Hello~ MVC!";
		String[] name = {"김산","이강","정들"};
		
		//model - 저장 model이름 : msg
		requset.setAttribute("msg", message);
		requset.setAttribute("name", name);
		//					("변수선언", 데이터 쪽의 value 가져옴)
		
		//view -> 보내줌
		RequestDispatcher dispatcher = requset.getRequestDispatcher("hello.jsp");
		dispatcher.forward(requset, response);
	}
	
	
}
