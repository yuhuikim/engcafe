package com.pr.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pr.project.dao.BigCategoryDao;
import com.pr.project.model.BigCategory;

@Service
public class BigCategoryServiceImpl implements BigCategoryService {
	@Autowired
	private BigCategoryDao bcd;

	@Override
	public int insert(BigCategory bigCategory) {
		return bcd.insert(bigCategory);
	}
}
