package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.MapService;

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

}
