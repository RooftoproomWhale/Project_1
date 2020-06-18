package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.HospitalDTO;
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
	public List<MemberDTO> selectList_All(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectMemberList", map);
	}

	@Override
	public List<MemberDTO> selectList_User(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectMemberListUser", map);
	}

	@Override
	public List<MemberDTO> selectList_Hosp(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectMemberListHosp", map);
	}
	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectOne", map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("adminUserDelete", map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("adminUserUpdate", map);
	}

	@Override
	public List<HospitalDTO> selectList_Apt_All(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAptList", map);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_All(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAuthList", map);
	}

	@Override
	public int approveAuth(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateAuth_O", map);
	}

	@Override
	public int denyAuth(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateAuth_X", map);
	}

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("memberCount");
	}

	@Override
	public int genderCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hospCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("hospCount");
	}

	@Override
	public int presCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("presCount");
	}

	@Override
	public int aptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("aptCount");
	}

	
	
}
