package com.pr.project.dao;

import com.pr.project.model.LoginIp;

public interface LoginIpDao {

	LoginIp select(String i_id);

	int insert(LoginIp loginip);

}
