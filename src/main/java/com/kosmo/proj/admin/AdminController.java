package com.kosmo.proj.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/Admin/")
@Controller
public class AdminController {
	
	//관리자 화면 이동
	@RequestMapping("Index.hst")
	public String toIndex()
	{
		return "Ad_Index.ad_tiles";
	}
	
	@RequestMapping("Table.hst")
	public String toTable()
	{
		return "Table.ad_tiles";
	}
	
	@RequestMapping("Map.hst")
	public String toMap()
	{
		return "Ad_Map.ad_tiles";
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
	
	@RequestMapping("Login.hst")
	public String toLogin()
	{
		return "Ad_Login.ad_tiles";
	}
	
	@RequestMapping("Register.hst")
	public String toRegister()
	{
		return "Register.ad_tiles";
	}
	
	@RequestMapping("Forget-pass.hst")
	public String toForget()
	{
		return "Ad_Forget-pass.ad_tiles";
	}
	
	
}
