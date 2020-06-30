package com.kosmo.proj.notification;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.PrescriptionDTO;

@Repository
public class NotificationDAO implements NotificationService {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<PrescriptionDTO> takeTime(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("takeTime", map);
	}

	@Override
	public int currAptCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("notiAptCount", map);
	}

	@Override
	public int dayAptCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("dayAptCount", map);
	}

	@Override
	public int preAptCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("notiAptCount", map);
	}

	@Override
	public int authCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("notiAuthCount", map);
	}

	@Override
	public int preAuthCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("notiAuthCount", map);
	}

	@Override
	public int currAuthCount(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("notiAuthCount", map);
	}
}
