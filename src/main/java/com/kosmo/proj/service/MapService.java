package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface MapService {
	//확진자 동선
	List<Map> selectList();
	//병원 목록
	List<Map> selectList(Map map);
	//약국 목록
	List<Map> selectPharmacyList(Map map);
	//검색 목록
	List<Map> searchHospitalList(Map map);
	List<Map> searchPharmacyList(Map map);
	//목록 상세보기
	List<Map> selectHospitalOne(Map map);
	List<Map> selectPharmacyOne(Map map);
	//현재 위치 기준 병원,약국 불러오기
	List<HospitalDTO> selectHospitalByXY(Map map);
	List<PharmacyDTO> selectPharmacyByXY(Map map);
}
