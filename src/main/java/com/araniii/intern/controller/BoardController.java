package com.araniii.intern.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.araniii.intern.repository.domain.Staff;
import com.araniii.intern.service.BoardService;

@Controller
@RequestMapping("/intern")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("/search.do")
	public void goSearch(Model model) {
		model.addAttribute("religionList", service.getReligionList());
	}
	
	@RequestMapping("/searchAll.do")
	@ResponseBody
	public Map<String, Object> searchAll(
				@RequestParam(value="pageno", defaultValue = "1")int pageNo) {
		return service.searchAll(pageNo);
	}
	
	

	
} //end class
