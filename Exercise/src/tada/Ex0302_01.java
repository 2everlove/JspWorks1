package p0302;

import java.util.Scanner;

public class Ex0302_01 {

	public static void main(String[] args) {
		//3���� �̸�,��������,��������,���������� �Է¹޾�
		// ����ϴ� ���α׷��� ��������. �հ�,���(�Ҽ���)
		// ȫ�浿 100 100 99 299
		// �̼��� 98 97 99
		// ������ 100 100 100
		Scanner sc = new Scanner(System.in);
		String[] title= {"����","����","����" };
		String[] name = new String[10];
		int[][] num = new int[10][4]; //����,����,����,�հ�
		double[] avg = new double[10];
		int[] rank = new int[10]; //�������迭
		int sum=0;
		int Stu_count=0; //�����Է¼�
		
		loop1:while(true) {
			System.out.println("[ ����ó�� ���α׷� ]");
			System.out.println("1.�����Է�");
			System.out.println("2.�������");
			System.out.println("3.��������");
			System.out.println("4.���ó��");
			System.out.println("5.���α׷� ����");
			System.out.println("----------------");
			System.out.println("���ϴ� ��ȣ�� �Է��ϼ���.>>");
			int choice = sc.nextInt();
			sc.nextLine();
			switch (choice) {
			case 1:
				System.out.println("������ �Է��մϴ�.");
				for(int i=Stu_count;i<num.length;i++) {
					sum=0; //�ʱ�ȭ
					System.out.println("�̸��� �Է��ϼ���.(0.����ȭ������ �̵�) >>");
					String chk = sc.nextLine(); // ȫ �浿(enter)
					if(chk.equals("0")) { //����ȭ�� üũ
						System.out.println("����ȭ������ �̵��մϴ�.!!");
						break;
					}
					
					name[i] = chk;
					int arrNum=0;
					for(int j=0;j<num[i].length-1;j++) {
						System.out.println(title[arrNum]+" ������ �Է��ϼ���.>>");
						num[i][j] = sc.nextInt(); //100 enterŰ
						sum = sum + num[i][j];
						arrNum++;
					}
					num[i][3] = sum; //�迭 4��°�� �հ� ����
					avg[i] = sum/3.0;
					Stu_count++;
					sc.nextLine();
				}
				
				break;
			case 2:
				System.out.println("������ ����մϴ�.");
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
				System.out.println("������ �����մϴ�.");
				
				
				
				
				break;
			case 4:
				System.out.println("��� ó���� �մϴ�.");
				//���ó��
				for(int i=0;i<rank.length;i++) {
					int count=1;
					for(int j=0;j<rank.length;j++) {
						if(num[i][3]<num[j][3]) {
							count++;
						}
					}
					rank[i]=count; //����Է�
				}
				break;
			case 5:
				
				break loop1;
			}//switch;
			
		}//while
		
		
	}//main
}//class
