package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface MapService {
	//확진자 동선
	List<Map> selectList();
	//병원 목록
	List<Map> selectList(Map map);
}
