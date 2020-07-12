package com.kosmo.proj.hosp;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.ReservationDTO;

@Service("hosService")
public class HospServiceImpl implements HosService{

	@Resource(name = "hosDAO")
	private HosDAO dao;

	@Override
	public boolean islogin(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return false;
	}

	@Override
	public String hosp_code(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.hosp_code(map);
	}

	@Override
	public String hosp_name(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.hosp_name(map);
	}

	@Override
	public String tel(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.tel(map);
	}

	@Override
	public int weekday_open(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.weekday_open(map);
	}

	@Override
	public int weekday_close(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.weekday_close(map);
	}

	@Override
	public int weekend_open(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.weekend_open(map);
	}

	@Override
	public int weekend_close(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.weekend_close(map);
	}

	@Override
	public String lunchtime(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.lunchtime(map);
	}

	@Override
	public String address(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.address(map);
	}

	@Override
	public float cor_x(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.cor_x(map);
	}

	@Override
	public float cor_y(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.cor_y(map);
	}

	@Override
	public String id(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.id(map);
	}

	@Override
	public String auth(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.auth(map);
	}

	@Override
	public Date approved_date(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.approved_date(map);
	}

	@Override
	public String dept_name(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.dept_name(map);
	}

	@Override
	public int delete(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.update(map);
	}

	@Override
	public List<HospitalDTO> selecthos(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.selecthos(map);
	}

	@Override
	public List<MemberDTO> selectmem(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectmem(map);
	}

	@Override
	public List<ReservationDTO> selectres(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectres(map);
	}

	@Override
	public String email(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}

	@Override
	public int updatehosdept(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.updatehosdept(map);
	}

	@Override
	public int updatehos(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.updatehos(map);
	}

	@Override
	public int deletedept(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.deletedept(map);
	}

	@Override
	public int updateRes(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.updateRes(map);
	}

	@Override
	public int deniedRes(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.deniedRes(map);
	}

	@Override
	public int withdraw(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return dao.withdraw(map);
	}
	

}
