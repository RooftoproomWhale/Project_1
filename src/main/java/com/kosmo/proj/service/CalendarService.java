package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	//목록 불러오기
	List<CalendarDTO> selectList(Map map);
	
	List<ReservationDTO> selectList2(Map map);
	//입력 수정 삭제
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
	int delete2(Map map);
	
	
	
	
	
}
