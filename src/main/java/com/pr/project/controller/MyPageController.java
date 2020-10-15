package com.pr.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pr.project.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService mps;
	
	//@RequestMapping("tab/tab1")
	//public String tab1() {
		
	//	return "tab/tab1";
	//}
	
	
	@RequestMapping("home_yj")
	public String home_yj() {
		
		return "home_yj";
	}
	
	@RequestMapping("myPageTab/memberLevelInfo")
	public String memberLevelInfo() {
		
		return "myPageTab/memberLevelInfo";
	}
	
	@RequestMapping("myPageTab/sendmessagePopup")
	public String sendmessagePopup() {
		
		return "myPageTab/sendmessagePopup";
	}
	
	@RequestMapping("myPageTab/userInfoUpdateForm")
	public String userInfoUpdateForm() {
		
		return "myPageTab/userInfoUpdateForm";
	}
}
