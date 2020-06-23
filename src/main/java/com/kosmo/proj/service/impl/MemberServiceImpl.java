package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDAO")
	private MemberDAO dao;

	@Override
	public boolean isLogin(Map map) {
		return dao.isLogin(map);
	}
	
	public MemberDTO isLogin(MemberDTO member) {		
		return dao.isLogin(member);
	}

	@Override
	public List<MemberDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}

	@Override
	public MemberDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	public int diseaseupdate(Map map) {
		// TODO Auto-generated method stub
		return dao.diseaseupdate(map);
	}

	public List<MemberDTO> selectDiseaseList(Map map) {
		
		return dao.diseaseSelect(map);
	}

	public List<Map<String, Integer>> selectCount(Map map) {
		
		return dao.selectCount(map);
	}



}
