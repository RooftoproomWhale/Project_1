package com.kosmo.proj.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.CalendarDTO;

@Controller
public class CalendarController {

	@RequestMapping("/Calendar/View.hst")
	@ResponseBody
	public List<CalendarDTO> selectEventList(@RequestParam Map map) {
		List<CalendarDTO> list = new Vector<CalendarDTO>();

//		HashMap<String, CalendarVO> javaMap = new HashMap<String, CalendarVO>();
//		list.add(new CalendarVO(1,"Kim","가그린목액","복용약등록","2020-06-08", "2020-06-12", null, null,"false"));
//		list.add(new CalendarVO(2,"Kim","병원예약","병원예약","2020-06-08", "2020-06-12", null, "#E5D85C","false"));
		return list;
	}

	@RequestMapping("/Calendar/calendar.hst")
	public String calendar() {
		return "calendar.tiles";
	}
	

}