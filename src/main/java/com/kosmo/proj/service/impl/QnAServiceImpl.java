package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.QnADTO;
import com.kosmo.proj.service.QnAService;

@Service("qnaService")
public class QnAServiceImpl implements QnAService {

	@Resource(name="qnADAO")
	private QnADAO dao;

	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<QnADTO> listQnA(Paging vo) {
		// TODO Auto-generated method stub
		return dao.listQnA(vo);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecord(map);
	}

	@Override
	public int deleteQnA(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteQnA(map);
	}

	@Override
	public int insertQnA(Map map) {
		// TODO Auto-generated method stub
		return dao.insertQnA(map);
	}

	@Override
	public int updateQnA(Map map) {
		// TODO Auto-generated method stub
		return dao.updateQnA(map);
	}

	@Override
	public List<QnADTO> detailQnA(Map map) {
		// TODO Auto-generated method stub
		return dao.detailQnA(map);
	}

	@Override
	public List<QnADTO> viewQnA(Map map) {
		// TODO Auto-generated method stub
		return dao.viewQnA(map);
	}

	@Override
	public List<QnADTO> selectComment(Map map) {
		// TODO Auto-generated method stub
		return dao.selectComment(map);
	}


}
