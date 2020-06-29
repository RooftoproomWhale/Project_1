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
	public int aptGapCount(Map map) {
		// TODO Auto-generated method stub
		return dao.aptGapCount(map);
	}

	@Override
	public int preAptCount() {
		// TODO Auto-generated method stub
		return dao.preAptCount();
	}
}
