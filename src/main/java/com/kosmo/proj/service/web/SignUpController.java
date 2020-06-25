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

	@ResponseBody
	@RequestMapping(value = "/Member/HospitalSearch.hst", produces = "text/html; charset=UTF-8")
	public String hospitalSearch(@RequestParam Map map, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
//		int total = adminService.getTotalRecordAptSearch(map);
//		System.out.println(total);
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



}












//	//입력
//	@RequestMapping(value = "/Member/Insert.hst", method = RequestMethod.POST)
//	public String insert(@RequestParam Map map, Model model)
//	{
//		memberService.insert(map);
//		return "index.tiles";
//	}
//
//	//삭제
//	@RequestMapping("/Member/Delete.hst")
//	public String delete(@RequestParam Map map, Model model)
//	{
//		memberService.delete(map);
//		return "index.tiles";
//	}
//
//	//수정
//	@RequestMapping("/Member/Update.hst")
//	public String update(@RequestParam Map map, Model model)
//	{
//		memberService.update(map);
//		return "";
//	}



