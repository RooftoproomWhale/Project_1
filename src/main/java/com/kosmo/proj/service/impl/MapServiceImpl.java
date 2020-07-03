package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MapService;
import com.kosmo.proj.service.PharmacyDTO;

@Service("mapService")
public class MapServiceImpl implements MapService{

	@Resource(name = "mapDao")
	private MapDao dao;
	
	@Override
	public List<Map> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public List<Map> selectPharmacyList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPharmacyList(map);
	}

	@Override
	public List<Map> searchHospitalList(Map map) {
		// TODO Auto-generated method stub
		return dao.searchHospitalList(map);
	}

	@Override
	public List<Map> searchPharmacyList(Map map) {
		// TODO Auto-generated method stub
		return dao.searchPharmacyList(map);
	}

	@Override
	public List<Map> selectHospitalOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectHospitalOne(map);
	}

	@Override
	public List<Map> selectPharmacyOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPharmacyOne(map);
	}

	@Override
	public List<HospitalDTO> selectHospitalByXY(Map map) {
		// TODO Auto-generated method stub
		return dao.selectHospitalByXY(map);
	}

	@Override
	public List<PharmacyDTO> selectPharmacyByXY(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPharmacyByXY(map);
	}

	@Override
	public List<Map> selectHospitalList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectHospitalList(map);
	}

	@Override
	public int selectCntReservation(Map map) {
		// TODO Auto-generated method stub
		return dao.selectCntReservation(map);
	}

	@Override
	public int insertReservation(Map map) {
		// TODO Auto-generated method stub
		return dao.insertReservation(map);
	}

	@Override
	public List<Map> getSymptom(Map map) {
		// TODO Auto-generated method stub
		return dao.getSymptom(map);
	}

}
