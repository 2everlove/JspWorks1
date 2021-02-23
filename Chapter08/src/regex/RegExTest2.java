package regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegExTest2 {

	public static void main(String[] args) {
		// 정규 표현식 연습하기
		String pattern = "^[0-9]*$"; //정규 표현식(패턴)
		String value = "abc2021"; //매칭 문자열
		String value2 = "2021"; //매칭 문자열
		
		boolean b = Pattern.matches(pattern, value); //false
		boolean b2 = Pattern.matches(pattern, value2); //true
		System.out.println(b);
		System.out.println(b2);
		System.out.println("==================");
		
		String name = "세종대왕";
		boolean name_check = Pattern.matches("^[가-힣]*$", name); //true
		System.out.println(name_check);
	}

}
