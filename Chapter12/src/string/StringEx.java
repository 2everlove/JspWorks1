package string;

public class StringEx {

	public static void main(String[] args) {
		//substring() - 지정된 index의 위치에서 부터 자른 return String
		String str = "unhappy";
		String str2 = str.substring(2); //happy
		System.out.println(str2);
		
		str = "hamburger".substring(4,8);; //urge
		System.out.println(str);
		
		//indexOf() - 앞에서 찾아서 return int 
		String folder = "C://upload";
		int idx = folder.indexOf("/"); // 2
		System.out.println(idx); 
		//업로드만 추출
		String location = folder.substring(idx+2); // upload
		System.out.println(location);
		
		//lastOfIndex() - 뒤에서 찾아서 return int 
		String url = "http://www.jweb.com/member/memberForm.jsp";
		int lastIndex = url.lastIndexOf("/"); //26
		System.out.println(lastIndex); 
		String path = url.substring(lastIndex+1); //memberForm.jsp
		System.out.println(path);
		
	}//main

}//class
