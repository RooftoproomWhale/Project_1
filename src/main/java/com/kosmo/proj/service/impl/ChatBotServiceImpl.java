package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.ChatBotService;

@Service("chatBotService")
public class ChatBotServiceImpl implements ChatBotService{
	
	@Resource(name="chatBotDAO")
	private ChatBotDAO dao;
	
	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public List<Map> selectPreList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPreList(map);
	}

	@Override
	public int deleteReservation(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteReservation(map);
	}

	@Override
	public int insertReservation(Map map) {
		// TODO Auto-generated method stub
		return dao.insertReservation(map);
	}

}
