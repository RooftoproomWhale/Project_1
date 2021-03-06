package com.kosmo.proj.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.kosmo.proj.service.BoardDTO;
import com.kosmo.proj.service.CovidEditDTO;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.ReservationDTO;
import com.kosmo.proj.util.FileUpDownUtils;


@RequestMapping(value = "/Admin/")
@Controller
public class AdminController {

   @Resource(name = "adminService")
   private AdminService adminService;

   // 관리자 홈페이지
   @RequestMapping("Index.hst")
   public String toIndex(Model model) {
      // overview
      int memberCount = adminService.memberCount();
      int hospCount = adminService.hospCount();
      int presCount = adminService.presCount();
      int aptCount = adminService.aptCount();
      System.out.println("memberCount: " + memberCount);
      System.out.println("hospCount: " + hospCount);
      System.out.println("presCount: " + presCount);
      System.out.println("aptCount: " + aptCount);
      model.addAttribute("memberCount", memberCount);
      model.addAttribute("hospCount", hospCount);
      model.addAttribute("presCount", presCount);
      model.addAttribute("aptCount", aptCount);

      // recent chart
      int janMemCount = adminService.janMemCount();
      int febMemCount = adminService.febMemCount();
      int marMemCount = adminService.marMemCount();
      int aprMemCount = adminService.aprMemCount();
      int mayMemCount = adminService.mayMemCount();
      int junMemCount = adminService.junMemCount();
      int julMemCount = adminService.julMemCount();

      int janAptCount = adminService.janAptCount();
      int febAptCount = adminService.febAptCount();
      int marAptCount = adminService.marAptCount();
      int aprAptCount = adminService.aprAptCount();
      int mayAptCount = adminService.mayAptCount();
      int junAptCount = adminService.junAptCount();
      int julAptCount = adminService.julAptCount();

      System.out.println(junMemCount);
      System.out.println(junAptCount);
      model.addAttribute("janMemCount", janMemCount);
      model.addAttribute("febMemCount", febMemCount);
      model.addAttribute("marMemCount", marMemCount);
      model.addAttribute("aprMemCount", aprMemCount);
      model.addAttribute("mayMemCount", mayMemCount);
      model.addAttribute("junMemCount", junMemCount);
      model.addAttribute("julMemCount", julMemCount);

      model.addAttribute("janAptCount", janAptCount);
      model.addAttribute("febAptCount", febAptCount);
      model.addAttribute("marAptCount", marAptCount);
      model.addAttribute("aprAptCount", aprAptCount);
      model.addAttribute("mayAptCount", mayAptCount);
      model.addAttribute("junAptCount", junAptCount);
      model.addAttribute("julAptCount", julAptCount);

		// age chart
		int under10 = adminService.under10Count();
		int over10under20 = adminService.over10under20Count();
		int over20under30 = adminService.over20under30Count();
		int over30under40 = adminService.over30under40Count();
		int over40under50 = adminService.over40under50Count();
		int over50under60 = adminService.over50under60Count();
		int over60 = adminService.over60Count();
		System.out.println("10세미만: " + under10 + " 10~19: " + over10under20 + " 20~29: " + over20under30 + " 30~39: "
				+ over30under40 + " 40~49: " + over40under50 + " 50~59: " + over50under60 + " 60이상: " + over60);
		;
		model.addAttribute("under10", under10);
		model.addAttribute("over10under20", over10under20);
		model.addAttribute("over20under30", over20under30);
		model.addAttribute("over30under40", over30under40);
		model.addAttribute("over40under50", over40under50);
		model.addAttribute("over50under60", over50under60);
		model.addAttribute("over60", over60);
		
		//UsingTime
		int t0_2 = adminService.t0_2();
		int t2_4 = adminService.t2_4();
		int t4_6 = adminService.t4_6();
		int t6_8 = adminService.t6_8();
		int t8_10 = adminService.t8_10();
		int t10_12 = adminService.t10_12();
		int t12_14 = adminService.t12_14();
		int t14_16 = adminService.t14_16();
		int t16_18 = adminService.t16_18();
		int t18_20 = adminService.t18_20();
		int t20_22 = adminService.t20_22();
		int t22_24 = adminService.t22_24();
		
		model.addAttribute("t0_2", t0_2);
		model.addAttribute("t2_4", t2_4);
		model.addAttribute("t4_6", t4_6);
		model.addAttribute("t6_8", t6_8);
		model.addAttribute("t8_10", t8_10);
		model.addAttribute("t10_12", t10_12);
		model.addAttribute("t12_14", t12_14);
		model.addAttribute("t14_16", t14_16);
		model.addAttribute("t16_18", t16_18);
		model.addAttribute("t18_20", t18_20);
		model.addAttribute("t20_22", t20_22);
		model.addAttribute("t22_24", t22_24);
		
      return "Ad_Index.ad_tiles";
   }

