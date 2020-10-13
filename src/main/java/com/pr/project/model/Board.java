package com.pr.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	private int bNum;		 // board num
	private int bcNum;		 // board category num
	private String subject;  // 주제
	private String id;		 // 작성자 아이디
	private String nickname; // 작성자 별명
	private String content;	 // 내용
	private int readCnt;	 // 조회수
	private int replyCnt;	 // 댓글수
	private int likeCnt;	 // 좋아요수
	private Date bRegdate;	 // 작성일
	private Date bUpdate;	 // 수정일
	private String ip;		 // 작성자 ip
	private String notice;	 // 공지 여부
	private String del;		 // 삭제 여부
}	
 

