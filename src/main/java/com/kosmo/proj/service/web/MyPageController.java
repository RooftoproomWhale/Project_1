package com.kosmo.proj.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	// 유저 페이지
	/// 내정보
	@RequestMapping("/mypage/mypage.hst")
	public String mypage() {
		
		

		return "Mypage_Main.my_tiles";
	}

	// 회원탈퇴
	@RequestMapping("/mypage/unmember.hst")
	public String unmember() {
		return "unmember.my_tiles";
	}

	// 비밀번호 변경
	@RequestMapping("/mypage/ChangePassword.hst")
	public String ChangePassword() {
		return "ChangePassword.my_tiles";
	}

	// 회원정보 수정
	@RequestMapping("/mypage/ChangeMember.hst")
	public String ChangeMember() {
		return "ChangeMember.my_tiles";
	}

	// 진료예약 현황
	@RequestMapping("/mypage/ReservationList.hst")
	public String ReservationList() {
		return "ReservationList.my_tiles";
	}

	// 복약관리
	@RequestMapping("/mypage/administration.hst")
	public String administration() {
		return "administration.my_tiles";
	}

	// 내 질병관리
	@RequestMapping("/mypage/Disease.hst")
	public String Disease() {
		return "Disease.my_tiles";
	}

	// 병원 페이지
	@RequestMapping("/Hospage/main.hst")
	public String toMain() {
		return "Hospage_Main.hos_tiles";
	}

	@RequestMapping("/Hospage/Update.hst")
	public String update() {
		return "Hospage_Update.hos_tiles";
	}

	@RequestMapping("/Hospage/Cancel.hst")
	public String cancel() {
		return "Hospage_Cancel.hos_tiles";
	}

	@RequestMapping("/Hospage/Appointment.hst")
	public String appointment() {
		return "Hospage_Appointment.hos_tiles";
	}

//	   @RequestMapping("/Hospage/Chart.hst")
//	   public String chart() {
//	      return "Hospage_Chart.hos_tiles";
//	   }

}
