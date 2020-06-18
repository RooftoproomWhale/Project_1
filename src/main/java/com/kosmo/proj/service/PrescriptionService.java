package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

public interface PrescriptionService {
	List<PrescriptionDTO> selectPre(Map map);
	int insertPre(Map map);
}
