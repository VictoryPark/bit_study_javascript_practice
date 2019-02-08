package com.araniii.intern.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araniii.intern.repository.domain.Religion;
import com.araniii.intern.repository.domain.Staff;
import com.araniii.intern.repository.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<Religion> getReligionList() {
		return mapper.selectReligionList();
	}

	@Override
	public List<Staff> searchAll() {
		List<Staff> list = mapper.selectAllStaff();
		
		for(Staff s : list) {
			if(s.getJuminNo().charAt(7) == '1') {
				s.setGender("남");
			} else {
				s.setGender("여");
			}
		}
		return list;
	}

}
