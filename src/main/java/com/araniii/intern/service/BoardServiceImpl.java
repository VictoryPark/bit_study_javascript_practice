package com.araniii.intern.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araniii.intern.common.PageResult;
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
	public Map<String, Object> searchAll(int pageNo) {
		Map<String, Object> map = new HashMap<>();
		List<Staff> list = mapper.selectAllStaff((pageNo-1)*5);
		
		for(Staff s : list) {
			if(s.getJuminNo().charAt(7) == '1') {
				s.setGender("남");
			} else {
				s.setGender("여");
			}
		}
		
		map.put("list", list);
		map.put("pageResult", new PageResult(pageNo, mapper.selectCntAllStaff()));
		return map;
	} //searchAll
	
	

} //end class
