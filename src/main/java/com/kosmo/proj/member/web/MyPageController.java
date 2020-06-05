package com.kosmo.proj.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
		///내정보
	   @RequestMapping("/mypage/mypage.hst")
	   public String mypage() {
	      return "mypage.tiles";
	   }
	   //회원탈퇴
	   @RequestMapping("/mypage/unmember.hst")
	   public String unmember() {
	      return "unmember.tiles";
	   }
	   //비밀번호 변경
	   @RequestMapping("/mypage/ChangePassword.hst")
	   public String ChangePassword() {
	      return "ChangePassword.tiles";
	   }
	   //회원정보 수정
	   @RequestMapping("/mypage/ChangeMember.hst")
	   public String ChangeMember() {
	      return "ChangeMember.tiles";
	   }

	   //진료예약 현황
	   @RequestMapping("/mypage/ReservationList.hst")
	   public String ReservationList() {
	      return "ReservationList.tiles";
	   }
	   @RequestMapping("/mypage/Yun.hst")
	   public String Yun() {
	      return "Yun.tiles";
	   }
}
