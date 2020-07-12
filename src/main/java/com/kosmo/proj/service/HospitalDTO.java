package com.kosmo.proj.service;

import java.util.Date;

public class HospitalDTO {
	private String hosp_code;
	private String hosp_name;
	private String tel;
	private String weekday_open;
	private String weekday_close;
	private String weekend_open;
	private String weekend_close;
	private String lunchtime;
	
	private String mem_pwd;
	
	private String address;
	private float cor_x;
	private float cor_y;
	private String id;
	private String auth;
	private Date approved_date;
	private String ansim;
	private String jeondam;
	private String exjeondam;
	private String mem_email;
	private Date auth_date;
	
	private String dept_name;
	
	
	public Date getAuth_date() {
		return auth_date;
	}
	public void setAuth_date(Date auth_date) {
		this.auth_date = auth_date;
	}
	public String getAnsim() {
		return ansim;
	}
	public void setAnsim(String ansim) {
		this.ansim = ansim;
	}
	public String getJeondam() {
		return jeondam;
	}
	public void setJeondam(String jeondam) {
		this.jeondam = jeondam;
	}
	public String getExjeondam() {
		return exjeondam;
	}
	public void setExjeondam(String exjeondam) {
		this.exjeondam = exjeondam;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public Date getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(Date approved_date) {
		this.approved_date = approved_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getHosp_code() {
		return hosp_code;
	}
	public void setHosp_code(String hosp_code) {
		this.hosp_code = hosp_code;
	}
	public String getHosp_name() {
		return hosp_name;
	}
	public void setHosp_name(String hosp_name) {
		this.hosp_name = hosp_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getWeekday_open() {
		return weekday_open;
	}
	public void setWeekday_open(String weekday_open) {
		this.weekday_open = weekday_open;
	}
	public String getWeekday_close() {
		return weekday_close;
	}
	public void setWeekday_close(String weekday_close) {
		this.weekday_close = weekday_close;
	}
	public String getWeekend_open() {
		return weekend_open;
	}
	public void setWeekend_open(String weekend_open) {
		this.weekend_open = weekend_open;
	}
	public String getWeekend_close() {
		return weekend_close;
	}
	public void setWeekend_close(String weekend_close) {
		this.weekend_close = weekend_close;
	}
	public String getLunchtime() {
		return lunchtime;
	}
	public void setLunchtime(String lunchtime) {
		this.lunchtime = lunchtime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getCor_x() {
		return cor_x;
	}
	public void setCor_x(float cor_x) {
		this.cor_x = cor_x;
	}
	public float getCor_y() {
		return cor_y;
	}
	public void setCor_y(float cor_y) {
		this.cor_y = cor_y;
	}
	
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	
	
	
}
