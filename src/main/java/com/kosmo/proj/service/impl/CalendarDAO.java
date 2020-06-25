package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.CalendarDTO;
import com.kosmo.proj.service.CalendarService;
import com.kosmo.proj.service.ReservationDTO;

@Repository("calendarDAO")
public class CalendarDAO implements CalendarService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	

	@Override
	public List<CalendarDTO> selectList(Map map) {
		List<CalendarDTO> list = sqlMapper.selectList("calendarSelectList",map);

		return list;
	}
	
	@Override
	public List<ReservationDTO> selectList2(Map map) {
	
		List<ReservationDTO> list = sqlMapper.selectList("calendarSelectList2",map);

		return list;
	}




	@Override
	public int insert(Map map) {
		return sqlMapper.insert("calendarInsert",map);
	}


	
	@Override
	public int update(Map map) {
		return sqlMapper.update("calendarUpdate", map);
	}
	


	@Override
	public int delete(Map map) {
		return sqlMapper.delete("calendarDelete",map);
	}
	@Override
	public int delete2(Map map) {

		return sqlMapper.delete("calendarDelete2",map);
	}

	public List<ReservationDTO> selectnew(Map map) {
		
		return sqlMapper.selectList("seletnew", map);
	}


	



	}




	
	
	

