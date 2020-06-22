package com.kosmo.proj.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.ReservationDTO;


@RequestMapping(value = "/Admin/")
@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	//관리자 홈페이지
	@RequestMapping("Index.hst")
	public String toIndex(Model model)
	{
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
		
		return "Ad_Index.ad_tiles";
	}
	
	//회원 관리
	@RequestMapping("Accounts.hst")
	public String toAccounts(@RequestParam Map map, Paging vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
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
		List<MemberDTO> list =adminService.selectList_All(vo);
		for(MemberDTO val:list)
		{
			System.out.println(val.getMem_name());
		}
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "Accounts.ad_tiles";
	}
	
	@RequestMapping("AccountsUser.hst")
	public String accountsUser(@RequestParam Map map, Model model)
	{
		List<MemberDTO> list =adminService.selectList_User(map);
		for(MemberDTO val:list)
		{
			System.out.println(val.getMem_name());
		}
		model.addAttribute("list", list);
		return "AccountsU.ad_tiles";
	}
	
	@RequestMapping("AccountsHosp.hst")
	public String accountsHosp(@RequestParam Map map, Model model, ModelMap modelmap)
	{
		List<MemberDTO> list =adminService.selectList_Hosp(map);
		for(MemberDTO val:list)
		{
			System.out.println(val.getMem_name());
		}
		String flag = "user";
		model.addAttribute("list", list);
		modelmap.addAttribute("flag", flag);
		return "AccountsH.ad_tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "UserUpdateForm.hst", produces = "text/html; charset=UTF-8")
	public String userUpdateForm(@RequestParam Map map, Model model)
	{
		ObjectMapper mapper = new ObjectMapper(); 
		String jsonStr = null; 
		List<MemberDTO> list = adminService.selectOne(map);
		System.out.println(list);
	       try 
	       {
	           jsonStr = mapper.writeValueAsString(list); 
	       }
	       catch (JsonProcessingException e) 
	       {
	    	  e.printStackTrace(); 
	       }
		return jsonStr.toString();
	}
	
	@RequestMapping(value= "UserUpdate.hst", method=RequestMethod.POST)
	public String userUpdate(@RequestParam Map map, Model model)
	{
//		MemberDTO record = adminService.selectOne(map);
//		model.addAttribute("record", record);
		int update = adminService.update(map);
		System.out.println(update);
		return "Accounts.ad_tiles";
	}
	
	@ResponseBody
	@RequestMapping(value= "UserDelete.hst")
	public String userDelete(@RequestParam Map map)
	{
		int delete = adminService.delete(map);
		System.out.println(delete);
		String deletestr = Integer.toString(delete);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("del", deletestr);
	    
	    return jsonObject.toString();
	}
	
	@RequestMapping("AccountsSearch.hst")
	public String accountsSearch(@RequestParam Map map, Paging vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
		List<MemberDTO> list =adminService.selectList_Account_Search(map);
		for(MemberDTO val:list)
		{
			System.out.println(val.getMem_email());
			System.out.println(val.getMem_name());
		}
		model.addAttribute("list", list);
		
		return "Accounts.ad_tiles";
	}
	
	//예약 관리
	@RequestMapping("Appointment.hst")
	public String toAppointment(@RequestParam Map map, Paging vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
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
		List<ReservationDTO> list =adminService.selectList_Apt_All(vo);
		for(ReservationDTO val:list)
		{
			System.out.println(val.getHOSP_NAME());
			System.out.println(val.getRESERV_NO());
			System.out.println(val.getMEM_EMAIL());
			System.out.println(val.getAPPROVED());
		}
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "Appointment.ad_tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "AptViewForm.hst", produces = "text/html; charset=UTF-8")
	public String appointmentView(@RequestParam Map map )
	{
		ObjectMapper mapper = new ObjectMapper(); 
		String jsonStr = null; 
	       List<ReservationDTO> list = adminService.selectOneApt(map);
	       try 
	       {
	           jsonStr = mapper.writeValueAsString(list); 
	       }
	       catch (JsonProcessingException e) 
	       {
	    	  e.printStackTrace(); 
	       }
		
		return jsonStr.toString();
	}
	
	@RequestMapping(value = "AptDelete.hst", produces = "text/html; charset=UTF-8")
	public String appointmentDelete(@RequestParam Map map )
	{
	    int check = adminService.deleteApt(map);
		System.out.println(check);
		return "Appointment.ad_tiles";
	}
	
	@RequestMapping("AppointmentSearch.hst")
	public String appointmentSearch(@RequestParam Map map, Model model)
	{
		List<ReservationDTO> list =adminService.selectList_Appointment_Search(map);
		for(ReservationDTO val:list)
		{
			System.out.println(val.getHOSP_NAME());
			System.out.println(val.getMEM_NAME());
		}
		model.addAttribute("list", list);
		return "Appointment.ad_tiles";
	}
	//병원 제휴
	@RequestMapping("HosAuth.hst")
	public String toHosAuth(@RequestParam Map map, Paging vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
	{
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
		List<HospitalDTO> list =adminService.selectList_Auth_All(vo);
		for(HospitalDTO val:list)
		{
			System.out.println(val.getHosp_name());
		}
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "HosAuth.ad_tiles"; 
	}
	
	@RequestMapping("ApproveAuth.hst")
	public String approve(@RequestParam Map map, Model model)
	{
		int check = adminService.approveAuth(map);
		System.out.println(check);
		return "HosAuth.ad_tiles";
	}
	
	@RequestMapping("DenyAuth.hst")
	public String deny(@RequestParam Map map, Model model)
	{
		int check = adminService.denyAuth(map);
		System.out.println(check);
		return "HosAuth.ad_tiles";
	}
	
	@RequestMapping("HosAuthSearch.hst")
	public String hosAuthSearch(@RequestParam Map map, Model model)
	{
		List<HospitalDTO> list =adminService.selectList_Auth_Search(map);
		for(HospitalDTO val:list)
		{
			System.out.println(val.getHosp_name());
			System.out.println(val.getHosp_code());
		}
		model.addAttribute("list", list);
		return "HosAuth.ad_tiles";
	}
	
	@RequestMapping("HosAuthSearchNew.hst")
	public String hosAuthSearchNew()
	{
		return "HosAuth.ad_tiles";
	}
	
	//통계
	@RequestMapping("Counts.hst")
	@ResponseBody
	public String count(Model model)
	{
//		String memberCountStr = Integer.toString(memberCount);
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("count", memberCountStr);
		
//	    return jsonObject.toString();
		return "";
	}
	
	@RequestMapping("Chart.hst")
	public String toChart(Model model)
	{
		//age chart
		int under10 = adminService.under10Count();
		int over10under20 = adminService.over10under20Count();
		int over20under30 = adminService.over20under30Count();
		int over30under40 = adminService.over30under40Count();
		int over40under50 = adminService.over40under50Count();
		int over50under60 = adminService.over50under60Count();
		int over60 = adminService.over60Count();
		System.out.println("10세미만: " + under10 + " 10~19: " + over10under20 +" 20~29: " + over20under30 + " 30~39: " + over30under40 + " 40~49: " + over40under50 + " 50~59: " + over50under60 + " 60이상: " + over60);;
		model.addAttribute("under10", under10);
		model.addAttribute("over10under20", over10under20);
		model.addAttribute("over20under30", over20under30);
		model.addAttribute("over30under40", over30under40);
		model.addAttribute("over40under50", over40under50);
		model.addAttribute("over50under60", over50under60);
		model.addAttribute("over60", over60);
		//
		//gender chart
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
	public String recentChart()
	{
		return "Chart.ad_tiles";
	}
	
	@RequestMapping("GenderChart.hst")
	public String genderChart()
	{
		return "Chart.ad_tiles";
	}
	
	@RequestMapping("AgeChart.hst")
	public String ageChart()
	{
		return "Chart.ad_tiles";
	}
	
	//확진자 동선
	@RequestMapping("Corona_Map.hst")
	public String toMap()
	{
		return "CoronaMap.ad_tiles";
	}
	
	@RequestMapping("Form.hst")
	public String toForm()
	{
		return "Form.ad_tiles";
	}
	
	//공지사항
	@RequestMapping("Notice.hst")
	public String noticeWrite()
	{
		return "NoticeWrite.ad_tiles";
	}
	
	@RequestMapping("NoticeSubmit.hst")
	public String noticeView()
	{
		return "HosAuth.ad_tiles";
	}
	
	@RequestMapping("NoticeEdit.hst")
	public String noticeEdit()
	{
		return "NoticeEdit.ad_tiles";
	}
	
}
