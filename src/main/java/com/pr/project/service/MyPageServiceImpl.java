package com.pr.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pr.project.dao.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDao mpd;
}
