package com.araniii.intern.repository.mapper;

import java.util.List;

import com.araniii.intern.repository.domain.Religion;
import com.araniii.intern.repository.domain.Staff;

public interface BoardMapper {

	public List<Religion> selectReligionList();
	public List<Staff> selectAllStaff(int begin);
	public int selectCntAllStaff();
}
