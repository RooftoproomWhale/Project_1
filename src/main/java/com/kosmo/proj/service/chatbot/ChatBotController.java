package com.kosmo.proj.service.chatbot;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.proj.service.ChatBotService;

@RestController
@RequestMapping("/Android/ChatBot")
public class ChatBotController {
	
	@Resource(name = "chatBotService")
	private ChatBotService service;
	
	@CrossOrigin
	@GetMapping(value = "/GetReservation", produces = "text/plain;charset=UTF-8")
	public String getReservation(@RequestParam Map map)
	{
		List<Map> resList  = service.selectList(map);
		
		for(Map res:resList)
		{
			res.put("APPLY_TIME",res.get("APPLY_TIME").toString());
		}
		return JSONArray.toJSONString(resList);
	}
	
	@CrossOrigin
	@GetMapping(value = "/GetPrescription", produces = "text/plain;charset=UTF-8")
	public String getPrescription(@RequestParam Map map)
	{
		List<Map> preList  = service.selectPreList(map);
		
		return JSONArray.toJSONString(preList);
	}
	
	@CrossOrigin
	@GetMapping(value = "/DeleteReservation", produces = "text/plain;charset=UTF-8")
	public int deleteReservation(@RequestParam Map map)
	{
		int affected = service.deleteReservation(map);
		
		return affected;
	}
	
	@CrossOrigin
	@PostMapping(value = "/InsertReservation", produces = "text/plain;charset=UTF-8")
	public int InsertReservation(@RequestParam Map map)
	{
//		String hospName = map.get("hosp_name").toString();
		
		int affected = service.insertReservation(map);
		
		return affected;
	}
}
