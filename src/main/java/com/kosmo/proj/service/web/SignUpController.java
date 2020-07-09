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
import com.kosmo.proj.service.HistoryDTO;
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
      int memCheck = memberService.insert(map);
      System.out.println("memChekck: " + memCheck);

      int hisCheck = memberService.hisInsert(map);
      System.out.println("hisCheck: " + hisCheck);

      HistoryDTO getNo = memberService.getNo(map);
      String histNo = getNo.getHist_no();
      System.out.println("histNo: " + histNo);

      map.put("histNo", histNo);

      String illStr = map.get("illStr").toString();
      String[] illArray = illStr.split("-");

      for(int i=0; i<illArray.length; i++)
      {
         String ill = illArray[i];
         System.out.println(Integer.parseInt(ill));
         map.put("illCode", Integer.parseInt(ill));

         int illCheck = memberService.illInsert(map);
         System.out.println(i + "번째 illCheck: " + illCheck);
      }

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

   @RequestMapping("/Member/HospitalAuthSub.hst")
   public String hosAuthSub(@RequestParam Map map, Model model)
   {
      System.out.println("AUTHSUBCONT");

      int inCheck = memberService.insert(map);
      System.out.println("MEM IN:" + inCheck);

      int upCheck = memberService.hosAuthSub(map);
      System.out.println("HOSAUTH UP: " + upCheck);

      int upCheck2 = memberService.hosIdUpdate(map);
      System.out.println("HOSID UP: " + upCheck2);

      return "SignUp.tiles";
   }

}