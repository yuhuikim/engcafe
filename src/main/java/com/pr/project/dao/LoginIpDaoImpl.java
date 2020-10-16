package com.pr.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.User;

@Repository
public class LoginIpDaoImpl implements LoginIpDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public User select(String i_id) {
		return sst.selectOne("loginip.select", i_id);
	}
}
