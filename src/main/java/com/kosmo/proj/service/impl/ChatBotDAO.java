package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.ChatBotService;

@Repository("chatBotDAO")
public class ChatBotDAO implements ChatBotService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("getReservationByEmail", map);
	}

	@Override
	public List<Map> selectPreList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("getPresByUser", map);
	}

	@Override
	public int deleteReservation(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteReservation", map);
	}

	@Override
	public int insertReservation(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("InsertReservation", map);
	}

	@Override
	public List<Map> selectHospitalList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("searchHospital", map);
	}

}
