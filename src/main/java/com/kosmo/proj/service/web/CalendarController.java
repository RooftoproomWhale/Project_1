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

	@RequestMapping("/Calendar/View.do")
	@ResponseBody
	public List<CalendarVO> selectEventList(@RequestParam Map map) {
		List<CalendarVO> list = new Vector<CalendarVO>();

		HashMap<String, CalendarVO> javaMap = new HashMap<String, CalendarVO>();
		list.add(new CalendarVO("db이벤트1", "2020-05-04", "2020-05-07", null, null, null, "false"));
		list.add(new CalendarVO("db이벤트2", "2019-09-23", "2019-09-26", null, null, null, "false"));
		list.add(new CalendarVO("db이벤트3", "2019-09-23", "2019-09-26", null, null, null, "false"));

		return list;
	}

	@RequestMapping("/Calendar/calendar.hst")
	public String calendar() {
		return "calendar.tiles";
	}

}