package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.PrescriptionDTO;
import com.kosmo.proj.service.PrescriptionService;

@Repository("presDAO")
public class PrescriptionDAO implements PrescriptionService {
 
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;
	
	
	@Override
	public List<Map> selectPre(Map map) {
		List<Map> list = sqlMapper.selectList("presSelectList",map);
		return list;
	}

	@Override
	public int insertPre(Map map) {
		return sqlMapper.insert("presInsert",map);
	}

	@Override
	public int takePills(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("takePills", map);
	}

	@Override
	public int getCurrCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getCurrCount", map);
	}

	@Override
	public int alarmInsert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("alarmInsert",map);
	}

	@Override
	public int alarmDelete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("alarmDelete",map);
	}

	@Override
	public List<Map> alarmSelect(String preno) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("alarmSelect",preno);
	}

}
