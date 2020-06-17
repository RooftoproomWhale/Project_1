package com.kosmo.proj.service.web;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.proj.service.CalendarDTO;
import com.kosmo.proj.service.ReservationDTO;
import com.kosmo.proj.service.impl.CalendarServiceImpl;

@Controller
public class CalendarController {
	@Resource(name="CalendarService")
	private CalendarServiceImpl calendarDAO;


	@RequestMapping(value="/Calendar/View.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ViewCalendar(@RequestParam Map map,Authentication auth) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		 
		 map.put("id",id); 
		 System.out.println(id);
		 List<CalendarDTO> list = calendarDAO.selectList(map);
		 System.out.println(list);
		for(CalendarDTO date :list) {
			System.out.println(date.getMedi_name());
		}
		
		List<ReservationDTO> list2 = calendarDAO.selectList2(map);
		System.out.println(list2);
		for(ReservationDTO date :list2) {
			System.out.println(date.getHOSP_NAME());
			System.out.println(date.getDEPT_CODE());
			System.out.println(date.getMEM_EMAIL());
		}
		
		//title = 제품명 or 병원이름 
		
		
		 ObjectMapper mapper = new ObjectMapper(); String jsonStr = null; 
		 try {
		  jsonStr = mapper.writeValueAsString(list); 
		 
		  }catch (JsonProcessingException
		  e) { e.printStackTrace(); }
		 
		
		return jsonStr;
	}/////selectEventList  
	
	
	@RequestMapping(value="/Calendar/insert.hst")
	@ResponseBody
	public String insertCalendar(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("").toString();
		map.put("id",id);
		
		
		int result = calendarDAO.insert(map);
		
		return String.valueOf(result);
	}////insert
	
	@RequestMapping(value="/Calendar/update.hst")
	@ResponseBody
	public String updateCalendar(@RequestParam Map map) {
		int result = calendarDAO.update(map);
		return String.valueOf(result);
	}////update
	

	
	@RequestMapping(value="/Calendar/delete.hst")
	@ResponseBody
	public String deleteCalendar(@RequestParam Map map) {
		int result = calendarDAO.delete(map);
		return String.valueOf(result);
	}///delete
	
	

	@RequestMapping("/Calendar/calendar.hst")
	public String calendar() {
		return "calendar.tiles";
	}/////calendar
	
	

}///class