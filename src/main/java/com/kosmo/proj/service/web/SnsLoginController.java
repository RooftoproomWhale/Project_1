package com.kosmo.proj.service.web;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.python.bouncycastle.cert.ocsp.Req;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.util.CustomUserDetails;
import com.kosmo.proj.util.CustomUserDetailsService;

@Controller
public class SnsLoginController {
	@Resource(name = "memberService")
	private MemberService service;
	
	@Resource(name = "userDetailsService")
	private CustomUserDetailsService userService;
	
	@RequestMapping(value = "/User/snsInsert.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String snsInsert(@RequestParam Map map,HttpServletRequest req) {
		System.out.println(map);
		if(service.selectOne(map)==null) {
			service.insert(map);
		}
		JSONObject json = new JSONObject(map);
		System.out.println(json.toJSONString());
		
		
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		  list.add(new SimpleGrantedAuthority("ROLE_MEM"));

		  SecurityContext sc = SecurityContextHolder.getContext();
		  //아이디, 패스워드, 권한을 설정합니다. 아이디는 Object단위로 넣어도 무방하며
		  //패스워드는 null로 하여도 값이 생성됩니다.
		  CustomUserDetails user = userService.loadUserByUsername(map.get("email").toString());
		  sc.setAuthentication(new UsernamePasswordAuthenticationToken(user, map.get("pwd"), list));
		  HttpSession session = req.getSession(true);
		  //위에서 설정한 값을 Spring security에서 사용할 수 있도록 세션에 설정해줍니다.
		  session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);

		return json.toJSONString();
	}

}
