package com.kosmo.proj.hosp;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.ReservationDTO;

@Repository
public class HosDAO implements HosService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public boolean islogin(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return false;
	}
	@Override
	public String hosp_code(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public String hosp_name(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public String tel(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public int weekday_open(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public int weekday_close(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public int weekend_open(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public int weekend_close(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public String lunchtime(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public String address(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public float cor_x(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public float cor_y(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public String id(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public String auth(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public Date approved_date(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public String dept_name(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public int delete(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public int update(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}
	@Override
	public List<HospitalDTO> selecthos(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.selectList("selecthos",map);
	}
	@Override
	public List<MemberDTO> selectmem(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.selectList("selectmem",map);
	}
	@Override
	public List<ReservationDTO> selectres(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.selectList("selectres",map);
	}
	@Override
	public String email(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
	@Override
	public int updatehosdept(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.insert("updatehosdept",map);
	}
	@Override
	public int updatehos(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.update("updatehos",map);
	}
	@Override
	public int deletedept(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.delete("deletedept",map);
	}
	@Override
	public int updateRes(Map map) {
		// TODO 자동 생성된 메소드 스텁
		return sqlMapper.update("updateRes", map);
	}
	
	
}
