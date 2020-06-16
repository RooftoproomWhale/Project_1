package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.proj.service.MemberDTO;


@RequestMapping(value = "/Admin/")
@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	//관리자 홈페이지
	@RequestMapping("Index.hst")
	public String toIndex()
	{
		return "Ad_Index.ad_tiles";
	}
	
	//회원 관리
	@RequestMapping("Accounts.hst")
	public String toAccounts(@RequestParam Map map, Model model)
	{
		List<MemberDTO> list =adminService.selectList(map);
		model.addAttribute("list", list);
		return "Accounts.ad_tiles";
	}
	
	
	@RequestMapping( value= "UserUpdate.hst", method=RequestMethod.POST)
	public String userUpdate(@RequestParam Map map, Model model)
	{
		return "Accounts.ad_tiles";
	}
	
	//예약 관리
	@RequestMapping("Appointment.hst")
	public String toBookings()
	{
		return "Appointment.ad_tiles";
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
	
	//통계
	@RequestMapping("Chart.hst")
	public String toChart()
	{
		return "Chart.ad_tiles";
	}
	
	//병원 제휴
	@RequestMapping("HosAuth.hst")
	public String toHosAuth()
	{
		return "HosAuth.ad_tiles";
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
