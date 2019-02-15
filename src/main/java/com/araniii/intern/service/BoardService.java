package com.araniii.intern.service;

import java.util.List;
import java.util.Map;

import com.araniii.intern.repository.domain.Religion;
import com.araniii.intern.repository.domain.SearchResult;
import com.araniii.intern.repository.domain.Staff;

public interface BoardService {

	Map<String, Object> getReligionList();

	Map<String, Object> searchAll(int pageNo);

	Map<String, Object> searchByKey(SearchResult result);

}
