package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name = "adminDAO")
	private AdminDAO dao;
	
	
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberDTO> selectList_All(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_All(map);
	}
	
	@Override
	public List<MemberDTO> selectList_User(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_User(map);
	}

	@Override
	public List<MemberDTO> selectList_Hosp(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_Hosp(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

	@Override
	public List<HospitalDTO> selectList_Apt_All(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_Apt_All(map);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_All(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_Auth_All(map);
	}

	@Override
	public int approveAuth(Map map) {
		// TODO Auto-generated method stub
		return dao.approveAuth(map);
	}

	@Override
	public int denyAuth(Map map) {
		// TODO Auto-generated method stub
		return dao.denyAuth(map);
	}

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return dao.memberCount();
	}

	@Override
	public int genderCount() {
		// TODO Auto-generated method stub
		return dao.genderCount();
	}

	@Override
	public int hospCount() {
		// TODO Auto-generated method stub
		return dao.hospCount();
	}

	@Override
	public int presCount() {
		// TODO Auto-generated method stub
		return dao.presCount();
	}

	@Override
	public int aptCount() {
		// TODO Auto-generated method stub
		return dao.aptCount();
	}
	
	

}
