package com.pr.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.BigCategory;

@Repository
public class BigCategoryDaoImpl implements BigCategoryDao {
	@Autowired // mybatis 연결
	private SqlSessionTemplate sst;

	@Override
	public int insert(BigCategory bigCategory) {
		return sst.insert("bigCategoryns.insert", bigCategory); 
	}
}
