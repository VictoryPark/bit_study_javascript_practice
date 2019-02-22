package com.araniii.intern.repository.domain;

import java.util.List;

import lombok.Data;

@Data
public class SearchResult {

	private String name;
	private List<Integer> gender;
	private int religion;
	private List<Integer> skill;
	private List<Integer> school;
	
	private String startYear;
	private String startMonth;
	private String startDay;
	private String endYear;
	private String endMonth;
	private String endDay;
	
	private String startDate;
	private String endDate;
	
	private int pageNo;
	
	public int getBegin() {
		//페이지당 나오는 listsize 는 5개..
		return (pageNo-1) * 5;
	}
	
} //end class
