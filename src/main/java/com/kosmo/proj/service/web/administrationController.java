package com.kosmo.proj.service.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.protobuf.DescriptorProtos.SourceCodeInfo.Location;
import com.kosmo.proj.service.PrescriptionService;

@Controller
public class administrationController {

	@Resource(name = "presService")
	private PrescriptionService prescriptionService;
	
	
	@RequestMapping("/Administration/administration.hst")
	public String administration()
	{
		return "administration.tiles";
	}
	
	
	@RequestMapping("/Administration/takePills.hst")
	public String takePills(@RequestParam Map map, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String returnValue = "";
		int currCount = prescriptionService.getCurrCount(map);
		System.out.println(currCount);
		if(currCount == 0)
		{
//			out.println("<script>alert('복용이 끝났습니다');</script>");
//			out.flush();
			returnValue = "redirect:/mypage/administration.hst";
		}
		else
		{
			int check = prescriptionService.takePills(map);
			System.out.println(check);
			returnValue = "redirect:/mypage/administration.hst";
		}
		return returnValue;
	}
}
