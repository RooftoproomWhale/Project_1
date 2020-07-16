package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface PrescriptionService {
	List<Map> selectPre(Map map);
	int insertPre(Map map);
	
	//약 복용
	int getCurrCount(Map map);
	int takePills(Map map);
}
