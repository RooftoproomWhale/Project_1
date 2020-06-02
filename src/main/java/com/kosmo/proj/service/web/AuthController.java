package com.kosmo.proj.service.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
	
	@RequestMapping("/User/Login.hst")
	public String login() {
		return "Login.tiles";
	}
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
