package com.kosmo.proj.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.MemoCommentService;

@Service("commentService")
public class MemoCommentServiceImpl implements MemoCommentService {
	//MemoCommentDAO주입]
	@Resource(name="commentDao")
	private MemoCommentDAO dao;


	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);

	}

	@Override
	public int update(Map map) {
		return dao.update(map);

	}


}
