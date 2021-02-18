package ch04.com.dao;

public class GuGuDan2 {
	public String gugudan(int dan) {
		String result="";
		/*
		 * for(int i=1;i<10;i++) { result+= dan+"*"+i+"="+(dan*i)+"<br>"; }
		 */
		int j=1;
		while(j<10) {
			result+= dan+"*"+j+"="+(dan*j)+"<br>";
			j++;
		}
		return result;
	}
	
}
