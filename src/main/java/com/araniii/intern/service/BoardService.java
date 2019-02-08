package com.araniii.intern.service;

import java.util.List;

import com.araniii.intern.repository.domain.Religion;
import com.araniii.intern.repository.domain.Staff;

public interface BoardService {

	List<Religion> getReligionList();

	List<Staff> searchAll();

}
