package com.kosmo.proj.notification;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.PrescriptionDTO;


@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	@Resource(name = "notificationDAO")
	private NotificationDAO dao;

	@Override
	public List<PrescriptionDTO> takeTime(Map map) {
		// TODO Auto-generated method stub
		return dao.takeTime(map);
	}

	@Override
	public int currAptCount(Map map) {
		// TODO Auto-generated method stub
		return dao.currAptCount(map);
	}

	@Override
	public int dayAptCount(Map map) {
		// TODO Auto-generated method stub
		return dao.dayAptCount(map);
	}

	@Override
	public int preAptCount(Map map) {
		// TODO Auto-generated method stub
		return dao.preAptCount(map);
	}

	@Override
	public int authCount(Map map) {
		// TODO Auto-generated method stub
		return dao.authCount(map);
	}

	@Override
	public int preAuthCount(Map map) {
		// TODO Auto-generated method stub
		return dao.preAuthCount(map);
	}

	@Override
	public int currAuthCount(Map map) {
		// TODO Auto-generated method stub
		return dao.currAuthCount(map);
	}

	@Override
	public int preAptCountUser(Map map) {
		// TODO Auto-generated method stub
		return dao.preAptCountUser(map);
	}

	@Override
	public int currAptCountUser(Map map) {
		// TODO Auto-generated method stub
		return dao.currAptCountUser(map);
	}
}
