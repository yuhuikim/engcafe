package com.pr.project.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.pr.project.model.Board;

@Repository // DAO객체 생성
public class BoardDaoImpl implements BoardDao {
	@Autowired // mybatis 연결
	private SqlSessionTemplate sst;

	@Override
	public List<Board> list() {
		return sst.selectList("boardns.list");
	}
	
}
