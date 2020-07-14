package com.kosmo.proj;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.impl.MemberServiceImpl;

public class GetUser {

   public String getUser(Model model, Authentication auth)
   {
      String role=null;
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
               role= "ROLE_ADM";
            }
            else if(((GrantedAuthority)authority).getAuthority().equals("ROLE_MEM"))
            {
               System.out.println("회원");
               model.addAttribute("user", user);
               model.addAttribute("role", "MEM");
               role= "ROLE_MEM";
            }
            else if(((GrantedAuthority)authority).getAuthority().equals("ROLE_HOS"))
            {
               System.out.println("병원");
               model.addAttribute("user", user);
               model.addAttribute("role", "HOS");
               role= "ROLE_HOS";
            }
            else
            {
               System.out.println("권한 없");
               model.addAttribute("user", null);
               model.addAttribute("role", "NO");
               role= "NO";
            }
         }
      }
      return role;
      
   }
}