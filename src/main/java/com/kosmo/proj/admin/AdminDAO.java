package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.BoardDTO;
import com.kosmo.proj.service.CovidEditDTO;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.ReservationDTO;

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
		return sqlMapper.insert("insertNotice", map);
	}

	@Override
	public int updateNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateNotice", map);
	}

	@Override
	public List<BoardDTO> viewNotice(Paging vo) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("listNotice", vo);
	}

	@Override
	public int deleteNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteNotice", map);
	}

	@Override
	public List<BoardDTO> detailNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("detailNotice", map);
	}

	@Override
	public int janMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("janMemCount");
	}

	@Override
	public int febMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("febMemCount");
	}

	@Override
	public int marMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("marMemCount");
	}

	@Override
	public int aprMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("aprMemCount");
	}

	@Override
	public int mayMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("mayMemCount");
	}

	@Override
	public int junMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("junMemCount");
	}

	@Override
	public int julMemCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("julMemCount");
	}

	@Override
	public int janAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("janAptCount");
	}

	@Override
	public int febAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("febAptCount");
	}

	@Override
	public int marAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("marAptCount");
	}

	@Override
	public int aprAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("aprAptCount");
	}

	@Override
	public int mayAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("mayAptCount");
	}

	@Override
	public int junAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("junAptCount");
	}

	@Override
	public int julAptCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("julAptCount");
	}

	@Override
	public int getTotalRecordAccSearch(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordAccSearch", map);
	}

	@Override
	public int getTotalRecordAptSearch(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordAptSearch", map);
	}

	@Override
	public int getTotalRecordHosSearch(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordHosSearch", map);
	}

	@Override
	public int naeCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("naeAptCount");
	}

	@Override
	public int biCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("biAptCount");
	}

	@Override
	public int sanCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("sanAptCount");
	}

	@Override
	public int seongCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("seongAptCount");
	}

	@Override
	public int soCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("soAptCount");
	}

	@Override
	public int sinCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("sinAptCount");
	}

	@Override
	public int anCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("anAptCount");
	}

	@Override
	public int leeCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("leeAptCount");
	}

	@Override
	public int ilCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("ilAptCount");
	}

	@Override
	public int jeongCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("jeongAptCount");
	}

	@Override
	public int hyeongCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("hyeongAptCount");
	}

	@Override
	public int chiCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("chiAptCount");
	}

	@Override
	public int piCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("piAptCount");
	}

	@Override
	public int hanCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("hanAptCount");
	}

	@Override
	public int giCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("giAptCount");
	}

	@Override
	public List<CovidEditDTO> selectCovidList(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.selectList("selectCovidList");
	}

	@Override
	public int updateCovidList(Map map) {
		
		return sqlMapper.update("updateCovidList",map);
	}

	

	@Override
	public int getTotalRecordNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getTotalRecordNotice");
	}

	@Override
	public List<BoardDTO> selectImage() {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectImg");
	}

	@Override
	public int hitNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("hitNotice",map);
	}

	



	@Override
	public int getFirst(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getFirst", map);
	}

	@Override
	public int getLast(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getLast", map);
	}

	@Override
	public int approveAuth_(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateAuthEnable", map);
	}

	@Override
	public int t0_2() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t0_2");
	}

	@Override
	public int t2_4() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t2_4");
	}

	@Override
	public int t4_6() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t4_6");
	}

	@Override
	public int t6_8() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t6_8");
	}

	@Override
	public int t8_10() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t8_10");
	}

	@Override
	public int t10_12() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t10_12");
	}

	@Override
	public int t12_14() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t12_14");
	}

	@Override
	public int t14_16() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t14_16");
	}

	@Override
	public int t16_18() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t16_18");
	}

	@Override
	public int t18_20() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t18_20");
	}

	@Override
	public int t20_22() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t20_22");
	}

	@Override
	public int t22_24() {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("t22_24");
	}

	@Override
	public int deletePM(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deletePM", map);
	}

	@Override
	public int deletePres(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deletePres", map);
	}

	@Override
	public int deleteHI(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteHI", map);
	}

	@Override
	public int deleteHist(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteHist", map);
	}

	@Override
	public int deleteHD(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteHD", map);
	}

	@Override
	public int updateHos(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateHos", map);
	}

	@Override
	public int deleteReserv(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteReserv", map);
	}

	@Override
	public int deleteNoti(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteNoti", map);
	}

	@Override
	public int deleteQna(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteQna", map);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_App(Paging vo) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAuthListApp", vo);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_Wait(Paging vo) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAuthListWait", vo);
	}

	@Override
	public int getTotalRecordHosAuthApp(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordHosAuthApp", map);
	}

	@Override
	public int getTotalRecordHosAuthWait(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("countRecordHosAuthWait", map);
	}

}
