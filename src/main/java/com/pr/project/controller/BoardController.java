package com.pr.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pr.project.model.Board;
import com.pr.project.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	@RequestMapping("/board/list")
	public String list(Model model) {
		List<Board> list = bs.list();
		model.addAttribute("list", list);
		return "/board/list";
	}

}
