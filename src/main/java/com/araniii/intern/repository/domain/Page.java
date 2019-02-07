package com.araniii.intern.repository.domain;

public class Page {

	private int pageNo; //화면에서 사용자가 선택하는 페이지 번호
	private int begin;
	private int end;
	
	public int getBegin() {
		return (pageNo-1) * 5 + 1;
	}
	
	public int getEnd() {
		return pageNo * 5;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
//	public static void main(String[] args) {
//		junit 에서 테스트 해본다.
//	} //main
	
	
	
} //end class
