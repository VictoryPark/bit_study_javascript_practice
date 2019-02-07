package com.araniii.intern.repository.domain;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//@Data
public class RegisterResult {

	private int staffNo;
	private int staffSkillNo;
	private String name;
	private String birth;
	private String secret;
	private String juminNo;
	private int religion;
	private int school;
	private List<Integer> skill;
	private String year;
	private String month;
	private String day;
	private Date graduateDay;
	

	
	
} //end class
