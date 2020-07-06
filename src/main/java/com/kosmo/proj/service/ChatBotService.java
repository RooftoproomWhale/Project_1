package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface ChatBotService {
	List<Map> selectList(Map map);
	
	List<Map> selectPreList(Map map);
}
