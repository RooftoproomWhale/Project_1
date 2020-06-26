package com.kosmo.proj.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberService;

@Controller
public class SignUpController {

   @Resource(name = "memberService")//서비스주입
   private MemberService memberService;


   @RequestMapping("/Account/SignForm.hst")
   public String toForm()
   {
      return "SignUp.tiles";
   }

   @RequestMapping("/Member/Insert.hst")
   public String userSignup(@RequestParam Map map, Model model)
   {
      int check = memberService.insert(map);
      System.out.println(check);

      return "SignUp.tiles";
   }

   @ResponseBody
   @RequestMapping(value = "/Member/HospitalSearch.hst", produces = "text/html; charset=UTF-8")
   public String hospitalSearch(@RequestParam Map map, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
//      int total = adminService.getTotalRecordAptSearch(map);
//      System.out.println(total);
      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;
      List<HospitalDTO> list = memberService.selectHosSearch(map);
      for (HospitalDTO val : list) {
         System.out.println(val.getHosp_name());
         System.out.println(val.getAddress());
      }
      try {
         jsonStr = mapper.writeValueAsString(list);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }

      model.addAttribute("list", list);
      System.out.println(jsonStr);
      return jsonStr.toString();
   }

   @ResponseBody
   @RequestMapping(value = "/Member/HosSearchList.hst", produces = "text/html; charset=UTF-8")
   public String searchedHosp(@RequestParam Map map, Model model)
   {
      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;
      List<HospitalDTO> list = memberService.selectedHosp(map);
      for (HospitalDTO val : list) {
         System.out.println(val.getHosp_name());
         System.out.println(val.getAddress());
      }
      try {
         jsonStr = mapper.writeValueAsString(list);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }

      model.addAttribute("list", list);
      System.out.println(jsonStr);
      return jsonStr.toString();
   }

   @ResponseBody
   @RequestMapping("/Member/HospitalAuthSub.hst")
   public String hosAuthSub(@RequestParam Map map, Model model)
   {
      int check = memberService.hosAuthSub(map);
      System.out.println(check);

      return "SignUp.tiles";
   }

}
