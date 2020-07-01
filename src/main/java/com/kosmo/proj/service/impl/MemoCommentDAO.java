package com.kosmo.proj.service.impl;

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
