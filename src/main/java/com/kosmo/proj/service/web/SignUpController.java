package com.kosmo.proj.service.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	//입력
	@RequestMapping(value = "/Member/Insert.hst", method = RequestMethod.POST)
	public String insert(@RequestParam Map map, Model model)
	{
		memberService.insert(map);
		return "index.tiles";
	}

	//삭제
	@RequestMapping("/Member/Delete.hst")
	public String delete(@RequestParam Map map, Model model)
	{
		memberService.delete(map);
		return "index.tiles";
	}

	//수정
	@RequestMapping("/Member/Update.hst")
	public String update(@RequestParam Map map, Model model)
	{
		memberService.update(map);
		return "";
	}


}
