package com.kosmo.proj.service.web;

import java.io.Console;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.MemberService;

@Controller
public class SnsLoginController {
	@Resource(name = "memberService")
	private MemberService service;
	
	@RequestMapping(value = "/User/snsInsert.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String snsInsert(@RequestParam Map map) {
		System.out.println(map);
		if(service.selectOne(map)==null) {
			service.insert(map);
		}
		JSONObject json = new JSONObject(map);
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}
	
	
	
	
}
