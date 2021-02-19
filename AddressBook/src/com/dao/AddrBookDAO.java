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
}
