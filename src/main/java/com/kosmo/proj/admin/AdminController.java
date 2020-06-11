package com.kosmo.proj.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/Admin/")
@Controller
public class AdminController {
	
	@RequestMapping("Test.hst")
	public String test()
	{
		return "Ad_Sidebar.ad_tiles";
	}
	
	@RequestMapping("Index.hst")
	public String toIndex()
	{
		return "Ad_Index.ad_tiles";
	}
	
	@RequestMapping("Accounts.hst")
	public String toAccounts()
	{
		return "Accounts.ad_tiles";
	}
	
	@RequestMapping("Appointment.hst")
	public String toBookings()
	{
		return "Appointment.ad_tiles";
	}
	
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
	
	@RequestMapping("Chart.hst")
	public String toChart()
	{
		return "Chart.ad_tiles";
	}
	
	@RequestMapping("HosAuth.hst")
	public String toHosAuth()
	{
		return "HosAuth.ad_tiles";
	}
	@RequestMapping("Notice.hst")
	public String noticeWrite()
	{
		return "NoticeWrite.ad_tiles";
	}
	
//	@RequestMapping("Login.hst")
//	public String toLogin()
//	{
//		return "Ad_Login.ad_tiles";
//	}
//	
//	@RequestMapping("Register.hst")
//	public String toRegister()
//	{
//		return "Register.ad_tiles";
//	}
//	
//	@RequestMapping("Forget-pass.hst")
//	public String toForget()
//	{
//		return "Ad_Forget-pass.ad_tiles";
//	}
	
	
}
