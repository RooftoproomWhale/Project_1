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
	
}
