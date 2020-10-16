package com.pr.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pr.project.dao.LoginIpDao;
import com.pr.project.dao.UserDao;
import com.pr.project.model.User;

@Service
public class LoginIpServiceImpl implements LoginIpService{
	@Autowired
	private LoginIpDao ld; // repository로 만들어진 객체가 autowired를 통해서 여기로 쏙 들어간다!

	@Override
	public User select(String i_id) {
		return ld.select(i_id);
	}

}
