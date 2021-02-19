package ch04.com.dao;

import java.util.ArrayList;

public class GuGuDan {

	private ArrayList<String> result = new ArrayList<String>();
	
	public ArrayList<String> gugudan(int dan) {
		for(int i = 1; i<10; i++) { 
			 result.add(dan+"*"+i+"="+dan*i+"<br>");
		}
		return result;
	}
	
	public void showResult() {
		for(String s : result) {
			System.out.println(s.replaceAll("<br>", ""));
		}

	}

	public ArrayList<String> getResult() {
		return result;
	}

	public void setResult(ArrayList<String> result) {
		this.result = result;
	}

	
}
