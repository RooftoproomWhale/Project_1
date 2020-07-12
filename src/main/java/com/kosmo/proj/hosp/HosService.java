package com.kosmo.proj.hosp;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.ReservationDTO;

public interface HosService {

	boolean islogin(Map map);
	
	String hosp_code(Map map);
	String hosp_name(Map map);
	String tel(Map map);
	int weekday_open(Map map);
	int weekday_close(Map map);
	int weekend_open(Map map);
	int weekend_close(Map map);
	String lunchtime(Map map);
	String address(Map map);
	float cor_x(Map map);
	float cor_y(Map map);
	String id(Map map);
	String auth(Map map);
	Date approved_date(Map map);
	String dept_name(Map map);
	String email(Map map);
	
	int delete(Map map);
	int update(Map map);
	//병원정보
	List<HospitalDTO> selecthos(Map map);
	List<MemberDTO> selectmem(Map map);
	int updatehosdept(Map map);
	int updatehos(Map map);
	int deletedept(Map map);
	//예약정보
	List<ReservationDTO> selectres(Map map);
	int updateRes(Map map);
	int deniedRes(Map map);
	int withdraw(Map map);
}
