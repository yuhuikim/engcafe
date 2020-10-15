package com.pr.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pr.project.model.Reply;
import com.pr.project.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;
	
	@RequestMapping("replyForm")
	public String replyForm(int r_ref, Model model) {
		model.addAttribute("r_ref", r_ref);
		return "/reply/replyForm";
	}
	
	@RequestMapping("insertReply")
	public String insert(Reply reply, Model model, HttpServletRequest request) {
		reply.setR_ip(request.getLocalAddr());	
		int rnum = rs.maxNum()+1;
		if(reply.getR_num()==reply.getR_ref()) {
			reply.setR_num(rnum);
			reply.setR_ref(rnum);
			reply.setR_level(0);
			reply.setR_step(rs.selectMaxStep(reply.getR_b_num())+1);
		} else { // 답변
			reply.setR_num(rnum);
			reply.setR_level(rs.selectLevel(reply.getR_ref())+1);
			int step = rs.selectStep(reply.getR_ref());
			reply.setR_step(step+1);
			rs.updateStep(reply);
		}
		rs.insert(reply);
		model.addAttribute("r_b_num", reply.getR_b_num());
		return "redirect:replyList?r_b_num="+reply.getR_b_num();
	}
	
	@RequestMapping("updateReply")
	public String update(String r_content, int r_b_num, int r_num, Model model) {
		System.out.println("r_b_num="+r_b_num);
		System.out.println("r_num="+r_num);
		Reply reply = new Reply();
		reply.setR_num(r_num);
		reply.setR_content(r_content);
		rs.update(reply);
		return "redirect:replyList?r_b_num="+r_b_num;
	}
	
	@RequestMapping("deleteReply")
	public String delete(int r_b_num, int r_num, Model model) {
		rs.delete(r_num);
		return "redirect:replyList?r_b_num="+r_b_num;
	}

	@RequestMapping("replyList")
	public String list(int r_b_num, Model model) {
		List<Reply> replyList = rs.list(r_b_num);
		model.addAttribute("replyList", replyList);
		return "/reply/replyView";
	}
}
