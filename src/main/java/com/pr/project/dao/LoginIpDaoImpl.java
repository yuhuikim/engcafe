package com.pr.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pr.project.model.LoginIp;

@Repository
public class LoginIpDaoImpl implements LoginIpDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public LoginIp select(String i_id) {
		return sst.selectOne("loginip.select", i_id);
	}

	@Override
	public int insert(LoginIp loginip) {
		return sst.insert("loginip.insert",loginip);
	}
}
