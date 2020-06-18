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
	public String toAccounts(@RequestParam Map map, Model model)
	{
		List<MemberDTO> list =adminService.selectList_All(map);
		for(MemberDTO val:list)
		{
			System.out.println(val.getMem_name());
		}
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
	
	@RequestMapping("UserUpdateForm.hst")
	public String userUpdateForm(@RequestParam Map map, Model model)
	{
		MemberDTO record = adminService.selectOne(map);
		System.out.println(map.get("userEmail"));
		System.out.println(record.getAge());
		model.addAttribute("record", record);
		return "Accounts.ad_tiles";
	}
	
	@RequestMapping(value= "UserUpdate.hst", method=RequestMethod.POST)
	public String userUpdate(@RequestParam Map map, Model model)
	{
//		MemberDTO record = adminService.selectOne(map);
//		model.addAttribute("record", record);
		int update = adminService.update(map);
		System.out.println(update);
		return "/Admin/Accounts.hst";
	}
	@ResponseBody
	@RequestMapping( value= "UserDelete.hst")
	public String userDelete(@RequestParam Map map)
	{
		System.out.println(map.get("userEmail"));
		int delete = adminService.delete(map);
		System.out.println(delete);
		String deletestr = Integer.toString(delete);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("del", deletestr);
	    
	    return jsonObject.toString();
	}
	
	//예약 관리
	@RequestMapping("Appointment.hst")
	public String toAppointment(@RequestParam Map map, Model model)
	{
		List<HospitalDTO> list =adminService.selectList_Apt_All(map);
		for(HospitalDTO val:list)
		{
//			System.out.println(val.getMem_name());
		}
		model.addAttribute("list", list);
		
		return "Appointment.ad_tiles";
	}
	
	//병원 제휴
	@RequestMapping("HosAuth.hst")
	public String toHosAuth(@RequestParam Map map, Model model)
	{
		List<HospitalDTO> list =adminService.selectList_Auth_All(map);
		for(HospitalDTO val:list)
		{
//			System.out.println(val.getMem_name());
		}
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
	public String toChart()
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
