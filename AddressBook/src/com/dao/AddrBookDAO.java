package com.dao;

import java.util.ArrayList;

public class AddrBookDAO{
	private ArrayList<AddrBook> addrList= new ArrayList<>();
	
	//주소 추가
	public void addAddress(AddrBook addrBook) {
		addrList.add(addrBook);
	}
	
	//주소 목록(전체)
	public ArrayList<AddrBook> getListAll(){
		return addrList;
	}
	
//	주소 삭제
	public void removeAddress(String username) {
		for(int i=0; i<addrList.size(); i++) {
			AddrBook addrBook = addrList.get(i);
			String dbUser = addrBook.getUsername();
			if (dbUser.equals(username)) {
				addrList.remove(i);
			}
		}
	}
	
	//주소 보기
	public AddrBook showAddress(String username) {
		AddrBook addrBook = null;
		for(int i=0; i<addrList.size();i++) {
			addrBook = addrList.get(i);
			String dbUser = addrBook.getUsername();
			if(dbUser.equals(username)) {
				return addrBook;
			}
		}
		return addrBook;
	}
	
	//주소보기 - 선생님이 하시는 것
	public AddrBook getAbByUserName(String username) {
		AddrBook getAbByUsername = null;
		for(int i=0; i<addrList.size();i++) {
			AddrBook ab = addrList.get(i);
			String dbUser = ab.getUsername();
			if(dbUser.equals(username)) {
				return getAbByUsername = ab;
				/* break; 바로 리턴해서 필요없음 */
			}
		}
		return getAbByUsername;
	}
	
}
