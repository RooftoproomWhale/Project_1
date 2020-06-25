package com.kosmo.proj.service.web;

import java.util.ArrayList;
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
import com.kosmo.proj.service.MedicineInfoDTO;
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
		 ObjectMapper mapper = new ObjectMapper(); 
		 	String jsonStr = null; 
			 String jsonStr2 = null; 
			 try {
		 if(map.get("retitles").equals("예약리스트")) {
			
			 List<ReservationDTO> list2 = calendarDAO.selectList2(map);
			 jsonStr2 = mapper.writeValueAsString(list2); 
			 jsonStr = "[]";
			 
		 	}
		 else {
			 System.out.println("캘린더 실행");
		 List<CalendarDTO> list = calendarDAO.selectList(map);
		 List<ReservationDTO> list2 = calendarDAO.selectList2(map);
	  jsonStr = mapper.writeValueAsString(list); 
	  jsonStr2 = mapper.writeValueAsString(list2); 
		 }}catch (JsonProcessingException
		  e) { e.printStackTrace(); }

		 String str="";
		 if(jsonStr.equals("[]") || jsonStr2.equals("[]")) {
			str = jsonStr;
			if(str.equals("[]")) {
				str = jsonStr2;
			}
		 }
		 else{
		 jsonStr = jsonStr.substring(0,jsonStr.length()-1);
		 jsonStr2 = jsonStr2.substring(1);
		 str = jsonStr+","+jsonStr2;
		 }
		return str;
	}/////selectEventList  
	
	
	@RequestMapping(value="/Calendar/insert.hst")
	@ResponseBody
	public String insertCalendar(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("").toString();
		map.put("id",id);
		//insert into prescription VALUES(SEQ_PRESCRIPTION.nextval,#{},#{},#{],#{},#{});
		
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
		int result;

		if(map.get("type").equals("복용약등록")) {
		result = calendarDAO.delete(map);
		}
		else {
		result = calendarDAO.delete2(map);
		}
		return String.valueOf(result);
	}///delete
	//


	@RequestMapping("/Calendar/calendar.hst")
	public String calendar() {
		return "calendar.tiles";
	}/////calendar
	
	

}///class