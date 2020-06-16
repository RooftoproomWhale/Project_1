package com.kosmo.proj.service.android;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;

@RestController
@RequestMapping("/Android/Auth")
public class AndroidAuthController {

	@Resource(name = "memberService")
	private MemberService service;
	
	@CrossOrigin
	@GetMapping(value = "/member", produces = "text/plain;charset=UTF-8")
	public String isMemberTextGet(@RequestParam Map map)
	{
		boolean isMember = service.isLogin(map);
		return isMember ? "회원입니다" : "회원이 아닙니다";
	}

	@CrossOrigin
	@GetMapping(value = "/member/json")
	public MemberDTO isMemberJsonGet(MemberDTO member)
	{
		return service.isLogin(member);
	}
}
