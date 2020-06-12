package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MapService;
import com.kosmo.proj.service.PharmacyDTO;

@Repository
public class MapDao implements MapService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> selectList() {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("covidMapSelect");
	}

	@Override
	public List<Map> selectList(Map map) {
		// TODO Auto-generated method stub

//		return sqlMapper.selectList("hospitalSelect",map);
//		return sqlMapper.selectList("hospitalSelectByKeyWord",map);
		return sqlMapper.selectList("pharmacySelectByKeyWord",map);
	}

	@Override
	public List<Map> selectPharmacyList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("pharmacySelectByKeyWord",map);
	}

	@Override
	public List<Map> searchHospitalList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("hospitalNameSelectByKeyWord",map);
	}

	@Override
	public List<Map> searchPharmacyList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("pharmacyNameSelectByKeyWord",map);
	}

	@Override
	public List<Map> selectHospitalOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("hospitalDetailSelect",map);
	}

	@Override
	public List<Map> selectPharmacyOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("pharmacyDetailSelect",map);
	}

	@Override
	public List<HospitalDTO> selectHospitalByXY(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("hospitalSelectByXY",map);
	}

	@Override
	public List<PharmacyDTO> selectPharmacyByXY(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("pharmacySelectByXY",map);
	}



}
