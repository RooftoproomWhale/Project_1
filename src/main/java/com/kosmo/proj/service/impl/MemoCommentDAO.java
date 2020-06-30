package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.MemoCommentService;

@Repository("commentDao")
public class MemoCommentDAO implements MemoCommentService {

	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	//현재 글번에 따른 모든 댓글 목록]
	@Override
	public List<Map> selectList(Map map) {

		return sqlMapper.selectList("commentSelectList", map);
	}

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("commentInsert",map);
	}

	@Override
	public int delete(Map map) {
		return sqlMapper.update("commentDelete", map);

	}

	@Override
	public int update(Map map) {
		return sqlMapper.update("commentUpdate", map);
	}

}
