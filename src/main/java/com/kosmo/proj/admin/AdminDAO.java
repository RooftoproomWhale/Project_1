package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.service.impl.MemberServiceImpl;

@Repository
public class AdminDAO implements AdminService {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectMemberList", map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("adminUserUpdate", map);
	}
	
	
}
