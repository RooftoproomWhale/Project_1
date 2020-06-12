package com.kosmo.proj.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
		///내정보
	   @RequestMapping("/mypage/mypage.hst")
	   public String mypage() {
	      return "Mypage_Main.my_tiles";
	   }
	   //회원탈퇴
	   @RequestMapping("/mypage/unmember.hst")
	   public String unmember() {
	      return "unmember.my_tiles";
	   }
	   //비밀번호 변경
	   @RequestMapping("/mypage/ChangePassword.hst")
	   public String ChangePassword() {
	      return "ChangePassword.my_tiles";
	   }
	   //회원정보 수정
	   @RequestMapping("/mypage/ChangeMember.hst")
	   public String ChangeMember() {
	      return "ChangeMember.my_tiles";
	   }
	   //진료예약 현황
	   @RequestMapping("/mypage/ReservationList.hst")
	   public String ReservationList() {
	      return "ReservationList.my_tiles";
	   }
	   //복약관리
	   @RequestMapping("/mypage/administration.hst")
	   public String administration() {
	      return "administration.my_tiles";
	   }
	   //내 질병관리
	   @RequestMapping("/mypage/Disease.hst")
	   public String Disease() {
	      return "Disease.my_tiles";
	   }
}
