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
	public List<PrescriptionDTO> selectPre(Map map) {
		return dao.selectPre(map);
	}

	@Override
	public int insertPre(Map map) {
		return dao.insertPre(map);
	}
	
}
