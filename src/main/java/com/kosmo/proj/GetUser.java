package com.kosmo.proj;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;

public class GetUser {

	public void getUser(Model model, Authentication auth)
	{
		System.out.println(auth);
		if(auth != null)
		{
			UserDetails userDetails = (UserDetails)auth.getPrincipal();
			Collection authorities = userDetails.getAuthorities();
			String user = userDetails.getUsername();
			System.out.println(user);
			for(Object authority:authorities)
			{
				System.out.println(((GrantedAuthority)authority).getAuthority());
				if(((GrantedAuthority)authority).getAuthority().equals("ROLE_ADM"))
				{
					System.out.println("관리자");
					model.addAttribute("user", user);
					model.addAttribute("role", "ADM");
				}
				else if(((GrantedAuthority)authority).getAuthority().equals("ROLE_MEM"))
				{
					System.out.println("회원");
					model.addAttribute("user", user);
					model.addAttribute("role", "MEM");
				}
				else if(((GrantedAuthority)authority).getAuthority().equals("ROLE_HOS"))
				{
					System.out.println("병원");
					model.addAttribute("user", user);
					model.addAttribute("role", "HOS");
				}
				else
				{
					System.out.println("권한 없");
					model.addAttribute("user", null);
					model.addAttribute("role", "NO");
				}
			}
		}
		
	}
}