   // 회원 관리
   @RequestMapping("Accounts.hst")
   public String toAccounts(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordAccount(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<MemberDTO> list = adminService.selectList_All(vo);
      for (MemberDTO val : list) {
         System.out.println(val.getMem_name());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "Accounts.ad_tiles";
   }

   @RequestMapping("AccountsUser.hst")
   public String accountsUser(@RequestParam Map map, Model model) {
      List<MemberDTO> list = adminService.selectList_User(map);
      for (MemberDTO val : list) {
         System.out.println(val.getMem_name());
      }
      model.addAttribute("list", list);
      return "AccountsU.ad_tiles";
   }

   @RequestMapping("AccountsHosp.hst")
   public String accountsHosp(@RequestParam Map map, Model model, ModelMap modelmap) {
      List<MemberDTO> list = adminService.selectList_Hosp(map);
      for (MemberDTO val : list) {
         System.out.println(val.getMem_name());
      }
      String flag = "user";
      model.addAttribute("list", list);
      modelmap.addAttribute("flag", flag);
      return "AccountsH.ad_tiles";
   }

   @ResponseBody
   @RequestMapping(value = "UserUpdateForm.hst", produces = "text/html; charset=UTF-8")
   public String userUpdateForm(@RequestParam Map map, Model model) {
      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;
      List<MemberDTO> list = adminService.selectOne(map);
      System.out.println(list);
      try {
         jsonStr = mapper.writeValueAsString(list);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }
      return jsonStr.toString();
   }

   @RequestMapping(value = "UserUpdate.hst", method = RequestMethod.POST)
   public String userUpdate(@RequestParam Map map, Model model) {
//      MemberDTO record = adminService.selectOne(map);
//      model.addAttribute("record", record);
      int update = adminService.update(map);
      System.out.println(update);
      return "Accounts.ad_tiles";
   }

	@ResponseBody
	@RequestMapping(value = "UserDelete.hst")
	public String userDelete(@RequestParam Map map) {
		
		int deletePM = adminService.deletePM(map);
		System.out.println("deletePM: " + deletePM);
		int deletePres = adminService.deletePres(map);
		System.out.println("deletePres: " + deletePres);
		int deleteHI = adminService.deleteHI(map);
		System.out.println("deleteHI: " + deleteHI);
		int deleteHist = adminService.deleteHist(map);
		System.out.println("deleteHist: " + deleteHist);
		int updateHos = adminService.updateHos(map);
		System.out.println("updateHos: " + updateHos);
		int deleteReserv = adminService.deleteReserv(map);
		System.out.println("deleteReserv: " + deleteReserv);
		int deleteNoti = adminService.deleteNoti(map);
		System.out.println("deleteNoti: " + deleteNoti);
		int deleteQna = adminService.deleteQna(map);
		System.out.println("deleteQna: " + deleteQna);
		int deleteMem = adminService.delete(map);
		System.out.println("deleteMem: " + deleteMem);
		
		String deletestr = Integer.toString(deleteMem);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("del", deletestr);

      return jsonObject.toString();
   }

   @RequestMapping("AccountsSearch.hst")
   public String accountsSearch(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordAccSearch(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<MemberDTO> list = adminService.selectList_Account_Search(map);
      for (MemberDTO val : list) {
         System.out.println(val.getMem_email());
         System.out.println(val.getMem_name());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "Accounts.ad_tiles";
   }

   // 예약 관리
   @RequestMapping("Appointment.hst")
   public String toAppointment(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordAppointment(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<ReservationDTO> list = adminService.selectList_Apt_All(vo);
      for (ReservationDTO val : list) {
         System.out.println(val.getHOSP_NAME());
         System.out.println(val.getRESERV_NO());
         System.out.println(val.getMEM_EMAIL());
         System.out.println(val.getAPPROVED());
         System.out.println(val.getAPPLY_TIME());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "Appointment.ad_tiles";
   }

   @ResponseBody
   @RequestMapping(value = "AptViewForm.hst", produces = "text/html; charset=UTF-8")
   public String appointmentView(@RequestParam Map map) {
      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;
      List<ReservationDTO> list = adminService.selectOneApt(map);
      System.out.println(list);
      for (ReservationDTO val : list) {
         System.out.println(val.getHOSP_NAME());
         System.out.println(val.getRESERV_NO());
         System.out.println(val.getMEM_EMAIL());
         System.out.println(val.getAPPROVED());
         System.out.println(val.getAPPLY_TIME());
      }
      try {
         jsonStr = mapper.writeValueAsString(list);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }

      return jsonStr.toString();
   }

   @RequestMapping(value = "AptDelete.hst", produces = "text/html; charset=UTF-8")
   public String appointmentDelete(@RequestParam Map map) {
      int check = adminService.deleteApt(map);
      System.out.println(check);
      return "Appointment.ad_tiles";
   }

   @RequestMapping("AppointmentSearch.hst")
   public String appointmentSearch(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordAptSearch(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<ReservationDTO> list = adminService.selectList_Appointment_Search(map);
      for (ReservationDTO val : list) {
         System.out.println(val.getHOSP_NAME());
         System.out.println(val.getMEM_NAME());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "Appointment.ad_tiles";
   }

   // 병원 제휴
   @RequestMapping("HosAuth.hst")
   public String toHosAuth(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordHosAuth(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<HospitalDTO> list = adminService.selectList_Auth_All(vo);
      for (HospitalDTO val : list) {
         System.out.println(val.getHosp_name());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "HosAuth.ad_tiles";
   }
   
   @RequestMapping("HosAuthApp.hst")
   public String toHosAuthApp(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordHosAuthApp(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<HospitalDTO> list = adminService.selectList_Auth_App(vo);
      for (HospitalDTO val : list) {
         System.out.println(val.getHosp_name());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "HosAuthApp.ad_tiles";
   }
   
   @RequestMapping("HosAuthWait.hst")
   public String toHosAuthWait(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordHosAuthWait(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<HospitalDTO> list = adminService.selectList_Auth_Wait(vo);
      for (HospitalDTO val : list) {
         System.out.println(val.getHosp_name());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "HosAuthWait.ad_tiles";
   }



   @RequestMapping("ApproveAuth.hst")
   public String approve(@RequestParam Map map, Model model) {
      int check = adminService.approveAuth(map);
      int check_ = adminService.approveAuth_(map);
      System.out.println(check);
      System.out.println(check_);
      return "HosAuth.ad_tiles";
   }

   @RequestMapping("DenyAuth.hst")
   public String deny(@RequestParam Map map, Model model) {
      int check = adminService.denyAuth(map);
      System.out.println(check);
      return "HosAuth.ad_tiles";
   }

   @RequestMapping("HosAuthSearch.hst")
   public String hosAuthSearch(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
      int total = adminService.getTotalRecordHosSearch(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<HospitalDTO> list = adminService.selectList_Auth_Search(map);
      for (HospitalDTO val : list) {
         System.out.println(val.getHosp_name());
         System.out.println(val.getHosp_code());
      }
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);

      return "HosAuth.ad_tiles";
   }

   // 통계
   @RequestMapping("Counts.hst")
   @ResponseBody
   public String count(Model model) {
//      String memberCountStr = Integer.toString(memberCount);
//      JSONObject jsonObject = new JSONObject();
//      jsonObject.put("count", memberCountStr);

//       return jsonObject.toString();
      return "";
   }

   @RequestMapping("Chart.hst")
   public String toChart(Model model) {
      // recent chart
      int janMemCount = adminService.janMemCount();
      int febMemCount = adminService.febMemCount();
      int marMemCount = adminService.marMemCount();
      int aprMemCount = adminService.aprMemCount();
      int mayMemCount = adminService.mayMemCount();
      int junMemCount = adminService.junMemCount();
      int julMemCount = adminService.julMemCount();

      int janAptCount = adminService.janAptCount();
      int febAptCount = adminService.febAptCount();
      int marAptCount = adminService.marAptCount();
      int aprAptCount = adminService.aprAptCount();
      int mayAptCount = adminService.mayAptCount();
      int junAptCount = adminService.junAptCount();
      int julAptCount = adminService.julAptCount();

      model.addAttribute("janMemCount", janMemCount);
      model.addAttribute("febMemCount", febMemCount);
      model.addAttribute("marMemCount", marMemCount);
      model.addAttribute("aprMemCount", aprMemCount);
      model.addAttribute("mayMemCount", mayMemCount);
      model.addAttribute("junMemCount", junMemCount);
      model.addAttribute("julMemCount", julMemCount);

      model.addAttribute("janAptCount", janAptCount);
      model.addAttribute("febAptCount", febAptCount);
      model.addAttribute("marAptCount", marAptCount);
      model.addAttribute("aprAptCount", aprAptCount);
      model.addAttribute("mayAptCount", mayAptCount);
      model.addAttribute("junAptCount", junAptCount);
      model.addAttribute("julAptCount", julAptCount);

      // deptApt chart
      int naeCount = adminService.naeCount();
      int biCount = adminService.biCount();
      int sanCount = adminService.sanCount();
      int seongCount = adminService.seongCount();
      int soCount = adminService.soCount();
      int sinCount = adminService.sinCount();
      int anCount = adminService.anCount();
      int leeCount = adminService.leeCount();
      int ilCount = adminService.ilCount();
      int jeongCount = adminService.jeongCount();
      int hyeongCount = adminService.hyeongCount();
      int chiCount = adminService.chiCount();
      int piCount = adminService.piCount();
      int hanCount = adminService.hanCount();
      int giCount = adminService.giCount();

      model.addAttribute("naeCount", naeCount);
      model.addAttribute("biCount", biCount);
      model.addAttribute("sanCount", sanCount);
      model.addAttribute("seongCount", seongCount);
      model.addAttribute("soCount", soCount);
      model.addAttribute("sinCount", sinCount);
      model.addAttribute("anCount", anCount);
      model.addAttribute("leeCount", leeCount);
      model.addAttribute("ilCount", ilCount);
      model.addAttribute("jeongCount", jeongCount);
      model.addAttribute("hyeongCount", hyeongCount);
      model.addAttribute("chiCount", chiCount);
      model.addAttribute("piCount", piCount);
      model.addAttribute("hanCount", hanCount);
      model.addAttribute("giCount", giCount);

      // age chart
      int under10 = adminService.under10Count();
      int over10under20 = adminService.over10under20Count();
      int over20under30 = adminService.over20under30Count();
      int over30under40 = adminService.over30under40Count();
      int over40under50 = adminService.over40under50Count();
      int over50under60 = adminService.over50under60Count();
      int over60 = adminService.over60Count();
      System.out.println("10세미만: " + under10 + " 10~19: " + over10under20 + " 20~29: " + over20under30 + " 30~39: "
            + over30under40 + " 40~49: " + over40under50 + " 50~59: " + over50under60 + " 60이상: " + over60);
      ;
      model.addAttribute("under10", under10);
      model.addAttribute("over10under20", over10under20);
      model.addAttribute("over20under30", over20under30);
      model.addAttribute("over30under40", over30under40);
      model.addAttribute("over40under50", over40under50);
      model.addAttribute("over50under60", over50under60);
      model.addAttribute("over60", over60);
      //
      // gender chart
      int maleCount = adminService.maleCount();
      int femaleCount = adminService.femaleCount();
      System.out.println("male: " + maleCount);
      System.out.println("female: " + femaleCount);
      model.addAttribute("male", maleCount);
      model.addAttribute("female", femaleCount);
      //
      return "Chart.ad_tiles";
   }

   @RequestMapping("RecentChart.hst")
   public String recentChart() {
      return "Chart.ad_tiles";
   }

   @RequestMapping("GenderChart.hst")
   public String genderChart() {
      return "Chart.ad_tiles";
   }

	@RequestMapping("AgeChart.hst")
	public String ageChart() {
		return "Chart.ad_tiles";
	}
	
	@RequestMapping("UsingTime.hst")
	public String usingTimeChart() {
		return "Chart.ad_tiles";
	}

   @RequestMapping("Corona_Map.hst")
   public String toMap(@RequestParam Map map,Model model) {
      List<CovidEditDTO> list = adminService.selectCovidList(map);
      model.addAttribute("list",list);
      return "CoronaMap.ad_tiles";
   }

   @RequestMapping("Corona_Map_Edit.hst")
   public String covidEdit(@RequestParam Map map,Model model) {
      List<CovidEditDTO> list = adminService.selectCovidList(map);
      int upsuc=0;   
      for(int k=0;k<list.size();k++) {
         Object person= map.get("person"+Integer.toString(k));
         Object date_=map.get("date_"+Integer.toString(k));
         Object content=map.get("content"+Integer.toString(k));
         map.put("person", person);
         map.put("date_", date_);
         map.put("content", content);
         upsuc=adminService.updateCovidList(map);
         }
         list = adminService.selectCovidList(map);
      
            model.addAttribute("msg","수정성공");
            model.addAttribute("list",list);
            return "CoronaMap.ad_tiles";
   }

   @RequestMapping("Form.hst")
   public String toForm() {
      return "Form.ad_tiles";
   }

   // 공지사항
   @RequestMapping("Notice.hst")
   public String noticeList(@RequestParam Map map, Paging vo, Model model,
         @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage){

      int total = adminService.getTotalRecordNotice(map);
      System.out.println(total);
      if (nowPage == null && cntPerPage == null) {
         nowPage = "1";
         cntPerPage = "5";
      } else if (nowPage == null) {
         nowPage = "1";
      } else if (cntPerPage == null) {
         cntPerPage = "5";
      }

      vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<BoardDTO> list = adminService.viewNotice(vo);
      for(BoardDTO val : list)
      {
         System.out.println(val.getNoti_no());
         System.out.println(val.getContent());
         System.out.println(val.getPostdate());
      }

      model.addAttribute("paging", vo);
      model.addAttribute("list", list);
      return "Notice.tiles";
   }

   @RequestMapping("Noticeinsert.hst")
   public String noticeinsert(BoardDTO dto,HttpServletRequest req,Map map) throws IllegalStateException, IOException {

      String phisicalPath = req.getServletContext().getRealPath("/Upload");
      System.out.println(dto.getUpload());

      MultipartFile upload = dto.getUpload();
      System.out.println(upload);

      String file_addr=null;
      String renameFile = null;
      
      InetAddress local = InetAddress.getLocalHost();
       
      String ip = local.getHostAddress();
      System.out.println("ip:" + ip);

      if(upload.getOriginalFilename()!="") {
         System.out.println("null이 아니야");

         renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
         file_addr = "http://"+ip+":8090/proj/Upload/"+renameFile;
         System.out.println(file_addr);

         File file = new File(phisicalPath+File.separator+renameFile);
         upload.transferTo(file);
      }


      map.put("mem_email",dto.getMem_email().toString());
      map.put("title",dto.getTitle().toString());
      map.put("content",dto.getContent().toString());
      map.put("file_addr",file_addr);


      int check = adminService.insertNotice(map);
      System.out.println(check);

      return "redirect:/Admin/Notice.hst";
   }

   @RequestMapping("NoticeWrite.hst")
   public String noticeWrite(Authentication auth, Model model) {

      UserDetails userDetails = (UserDetails)auth.getPrincipal();
      String user = userDetails.getUsername();

      model.addAttribute("user",user);

      return "NoticeWrite.ad_tiles";
   }

   @RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json")
   @ResponseBody
   public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

      JsonObject jsonObject = new JsonObject();

      String fileRoot = "C:\\summernote_image\\";   //저장될 외부 파일 경로
      String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
      String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자

      String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명

      File targetFile = new File(fileRoot + savedFileName);

      try {
         InputStream fileStream = multipartFile.getInputStream();
         FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장
         jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
         jsonObject.addProperty("responseCode", "success");

      } catch (IOException e) {
         FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
         jsonObject.addProperty("responseCode", "error");
         e.printStackTrace();
      }

      return jsonObject;
   }



   @RequestMapping("NoticeDetail.hst")
   public String noticeView(@RequestParam Map map,HttpServletRequest req, Model model) throws IOException {

      List<BoardDTO> list = adminService.detailNotice(map);
      String phisicalPath = req.getServletContext().getRealPath("/Upload");
      System.out.println("no:::::" + map.get("no"));
      int hit = adminService.hitNotice(map);
      System.out.println(hit);

      int first = adminService.getFirst(map);
      int last = adminService.getLast(map);
      System.out.println("first: " + first + "last: " + last);

      for(BoardDTO val:list)
      {
         System.out.println(val.getFile_addr());
         System.out.println(val.getNoti_no());
         System.out.println(val.getContent());
         System.out.println(val.getHit());
      }

      model.addAttribute("list", list);
      model.addAttribute("first", first);
      model.addAttribute("last", last);

      return "NoticeDetail.tiles";
   }

   @RequestMapping("NoticeEdit.hst")
   public String noticeEdit(@RequestParam Map map, Model model) {

      Object no = map.get("no");
      Object content = map.get("content");
      Object title = map.get("title");

      model.addAttribute("no", no);
      model.addAttribute("content", content);
      model.addAttribute("title", title);

      return "NoticeUpdate.ad_tiles";
   }

   @RequestMapping("NoticeUpdate.hst")
   public String noticeUpdate(@RequestParam Map map, Model model) {

      int check = adminService.updateNotice(map);
      System.out.println(check);

      return "NoticeDetail.tiles";
   }

   
   @RequestMapping("NoticeDelete.hst")
   public String noticeEdit(@RequestParam Map map) {

      int check = adminService.deleteNotice(map);
      System.out.println(check);

      return "forward:Notice.hst";
   }

	@RequestMapping(value="NoticeImages.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String noticeImg(Model model) {
	
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		List<BoardDTO> list = adminService.selectImage();
		System.out.println(list);
		for(BoardDTO val:list)
		{
			System.out.println("파주: " + val.getFile_addr());
			System.out.println("파넘: " + val.getNoti_no());
		}
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
//		System.out.println(JSONArray.toJSONString(list));
		model.addAttribute("list", list);
		
		return jsonStr.toString();
	}

}