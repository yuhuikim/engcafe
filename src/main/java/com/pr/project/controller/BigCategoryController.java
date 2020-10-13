package com.pr.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pr.project.model.BigCategory;
import com.pr.project.service.BigCategoryService;
import com.pr.project.service.BoardService;

@Controller
public class BigCategoryController {
	@Autowired
	private BigCategoryService bcs;
	
	@RequestMapping("/board/insertBigCategory")
	public String insert(BigCategory bigCategory, Model model) {

		int result = bcs.insert(bigCategory);
		return "/board/insert";
	}	
}
