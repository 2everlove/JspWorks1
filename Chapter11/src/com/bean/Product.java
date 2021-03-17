package com.bean;

import javax.servlet.jsp.PageContext;

public class Product {
	private String[] list = {"귤","사과","포도","토마토"};
	private int num1 = 10;
	private int num2 = 20;

	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String[] getList() {
		return list;
	}
	public void setList(String[] list) {
		this.list = list;
	}
	
	
}//
