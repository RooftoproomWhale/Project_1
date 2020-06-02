package com.kosmo.proj.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	   @RequestMapping("/mypage/mypage.hst")
	   public String mypage() {
	      return "mypage.tiles";
	   }
	   @RequestMapping("/mypage/unmember.hst")
	   public String unmember() {
	      return "unmember.tiles";
	   }
	   @RequestMapping("/mypage/ChangePassword.hst")
	   public String ChangePassword() {
	      return "ChangePassword.tiles";
	   }
	   @RequestMapping("/mypage/ChangeMember.hst")
	   public String ChangeMember() {
	      return "ChangeMember.tiles";
	   }
}
