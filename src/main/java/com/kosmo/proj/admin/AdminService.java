package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.BoardDTO;
import com.kosmo.proj.service.CovidEditDTO;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.ReservationDTO;

public interface AdminService {

		//로그인 용]
		boolean isLogin(Map map);

		//통계
		int memberCount();
		int genderCount();
		int hospCount();
		int presCount();
		int aptCount();

		//recent chart
		int janMemCount();
		int febMemCount();
		int marMemCount();
		int aprMemCount();
		int mayMemCount();
		int junMemCount();
		int julMemCount();

		int janAptCount();
		int febAptCount();
		int marAptCount();
		int aprAptCount();
		int mayAptCount();
		int junAptCount();
		int julAptCount();

		//deptApt chart
		int naeCount();
		int biCount();
		int sanCount();
		int seongCount();
		int soCount();
		int sinCount();
		int anCount();
		int leeCount();
		int ilCount();
		int jeongCount();
		int hyeongCount();
		int chiCount();
		int piCount();
		int hanCount();
		int giCount();


		//gender chart
		int maleCount();
		int femaleCount();
		//age chart
		int under10Count();
		int over10under20Count();
		int over20under30Count();
		int over30under40Count();
		int over40under50Count();
		int over50under60Count();
		int over60Count();

		//회원 관리
		//회원 상세보기용]
		List<MemberDTO> selectOne(Map map);
		List<MemberDTO> selectList_All(Paging vo);
		List<MemberDTO> selectList_User(Map map);
		List<MemberDTO> selectList_Hosp(Map map);
		//회원 삭제
		int delete(Map map);
		//회원 수정
		int update(Map map);
		List<MemberDTO> selectList_Account_Search(Map map);
		int getTotalRecordAccount(Map map);
		int getTotalRecordAccSearch(Map map);

		//예약 관리
		List<ReservationDTO> selectList_Apt_All(Paging vo);
		List<ReservationDTO> selectOneApt(Map map);
		int deleteApt(Map map);
		List<ReservationDTO> selectList_Appointment_Search(Map map);
		int getTotalRecordAppointment(Map map);
		int getTotalRecordAptSearch(Map map);

		//병원 제휴
		List<HospitalDTO> selectList_Auth_All(Paging vo);
		List<HospitalDTO> selectList_Auth_App(Paging vo);
		List<HospitalDTO> selectList_Auth_Wait(Paging vo);
		int approveAuth(Map map);
		int approveAuth_(Map map);
		int denyAuth(Map map);
		List<HospitalDTO> selectList_Auth_Search(Map map);
		int getTotalRecordHosAuth(Map map);
		int getTotalRecordHosAuthApp(Map map);
		int getTotalRecordHosAuthWait(Map map);
		int getTotalRecordHosSearch(Map map);

		//공지사항
		int insertNotice(Map map);
		int updateNotice(Map map);
		List<BoardDTO> viewNotice(Paging vo);
		int deleteNotice(Map map);
		List<BoardDTO> detailNotice(Map map);
		int getTotalRecordNotice(Map map);
		List<BoardDTO> selectImage();
		int hitNotice(Map map);

		List<CovidEditDTO> selectCovidList(Map map);
		int updateCovidList(Map map);
		int getFirst(Map map);
		int getLast(Map map);
		
		int t0_2();
		int t2_4();
		int t4_6();
		int t6_8();
		int t8_10();
		int t10_12();
		int t12_14();
		int t14_16();
		int t16_18();
		int t18_20();
		int t20_22();
		int t22_24();
		
		int deletePM(Map map);
		int deletePres(Map map);
		int deleteHI(Map map);
		int deleteHist(Map map);
		int deleteHD(Map map);
		int updateHos(Map map);
		int deleteReserv(Map map);
		int deleteNoti(Map map);
		int deleteQna(Map map);

}
