package com.kosmo.proj.service;

public class HospitalDTO {
	private String hosp_code;
	private String hosp_name;
	private int authorized;
	private String tel;
	private int weekday_open;
	private int weekday_close;
	private int weekend_open;
	private int weekend_close;
	private String lunchtime;
	
	private String address;
	private float cor_x;
	private float cor_y;
	
	
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
	public int getAuthorized() {
		return authorized;
	}
	public void setAuthorized(int authorized) {
		this.authorized = authorized;
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
	
	
	
}
