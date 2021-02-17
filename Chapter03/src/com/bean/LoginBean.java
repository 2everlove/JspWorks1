package com.bean;

import java.io.Serializable;

public class LoginBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String userid;
	private String psw;
	
	final String uid = "myuser";
	final String pwd = "12345";
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public boolean checkUser() {
		if(userid.equals(uid)&&psw.equals(pwd))
			return true;
		else 
			return false;
	}

}
