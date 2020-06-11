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

import com.kosmo.proj.service.CalendarVO;

@Controller
public class CalendarController {

	@RequestMapping("/Calendar/View.hst")
	@ResponseBody
	public List<CalendarVO> selectEventList(@RequestParam Map map) {
		List<CalendarVO> list = new Vector<CalendarVO>();

		HashMap<String, CalendarVO> javaMap = new HashMap<String, CalendarVO>();
		list.add(new CalendarVO("가그린목액", "2020-06-08", "2020-06-12", null, null, null, "false"));
		list.add(new CalendarVO("예약", "2020-06-08 13:00:00", "2020-06-08", null, "#E5D85C",null, "false"));
		return list;
	}

	@RequestMapping("/Calendar/calendar.hst")
	public String calendar() {
		return "calendar.tiles";
	}

}