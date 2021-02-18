package ch04.com.dao;

import java.util.ArrayList;

public class GuGuDan {
	private int dan;
	private ArrayList<String> result = new ArrayList<String>();
	
	public void gugudan() {
		for(int i = 1; i<10; i++) { 
			 result.add(dan+"*"+i+"="+dan*i+"<br>");
			 }
		/*int i = 0;
		while(i < 10) {
			result.add(dan+"*"+i+"="+dan*i);
			i++;
		}*/
	}
	public void showResult() {
		for(String s : result) {
			System.out.println(s.replaceAll("<br>", ""));
		}

	}


	public int getDan() {
		return dan;
	}

	public void setDan(int dan) {
		this.dan = dan;
	}

	public ArrayList<String> getResult() {
		return result;
	}

	public void setResult(ArrayList<String> result) {
		this.result = result;
	}

	
}
