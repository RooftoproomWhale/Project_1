package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface QnAService {

	//로그인 용]
	boolean isLogin(Map map);
	//목록용]
	List<QnADTO> listQnA(Map map);
	//전체 레코드 수]
	int getTotalRecord(Map map);
	//상세보기용]
	QnADTO selectOne(Map map);
	//입력/수정/삭제용]
	int deleteQnA(Map map);
	int insertQnA(Map map);
	int updateQnA(Map map);
}