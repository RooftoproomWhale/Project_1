package com.kosmo.proj.util;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.service.impl.MemberDAO;
@Service("userDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
	@Resource(name = "memberDAO")
	private MemberDAO dao;
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username);
		CustomUserDetails user = dao.getUserById(username);
		if(user==null) {
            throw new UsernameNotFoundException(username);
        }
        return user;
	}

}
