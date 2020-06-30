package com.kosmo.proj.notification;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.PrescriptionDTO;

@Controller
public class NotificationController {
	
	@Resource(name = "notificationService")
	private NotificationService notificationService;

	@ResponseBody
	@RequestMapping("/Noti/dayAptCount.hst")
	public int dayCount(@RequestParam Map map, Authentication auth)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		Date date = new Date(); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("getday: " + format.format(date));
		String today = format.format(date);
		map.put("user", user);
		map.put("today", today);
		int dayAptCount = notificationService.dayAptCount(map);
		System.out.println("day: " + dayAptCount);
		
		return dayAptCount;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/preAptCount.hst")
	public int preCount(@RequestParam Map map, Authentication auth)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		map.put("user", user);
		int preAptCount = notificationService.preAptCount(map);
		System.out.println("pre: " + preAptCount);
		
		return preAptCount;
	}

	@ResponseBody
	@RequestMapping("/Noti/hosAptGap.hst")
	public int hosAptGap(@RequestParam Map map, Model model, Authentication auth)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		map.put("user", user);
		int currAptCount = notificationService.aptGapCount(map);
		System.out.println("curr: " + currAptCount);
		return currAptCount;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/getMediTime.hst")
	public String mediTime(@RequestParam Map map, Model model, Authentication auth) throws ParseException
	{
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		map.put("user", user);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		List<PrescriptionDTO> list = notificationService.takeTime(map);
		for(PrescriptionDTO item:list)
		{
			System.out.println(item.getAlarm());
		}
		
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonStr.toString();
	}
}
