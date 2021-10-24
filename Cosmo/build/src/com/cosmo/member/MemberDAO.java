package com.cosmo.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private static String driverClass = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3307:";
	private static String username = "jweb";
	private static String password = "4321";
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private ResultSet rs;
	
	private void connDB() {
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.getMessage();
		}
	}
	
	private void disconect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.getMessage();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
