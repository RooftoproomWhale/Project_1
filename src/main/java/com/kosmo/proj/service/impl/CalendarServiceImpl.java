package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.CalendarDTO;
import com.kosmo.proj.service.CalendarService;
import com.kosmo.proj.service.ReservationDTO;


@Service("CalendarService")
public class CalendarServiceImpl implements CalendarService {

	@Resource(name="calendarDAO")
	private CalendarDAO dao;

	
	@Override
	public List<CalendarDTO> selectList(Map map) {
		return dao.selectList(map);
	}
	@Override
	public List<ReservationDTO> selectList2(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList2(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}
	

	

	@Override
	public int update(Map map) {
		return dao.update(map);
	}


	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

}
