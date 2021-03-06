package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.BoardDTO;
import com.kosmo.proj.service.CovidEditDTO;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.ReservationDTO;

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
	public List<MemberDTO> selectList_All(Paging vo) {
		// TODO Auto-generated method stub
		return dao.selectList_All(vo);
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
	public List<MemberDTO> selectOne(Map map) {
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
	public List<ReservationDTO> selectList_Apt_All(Paging vo) {
		// TODO Auto-generated method stub
		return dao.selectList_Apt_All(vo);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_All(Paging vo) {
		// TODO Auto-generated method stub
		return dao.selectList_Auth_All(vo);
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

	@Override
	public List<ReservationDTO> selectOneApt(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOneApt(map);
	}

	@Override
	public int deleteApt(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteApt(map);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_Search(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_Auth_Search(map);
	}

	@Override
	public List<MemberDTO> selectList_Account_Search(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_Account_Search(map);
	}

	@Override
	public List<ReservationDTO> selectList_Appointment_Search(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList_Appointment_Search(map);
	}

	@Override
	public int getTotalRecordAccount(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordAccount(map);
	}

	@Override
	public int getTotalRecordAppointment(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordAppointment(map);
	}

	@Override
	public int getTotalRecordHosAuth(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordHosAuth(map);
	}

	@Override
	public int maleCount() {
		// TODO Auto-generated method stub
		return dao.maleCount();
	}

	@Override
	public int femaleCount() {
		// TODO Auto-generated method stub
		return dao.femaleCount();
	}

	@Override
	public int under10Count() {
		// TODO Auto-generated method stub
		return dao.under10Count();
	}

	@Override
	public int over10under20Count() {
		// TODO Auto-generated method stub
		return dao.over10under20Count();
	}

	@Override
	public int over20under30Count() {
		// TODO Auto-generated method stub
		return dao.over20under30Count();
	}

	@Override
	public int over30under40Count() {
		// TODO Auto-generated method stub
		return dao.over30under40Count();
	}

	@Override
	public int over40under50Count() {
		// TODO Auto-generated method stub
		return dao.over40under50Count();
	}

	@Override
	public int over50under60Count() {
		// TODO Auto-generated method stub
		return dao.over50under60Count();
	}

	@Override
	public int over60Count() {
		// TODO Auto-generated method stub
		return dao.over60Count();
	}

	 @Override
	 public int insertNotice(Map map) {
		 // TODO Auto-generated method stub
		 return dao.insertNotice(map);
	 }
	 @Override
	 public int deleteNotice(Map map) {
		 // TODO Auto-generated method stub
		 return dao.deleteNotice(map);
	 }

	 @Override
	 public int updateNotice(Map map) {
		 // TODO Auto-generated method stub
		 return dao.updateNotice(map);
	 }

	 @Override
	 public List<BoardDTO> viewNotice(Paging vo) {
		 // TODO Auto-generated method stub
		 return dao.viewNotice(vo);
	 }


	 @Override
	 public List<BoardDTO> detailNotice(Map map) {
		 // TODO Auto-generated method stub
		 return dao.detailNotice(map);
	 }

	@Override
	public int janMemCount() {
		// TODO Auto-generated method stub
		return dao.janMemCount();
	}

	@Override
	public int febMemCount() {
		// TODO Auto-generated method stub
		return dao.febMemCount();
	}

	@Override
	public int marMemCount() {
		// TODO Auto-generated method stub
		return dao.marMemCount();
	}

	@Override
	public int aprMemCount() {
		// TODO Auto-generated method stub
		return dao.aprMemCount();
	}

	@Override
	public int mayMemCount() {
		// TODO Auto-generated method stub
		return dao.mayMemCount();
	}

	@Override
	public int junMemCount() {
		// TODO Auto-generated method stub
		return dao.junMemCount();
	}

	@Override
	public int julMemCount() {
		// TODO Auto-generated method stub
		return dao.julMemCount();
	}

	@Override
	public int janAptCount() {
		// TODO Auto-generated method stub
		return dao.janAptCount();
	}

	@Override
	public int febAptCount() {
		// TODO Auto-generated method stub
		return dao.febAptCount();
	}

	@Override
	public int marAptCount() {
		// TODO Auto-generated method stub
		return dao.marAptCount();
	}

	@Override
	public int aprAptCount() {
		// TODO Auto-generated method stub
		return dao.aprAptCount();
	}

	@Override
	public int mayAptCount() {
		// TODO Auto-generated method stub
		return dao.mayAptCount();
	}

	@Override
	public int junAptCount() {
		// TODO Auto-generated method stub
		return dao.junAptCount();
	}

	@Override
	public int julAptCount() {
		// TODO Auto-generated method stub
		return dao.julAptCount();
	}

	@Override
	public int getTotalRecordAccSearch(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordAccSearch(map);
	}

	@Override
	public int getTotalRecordAptSearch(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordAptSearch(map);
	}

	@Override
	public int getTotalRecordHosSearch(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordHosSearch(map);
	}

	@Override
	public int naeCount() {
		// TODO Auto-generated method stub
		return dao.naeCount();
	}

	@Override
	public int biCount() {
		// TODO Auto-generated method stub
		return dao.biCount();
	}

	@Override
	public int sanCount() {
		// TODO Auto-generated method stub
		return dao.sanCount();
	}

	@Override
	public int seongCount() {
		// TODO Auto-generated method stub
		return dao.seongCount();
	}

	@Override
	public int soCount() {
		// TODO Auto-generated method stub
		return dao.soCount();
	}

	@Override
	public int sinCount() {
		// TODO Auto-generated method stub
		return dao.sinCount();
	}

	@Override
	public int anCount() {
		// TODO Auto-generated method stub
		return dao.anCount();
	}

	@Override
	public int leeCount() {
		// TODO Auto-generated method stub
		return dao.leeCount();
	}

	@Override
	public int ilCount() {
		// TODO Auto-generated method stub
		return dao.ilCount();
	}

	@Override
	public int jeongCount() {
		// TODO Auto-generated method stub
		return dao.jeongCount();
	}

	@Override
	public int hyeongCount() {
		// TODO Auto-generated method stub
		return dao.hyeongCount();
	}

	@Override
	public int chiCount() {
		// TODO Auto-generated method stub
		return dao.chiCount();
	}

	@Override
	public int piCount() {
		// TODO Auto-generated method stub
		return dao.piCount();
	}

	@Override
	public int hanCount() {
		// TODO Auto-generated method stub
		return dao.hanCount();
	}

	@Override
	public int giCount() {
		// TODO Auto-generated method stub
		return dao.giCount();
	}

	@Override
	public List<CovidEditDTO> selectCovidList(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectCovidList(map);
	}

	@Override
	public int updateCovidList(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.updateCovidList(map);
	}

	@Override
	public int getTotalRecordNotice(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordNotice(map);
	}
	@Override
	public List<BoardDTO> selectImage() {
		// TODO Auto-generated method stub
		return dao.selectImage();
	}


	@Override
	public int hitNotice(Map map) {
		// TODO Auto-generated method stub
		return dao.hitNotice(map);
	}

	@Override
	public int getFirst(Map map) {
		// TODO Auto-generated method stub
		return dao.getFirst(map);
	}

	@Override
	public int getLast(Map map) {
		// TODO Auto-generated method stub
		return dao.getLast(map);
	}

	@Override
	public int approveAuth_(Map map) {
		// TODO Auto-generated method stub
		return dao.approveAuth_(map);
	}

	@Override
	public int t0_2() {
		// TODO Auto-generated method stub
		return dao.t0_2();
	}

	@Override
	public int t2_4() {
		// TODO Auto-generated method stub
		return dao.t2_4();
	}

	@Override
	public int t4_6() {
		// TODO Auto-generated method stub
		return dao.t4_6();
	}

	@Override
	public int t6_8() {
		// TODO Auto-generated method stub
		return dao.t6_8();
	}

	@Override
	public int t8_10() {
		// TODO Auto-generated method stub
		return dao.t8_10();
	}

	@Override
	public int t10_12() {
		// TODO Auto-generated method stub
		return dao.t10_12();
	}

	@Override
	public int t12_14() {
		// TODO Auto-generated method stub
		return dao.t12_14();
	}

	@Override
	public int t14_16() {
		// TODO Auto-generated method stub
		return dao.t14_16();
	}

	@Override
	public int t16_18() {
		// TODO Auto-generated method stub
		return dao.t16_18();
	}

	@Override
	public int t18_20() {
		// TODO Auto-generated method stub
		return dao.t18_20();
	}

	@Override
	public int t20_22() {
		// TODO Auto-generated method stub
		return dao.t20_22();
	}

	@Override
	public int t22_24() {
		// TODO Auto-generated method stub
		return dao.t22_24();
	}

	@Override
	public int deletePM(Map map) {
		// TODO Auto-generated method stub
		return dao.deletePM(map);
	}

	@Override
	public int deletePres(Map map) {
		// TODO Auto-generated method stub
		return dao.deletePres(map);
	}

	@Override
	public int deleteHI(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteHI(map);
	}

	@Override
	public int deleteHist(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteHist(map);
	}

	@Override
	public int deleteHD(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteHD(map);
	}

	@Override
	public int updateHos(Map map) {
		// TODO Auto-generated method stub
		return dao.updateHos(map);
	}

	@Override
	public int deleteReserv(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteReserv(map);
	}

	@Override
	public int deleteNoti(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteNoti(map);
	}

	@Override
	public int deleteQna(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteQna(map);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_App(Paging vo) {
		// TODO Auto-generated method stub
		return dao.selectList_Auth_App(vo);
	}

	@Override
	public List<HospitalDTO> selectList_Auth_Wait(Paging vo) {
		// TODO Auto-generated method stub
		return dao.selectList_Auth_Wait(vo);
	}

	@Override
	public int getTotalRecordHosAuthApp(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordHosAuthApp(map);
	}

	@Override
	public int getTotalRecordHosAuthWait(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecordHosAuthWait(map);
	}

}
