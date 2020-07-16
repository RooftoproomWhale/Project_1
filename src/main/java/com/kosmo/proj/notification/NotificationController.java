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
import com.kosmo.proj.util.FcmUtil;

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
		System.out.println("dayApt: " + dayAptCount);
		
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
		System.out.println("preApt: " + preAptCount);
		
		return preAptCount;
	}

	@ResponseBody
	@RequestMapping("/Noti/currAptCount.hst")
	public int currAptCount(@RequestParam Map map, Model model, Authentication auth)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		map.put("user", user);
		int currAptCount = notificationService.currAptCount(map);
		System.out.println("currApt: " + currAptCount);
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
	
	@ResponseBody
	@RequestMapping("/Noti/authCount.hst")
	public int authCount(@RequestParam Map map, Model model)
	{
		int authCount = notificationService.authCount(map);
		System.out.println("auth: " + authCount);
		return authCount;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/preAuthCount.hst")
	public int preAuthCount(@RequestParam Map map, Model model)
	{
		int preAuthCount = notificationService.preAuthCount(map);
		System.out.println("preAuth: " + preAuthCount);
		return preAuthCount;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/currAuthCount.hst")
	public int currAuthCount(@RequestParam Map map, Model model)
	{
		int currAuthCount = notificationService.currAuthCount(map);
		System.out.println("currAuth: " + currAuthCount);
		return currAuthCount;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/preAptCountUser.hst")
	public int preAptCountUser(@RequestParam Map map, Model model, Authentication auth)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		map.put("user", user);
		int preAptCountUser = notificationService.preAptCountUser(map);
		System.out.println("preAptCountUser: " + preAptCountUser);
		return preAptCountUser;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/currAptCountUser.hst")
	public int currAptCountUser(@RequestParam Map map, Model model, Authentication auth)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities = userDetails.getAuthorities();
		String user = userDetails.getUsername();
		map.put("user", user);
		int currAptCountUser = notificationService.currAptCountUser(map);
	
		return currAptCountUser;
	}
	
	//Android FCM
	@ResponseBody
	@RequestMapping("/Noti/androidFCM.hst")
	public int androidFCM(@RequestParam Map map, Model model, Authentication auth)
	{
		
//		신건웅
		String tokenId="dlnZZSKAT20:APA91bHfEEG_DUZmG52zoKHXhIOkHbYAHSD2o1PLnVt6RbAuutkGuNlci5M07vVXozVPdtatGTsTqovYIJUDN5x29uTFLczHIVSgC1eT7A_cKdAUfDzjFvSgw3dgN9Uix8_oCFks449E";
//		윤성준
//		String tokenId="dg_JwbyU3dg:APA91bEQn6_sF0YzLhml495282pt6bJfs2KRRysGRyFjRDiE7kbCc5A33p412_5hyD0wkHcmre6Lb1KfZi-wr1yHbtWNizovyS_BsW0ZEwkId2hYLvT5IrqjFvjatlPZ0mtd3jQ2-UBf";
		String title="복약 알림입니다";
		String content = "지금 복용해야할 약이 있습니다";
		
		FcmUtil fcmUtil = new FcmUtil();
		fcmUtil.send_FCM(tokenId, title, content);
	
		return 0;
	}
	
}
