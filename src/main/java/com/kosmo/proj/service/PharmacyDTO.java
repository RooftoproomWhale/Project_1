package com.kosmo.proj.service;

public class PharmacyDTO {
	private String phar_code;
	private String phar_name;
	private String tel;
	private int weekday_open;
	private int weekday_close;
	private int holiday_open;
	private int holiday_close;
	private String lunchtime;
	
	private String address;
	private float cor_x;
	private float cor_y;
	
	public String getPhar_code() {
		return phar_code;
	}
	public void setPhar_code(String phar_code) {
		this.phar_code = phar_code;
	}
	public String getPhar_name() {
		return phar_name;
	}
	public void setPhar_name(String phar_name) {
		this.phar_name = phar_name;
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
	public int getHoliday_open() {
		return holiday_open;
	}
	public void setHoliday_open(int holiday_open) {
		this.holiday_open = holiday_open;
	}
	public int getHoliday_close() {
		return holiday_close;
	}
	public void setHoliday_close(int holiday_close) {
		this.holiday_close = holiday_close;
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
