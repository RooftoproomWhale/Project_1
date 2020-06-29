package com.kosmo.proj.notification;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
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
	@RequestMapping("/Noti/preAptCount.hst")
	public int preCount()
	{
		int preAptCount = notificationService.preAptCount();
		System.out.println(preAptCount);
		
		return preAptCount;
	}

	@ResponseBody
	@RequestMapping("/Noti/hosAptGap.hst")
	public int hosAptGap(@RequestParam Map map, Model model)
	{
		int currAptCount = notificationService.aptGapCount(map);
		System.out.println(currAptCount);
		return currAptCount;
	}
	
	@ResponseBody
	@RequestMapping("/Noti/getMediTime.hst")
	public String mediTime(@RequestParam Map map, Model model)
	{
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
