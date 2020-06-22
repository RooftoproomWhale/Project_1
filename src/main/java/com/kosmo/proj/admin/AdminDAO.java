package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.ReservationDTO;
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
	public List<MemberDTO> selectList_All(Paging vo) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectMemberList", vo);
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
	public List<MemberDTO> selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectOne", map);
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
	public List<ReservationDTO> selectList_Apt_All(Paging vo) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAptList", vo);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_All(Paging vo) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAuthList", vo);
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

	@Override
	public List<ReservationDTO> selectOneApt(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectOneApt", map);
	}

	@Override
	public int deleteApt(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteApt", map);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_Search(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAuth_Search", map);
	}

	@Override
	public List<MemberDTO> selectList_Account_Search(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAccount_Search", map);
	}

	@Override
	public List<ReservationDTO> selectList_Appointment_Search(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectApt_Search", map);
	}

	@Override
	public int getTotalRecordAccount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordAccount", map);
	}

	@Override
	public int getTotalRecordAppointment(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordAppointment", map);
	}

	@Override
	public int getTotalRecordHosAuth(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordHosAuth", map);
	}

	@Override
	public int maleCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("genderChartMale");
	}

	@Override
	public int femaleCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("genderChartFemale");
	}

	@Override
	public int under10Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("under10");
	}

	@Override
	public int over10under20Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("over10under20");
	}

	@Override
	public int over20under30Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("over20under30");
	}

	@Override
	public int over30under40Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("over30under40");
	}

	@Override
	public int over40under50Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("over40under50");
	}

	@Override
	public int over50under60Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("over50under60");
	}

	@Override
	public int over60Count() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("over60");
	}

	@Override
	public int insertNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("", map);
	}

	@Override
	public int updateNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("", map);
	}

	

	@Override
	public int deleteNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("", map);
	}
	
}
