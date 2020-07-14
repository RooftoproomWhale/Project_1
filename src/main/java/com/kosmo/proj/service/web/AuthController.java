package com.kosmo.proj.service.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.MemberService;

@Controller
public class AuthController {
	
	//서비스 주입]
	@Resource(name="memberService")
	private MemberService memberService;
	
	//로그인 폼으로 이동]
	@RequestMapping("/User/Login.hst")
	public String login() {
		return "member/Login.tiles";
	}///////////login

	
	//로그인 여부 판단]
	@RequestMapping(value="/Auth/IsLogin.bbs",produces = "text/html; charset=UTF-8")
	@ResponseBody
	//public String isLogin(HttpSession session) {//Security 미 사용시
	public String isLogin(Authentication auth, Map map) {//Security 사용시
		//스프링 씨큐리티 적용시 인증(로그인)되었다면
		//Authentication객체에 로그인과 관련된 정보가 전달됨
		//로그인이 안되어 있으면 auth는 null
		JSONObject json = new JSONObject();
		/*
		//Security 미 사용시
		if(session.getAttribute("id")==null) {
			json.put("IsLogin", "NO");
			return json.toJSONString();
		}*/

		if(auth == null) {//로그인이 안된 경우
			json.put("IsLogin", "NO");
			return json.toJSONString();
		}
		json.put("IsLogin", "YES");
		
		return json.toJSONString();
	}
	

	
}
