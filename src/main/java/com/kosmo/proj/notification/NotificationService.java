package com.kosmo.proj.notification;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.PrescriptionDTO;

public interface NotificationService {

	List<PrescriptionDTO> takeTime(Map map);
	
	int preAptCount();
	int aptGapCount(Map map);
}
