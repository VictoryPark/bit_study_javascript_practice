package com.araniii.intern.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araniii.intern.common.PageResult;
import com.araniii.intern.repository.domain.SearchResult;
import com.araniii.intern.repository.domain.Staff;
import com.araniii.intern.repository.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public Map<String, Object> getReligionList() {
		Map<String, Object> map = new HashMap<>();
		map.put("religionList", mapper.selectReligionList());
		map.put("schoolList", mapper.selectSchoolList());
		map.put("skillList", mapper.selectSkillList());
		return map;
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

	@Override
	public Map<String, Object> searchByKey(SearchResult result) {
		Map<String, Object> map = new HashMap<>();
		
		result.setStartDate(result.getStartYear()+"-"+
							result.getStartMonth()+"-"+
							result.getStartDay());
		
		result.setEndDate(result.getEndYear()+"-"+
						  result.getEndMonth()+"-"+
						  result.getEndDay());
		System.out.println(result);
		List<Staff> list = mapper.selectStaffBySearch(result);
		for(Staff s : list) {
			if(s.getJuminNo().charAt(7) == '1') {
				s.setGender("남");
			} else {
				s.setGender("여");
			}
		}
		System.out.println("쿼리 후 : "+list);
		map.put("list", list);
		map.put("pageResult", new PageResult(result.getPageNo(), mapper.selectCntStaffBySearch(result)));
		System.out.println("count: "+ mapper.selectCntStaffBySearch(result));
		return map;
	}

	@Override
	public Staff searchByName(String name) {
		Staff s = mapper.selectStaffByName(name);
		System.out.println("staff: "+s);
		return mapper.selectStaffByName(name);
	} //searchByName
	
	

} //end class
