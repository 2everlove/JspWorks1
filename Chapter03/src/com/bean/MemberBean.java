package com.bean;

import java.io.Serializable;

public class MemberBean implements Serializable{
//	버전 아이디
	private static final long serialVersionUID = 12345;
	
	private int id = 2021100;
	private String name = "장그래";
	
//	default constructor 생략
	
	//get(), set()
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
