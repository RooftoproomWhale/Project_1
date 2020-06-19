package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

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
		
		//예약 관리
		List<ReservationDTO> selectList_Apt_All(Paging vo);
		List<ReservationDTO> selectOneApt(Map map);
		int deleteApt(Map map);
		List<ReservationDTO> selectList_Appointment_Search(Map map);	
		int getTotalRecordAppointment(Map map);
		
		//병원 제휴
		List<HospitalDTO> selectList_Auth_All(Paging vo);	
		int approveAuth(Map map);
		int denyAuth(Map map);
		List<HospitalDTO> selectList_Auth_Search(Map map);	
		int getTotalRecordHosAuth(Map map);
		
		
		
}
