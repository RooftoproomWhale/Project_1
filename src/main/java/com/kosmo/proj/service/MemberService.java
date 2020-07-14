package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.util.CustomUserDetails;

public interface MemberService {

   //로그인 용]
   boolean isLogin(Map map);
   public MemberDTO isLogin(MemberDTO member);

   //목록용]
   List<MemberDTO> selectList(Map map);

   //병원 제휴
   List<HospitalDTO> selectHosSearch(Map map);
   List<HospitalDTO> selectedHosp(Map map);
   int hosAuthSub(Map map);
   int hosIdUpdate(Map map);

   //전체 레코드 수]
   int getTotalRecord(Map map);
   //회원 상세보기용]
   MemberDTO selectOne(Map map);
   //입력/수정/삭제용]
   int delete(Map map);
   int insert(Map map);
   int update(Map map);
   CustomUserDetails getUserById(String username);
   int hisInsert(Map map);
   HistoryDTO getNo(Map map);
   int illInsert(Map map);
   
   int usingIncrease(Map map);
   
   //안드로이드
   ReservationDTO recentApt(Map map);
   PrescriptionDTO recentPres(Map map);
   List<PrescriptionDTO> getPreMedi(Map map);

}