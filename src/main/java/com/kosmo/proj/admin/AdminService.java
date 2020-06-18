package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;

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
		MemberDTO selectOne(Map map);
		List<MemberDTO> selectList_All(Map map);
		List<MemberDTO> selectList_User(Map map);
		List<MemberDTO> selectList_Hosp(Map map);
		//회원 삭제
		int delete(Map map);
		//회원 수정
		int update(Map map);
		//전체 레코드 수]
		int getTotalRecord(Map map);
		
		//예약 관리
		List<HospitalDTO> selectList_Apt_All(Map map);

		//병원 제휴
		List<HospitalDTO> selectList_Auth_All(Map map);	
		int approveAuth(Map map);
		int denyAuth(Map map);
		
		
}
