package com.pr.project.service;

import com.pr.project.model.LoginIp;

public interface LoginIpService {
	LoginIp select(String i_id);
	int insert(LoginIp loginip);

}
