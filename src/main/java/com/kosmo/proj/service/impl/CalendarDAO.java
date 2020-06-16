package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.CalendarDTO;
import com.kosmo.proj.service.CalendarService;

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
	public CalendarDTO selectOne(Map map) {
		return null;
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

	}




	
	
	

