package com.pr.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pr.project.model.Reply;
import com.pr.project.service.ReplyService;

@Controller
public class GuestBookController {
	@Autowired
	private ReplyService rs;
	
	@RequestMapping("guestBookForm.html")
	public String replyForm(int r_ref, Model model) {
		model.addAttribute("r_ref", r_ref);
		return "/board/guestBookForm";
	}
	
	@RequestMapping("insertGuestBook.html")
	public String insert(Reply reply, Model model, HttpServletRequest request) {
		reply.setR_ip(request.getLocalAddr());	
		int rnum = rs.maxNum()+1;
		if(reply.getR_num()==reply.getR_ref()) { //참조값 없을 때
			reply.setR_num(rnum);
			reply.setR_ref(rnum);
			reply.setR_origin(rnum);
			reply.setR_level(0);
			reply.setR_step(rs.selectMaxStep(reply.getR_b_num())+1);
		} else { // 참조값 있을 때 aka 대댓글임
			reply.setR_num(rnum);
			reply.setR_origin(rs.selectOrigin(reply.getR_ref()));
			reply.setR_level(rs.selectLevel(reply.getR_ref())+1);
			int step = rs.selectStep(reply.getR_ref());
			reply.setR_step(step+1);
			rs.updateStep(reply);
		}
		rs.insert(reply);
		model.addAttribute("r_b_num", reply.getR_b_num());
		return "redirect:guestBookView.html?r_b_num="+reply.getR_b_num();
	}
	
	@RequestMapping("udpateguestBook.html")
	public String update(String r_content, int r_b_num, int r_num, Model model) {
		Reply reply = new Reply();
		reply.setR_num(r_num);
		reply.setR_content(r_content);
		rs.update(reply);
		return "redirect:guestBookView.html?r_b_num="+r_b_num;
	}
	
	@RequestMapping("deleteguestBook.html")
	public String delete(int r_b_num, int r_num, Model model) {
		rs.delete(r_num);
		return "redirect:guestBookView.html?r_b_num="+r_b_num;
	}
	
	@RequestMapping("guestBookView.html")
	public String view(int r_b_num, Model model) {
		model.addAttribute("r_b_num", r_b_num);
		return "/board/guestBookView";
	}

	@RequestMapping("guestBookList.html")
	public String list(int r_b_num, int startNum, Model model) {
	
		int wholeNum = rs.count(r_b_num);
		int rowPerPage = 10;
		int endNum = startNum+rowPerPage-1;
		
		Reply reply = new Reply();
		reply.setR_b_num(r_b_num);
		reply.setStartNum(startNum);
		if(wholeNum<endNum) endNum = wholeNum;
		reply.setEndNum(endNum);
		List<Reply> replyList = rs.list2(reply);

		model.addAttribute("r_b_num", r_b_num);
		model.addAttribute("startNum", startNum);
		model.addAttribute("endNum", endNum);
		model.addAttribute("wholeNum", wholeNum);
		model.addAttribute("replyList", replyList);

		return "/board/guestBookList";
	}
	
}
