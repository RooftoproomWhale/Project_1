package com.kosmo.proj.notification;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.PrescriptionDTO;

public interface NotificationService {

	List<PrescriptionDTO> takeTime(Map map);
	
	int dayAptCount(Map map);
	int preAptCount(Map map);
	int currAptCount(Map map);
	
	int authCount(Map map);
	int preAuthCount(Map map);
	int currAuthCount(Map map);
}
