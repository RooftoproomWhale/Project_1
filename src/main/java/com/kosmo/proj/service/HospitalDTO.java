package com.kosmo.proj.service;

import java.sql.Date;

public class HospitalDTO {
	private String hosp_code;
	private String hosp_name;
	private String tel;
	private int weekday_open;
	private int weekday_close;
	private int weekend_open;
	private int weekend_close;
	private String lunchtime;
	private String mem_email;
	private String mem_pwd;
	
	private String address;
	private float cor_x;
	private float cor_y;
	private String id;
	private String auth;
	private Date approved_date;
	private String dept_name;
	
	
	
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
	public int getWeekday_open() {
		return weekday_open;
	}
	public void setWeekday_open(int weekday_open) {
		this.weekday_open = weekday_open;
	}
	public int getWeekday_close() {
		return weekday_close;
	}
	public void setWeekday_close(int weekday_close) {
		this.weekday_close = weekday_close;
	}
	public int getWeekend_open() {
		return weekend_open;
	}
	public void setWeekend_open(int weekend_open) {
		this.weekend_open = weekend_open;
	}
	public int getWeekend_close() {
		return weekend_close;
	}
	public void setWeekend_close(int weekend_close) {
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
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	
	
	
}
