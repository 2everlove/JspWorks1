package p0302;

import java.util.Scanner;

public class Ex0302_01 {

	public static void main(String[] args) {
		//3명의 이름,국어점수,영어점수,수학점수를 입력받아
		// 출력하는 프로그램을 만들어보세요. 합계,평균(소수점)
		// 홍길동 100 100 99 299
		// 이순신 98 97 99
		// 유관순 100 100 100
		Scanner sc = new Scanner(System.in);
		String[] title= {"국어","영어","수학" };
		String[] name = new String[10];
		int[][] num = new int[10][4]; //국어,영어,수학,합계
		double[] avg = new double[10];
		int[] rank = new int[10]; //등수저장배열
		int sum=0;
		int Stu_count=0; //성적입력수
		
		loop1:while(true) {
			System.out.println("[ 성적처리 프로그램 ]");
			System.out.println("1.성적입력");
			System.out.println("2.성적출력");
			System.out.println("3.성적수정");
			System.out.println("4.등수처리");
			System.out.println("5.프로그램 종료");
			System.out.println("----------------");
			System.out.println("원하는 번호를 입력하세요.>>");
			int choice = sc.nextInt();
			sc.nextLine();
			switch (choice) {
			case 1:
				System.out.println("성적을 입력합니다.");
				for(int i=Stu_count;i<num.length;i++) {
					sum=0; //초기화
					System.out.println("이름을 입력하세요.(0.이전화면으로 이동) >>");
					String chk = sc.nextLine(); // 홍 길동(enter)
					if(chk.equals("0")) { //이전화면 체크
						System.out.println("이전화면으로 이동합니다.!!");
						break;
					}
					
					name[i] = chk;
					int arrNum=0;
					for(int j=0;j<num[i].length-1;j++) {
						System.out.println(title[arrNum]+" 점수를 입력하세요.>>");
						num[i][j] = sc.nextInt(); //100 enter키
						sum = sum + num[i][j];
						arrNum++;
					}
					num[i][3] = sum; //배열 4번째에 합계 저장
					avg[i] = sum/3.0;
					Stu_count++;
					sc.nextLine();
				}
				
				break;
			case 2:
				System.out.println("성적을 출력합니다.");
				for(int i=0;i<num.length;i++) {
					System.out.print(name[i]+"\t");
					for(int j=0;j<num[i].length;j++) {
						System.out.print(num[i][j]+"\t");
					}
					System.out.printf("%.2f \t",avg[i]);
					System.out.print(rank[i]);
					System.out.println();
				}
				
				
				break;
			case 3:
				System.out.println("성적을 수정합니다.");
				
				
				
				
				break;
			case 4:
				System.out.println("등수 처리를 합니다.");
				//등수처리
				for(int i=0;i<rank.length;i++) {
					int count=1;
					for(int j=0;j<rank.length;j++) {
						if(num[i][3]<num[j][3]) {
							count++;
						}
					}
					rank[i]=count; //등수입력
				}
				break;
			case 5:
				
				break loop1;
			}//switch;
			
		}//while
		
		
	}//main
}//class
