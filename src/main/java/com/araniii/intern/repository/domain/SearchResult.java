package com.araniii.intern.repository.domain;

import java.util.Date;
import java.util.List;

public class SearchResult {

	private String name;
	private String gender;
	private int religion;
	private List<Integer> school;
	private List<Integer> skill;
	private String year1;
	private String month1;
	private String day1;
	private String year2;
	private String month2;
	private String day2;
	private String date1;
	private String date2;
	private Date defaultDate1;
	private Date defaultDate2;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public int getReligion() {
		return religion;
	}
	public void setReligion(int religion) {
		this.religion = religion;
	}
	public List<Integer> getSchool() {
		return school;
	}
	public void setSchool(List<Integer> school) {
		this.school = school;
	}
	public List<Integer> getSkill() {
		return skill;
	}
	public void setSkill(List<Integer> skill) {
		this.skill = skill;
	}
	public String getYear1() {
		return year1;
	}
	public void setYear1(String year1) {
		this.year1 = year1;
	}
	public String getMonth1() {
		return month1;
	}
	public void setMonth1(String month1) {
		this.month1 = month1;
	}
	public String getDay1() {
		return day1;
	}
	public void setDay1(String day1) {
		this.day1 = day1;
	}
	public String getYear2() {
		return year2;
	}
	public void setYear2(String year2) {
		this.year2 = year2;
	}
	public String getMonth2() {
		return month2;
	}
	public void setMonth2(String month2) {
		this.month2 = month2;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
//	
	@Override
	public String toString() {
		return "SearchResult [name=" + name + ", gender=" + gender + ", religion=" + religion + ", school=" + school
				+ ", skill=" + skill + ", year1=" + year1 + ", month1=" + month1 + ", day1=" + day1 + ", year2=" + year2
				+ ", month2=" + month2 + ", day2=" + day2 + ", date1=" + date1 + ", date2=" + date2 + "]";
	}
	
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public Date getDefaultDate1() {
		return defaultDate1;
	}
	public void setDefaultDate1(Date defaultDate1) {
		this.defaultDate1 = defaultDate1;
	}
	public Date getDefaultDate2() {
		return defaultDate2;
	}
	public void setDefaultDate2(Date defaultDate2) {
		this.defaultDate2 = defaultDate2;
	}
	
	
	
	
} //end class
