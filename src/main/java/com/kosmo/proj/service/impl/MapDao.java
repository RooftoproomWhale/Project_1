package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.MapService;

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
		return sqlMapper.selectList("hospitalSelectByXY",map);

	}

}
