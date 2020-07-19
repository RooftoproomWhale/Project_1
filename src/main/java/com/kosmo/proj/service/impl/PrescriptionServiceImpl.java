package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.PrescriptionDTO;
import com.kosmo.proj.service.PrescriptionService;

@Service("presService")
public class PrescriptionServiceImpl implements PrescriptionService{
	@Resource(name="presDAO")
	private PrescriptionDAO dao;

	@Override
	public List<Map> selectPre(Map map) {
		return dao.selectPre(map);
	}

	@Override
	public int insertPre(Map map) {
		return dao.insertPre(map);
	}

	@Override
	public int takePills(Map map) {
		// TODO Auto-generated method stub
		return dao.takePills(map);
	}

	@Override
	public int getCurrCount(Map map) {
		// TODO Auto-generated method stub
		return dao.getCurrCount(map);
	}

	@Override
	public int alarmInsert(Map map) {
		// TODO Auto-generated method stub
		return dao.alarmInsert(map);
	}

	@Override
	public int alarmDelete(Map map) {
		// TODO Auto-generated method stub
		return dao.alarmDelete(map);
	}

	@Override
	public List<Map> alarmSelect(String preno) {
		// TODO Auto-generated method stub
		return dao.alarmSelect(preno);
	}
	
}
