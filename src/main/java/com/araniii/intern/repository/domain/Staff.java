package com.araniii.intern.repository.domain;

import lombok.Data;

@Data
public class Staff {
	
	private int staffNo;
	private String staffName;
	private String juminNo;
	private String gender;
	private int schoolCode;
	private int religionCode;
	private String graduateDay;
	private String religionName;
	
	//페이징 위한 필드
	private int pageNo;
	
	public int getBegin() {
		//페이지당 나오는 listsize 는 5개..
		return (pageNo-1) * 5;
	}
	
}
