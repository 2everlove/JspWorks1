package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/data") // 메핑주소 - data
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로또 숫자 저장
		ArrayList<Integer> lotto = new ArrayList<>();
		/*
		 * int size = 6; Random rd = new Random();
		 * 
		 * for(int i=0;i<size;i++) { int a = Integer.parseInt(rd*80); lotto.add(); }
		 */
		lotto.add(15);
		lotto.add(77);
		lotto.add(45);
		lotto.add(34);
		lotto.add(9);
		lotto.add(18);
		
		//HashMap 자료
		Map<String, Object> car = new HashMap<>();
		car.put("brand", "Sonata"); //key, value
		car.put("cc", 3000);
		
		//model1 저장 : page < request < session < application
		request.setAttribute("lotto", lotto);
		request.setAttribute("car", car);
		
		//view로 forward
		RequestDispatcher dispatcher = request.getRequestDispatcher("data.jsp");
		dispatcher.forward(request, response);
	}

}
