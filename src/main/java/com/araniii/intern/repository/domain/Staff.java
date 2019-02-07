package com.araniii.intern.repository.domain;

public class Staff {

	private int staffNo;
	private String staffName;
	private String juminNo;
	private int schoolCode;
	private int religionCode;
	private String graduateDay;

	
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getJuminNo() {
		return juminNo;
	}
	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}
	public int getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(int schoolCode) {
		this.schoolCode = schoolCode;
	}
	public int getReligionCode() {
		return religionCode;
	}
	public void setReligionCode(int religionCode) {
		this.religionCode = religionCode;
	}
	public String getGraduateDay() {
		return graduateDay;
	}
	public void setGraduateDay(String graduateDay) {
		this.graduateDay = graduateDay;
	}

	@Override
	public String toString() {
		return "Staff [staffNo=" + staffNo + ", staffName=" + staffName + ", juminNo=" + juminNo + ", schoolCode="
				+ schoolCode + ", religionCode=" + religionCode + ", graduateDay=" + graduateDay + "]";
	}
	
	
} //end class
