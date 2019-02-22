package com.araniii.intern.repository.mapper;

import java.util.List;

import com.araniii.intern.repository.domain.Religion;
import com.araniii.intern.repository.domain.School;
import com.araniii.intern.repository.domain.SearchResult;
import com.araniii.intern.repository.domain.Skill;
import com.araniii.intern.repository.domain.Staff;

public interface BoardMapper {

	public List<Religion> selectReligionList();
	public List<School> selectSchoolList();
	public List<Skill> selectSkillList();
	public List<Staff> selectAllStaff(int begin);
	public int selectCntAllStaff();
	public List<Staff> selectStaffBySearch(SearchResult result);
	public int selectCntStaffBySearch(SearchResult result);
	public Staff selectStaffByName(String name);
}
