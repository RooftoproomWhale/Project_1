package com.kosmo.proj.service;

import java.sql.Date;

public class ReservationDTO {
	private String MEM_NAME;
	private String HOSP_NAME;
	private int RESERV_NO;
	private String HOSP_CODE;
	private String DEPT_NAME;
	private String MEM_EMAIL;
	private String RES_DATE;
	private String RES_TIME;
	private String APPLY_TIME;
	private String SEL_SYMP;

	private String TEL;
	private String gender;
	private int age;
	private String APPROVED;
	
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String mEM_NAME) {
		MEM_NAME = mEM_NAME;
	}
	public String getDEPT_NAME() {
		return DEPT_NAME;
	}
	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHOSP_NAME() {
		return HOSP_NAME;
	}
	public void setHOSP_NAME(String hOSP_NAME) {
		HOSP_NAME = hOSP_NAME;
	}
	public int getRESERV_NO() {
		return RESERV_NO;
	}
	public void setRESERV_NO(int RESERV_NO) {
		this.RESERV_NO = RESERV_NO;
	}
	public String getHOSP_CODE() {
		return HOSP_CODE;
	}
	public void setHOSP_CODE(String HOSP_CODE) {
		this.HOSP_CODE = HOSP_CODE;
	}
	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}
	public void setMEM_EMAIL(String MEM_EMAIL) {
		this.MEM_EMAIL = MEM_EMAIL;
	}
	public String getRES_DATE() {
		return RES_DATE;
	}
	public void setRES_DATE(String RES_DATE) {
		this.RES_DATE = RES_DATE;
	}
	public String getRES_TIME() {
		return RES_TIME;
	}
	public void setRES_TIME(String RES_TIME) {
		this.RES_TIME = RES_TIME;
	}
	public String getAPPLY_TIME() {
		return APPLY_TIME;
	}
	public void setAPPLY_TIME(String APPLY_TIME) {
		this.APPLY_TIME = APPLY_TIME;
	}
	public String getSEL_SYMP() {
		return SEL_SYMP;
	}
	public void setSEL_SYMP(String SEL_SYMP) {
		this.SEL_SYMP = SEL_SYMP;
	}
	public String getAPPROVED() {
		return APPROVED;
	}
	public void setAPPROVED(String aPPROVED) {
		APPROVED = aPPROVED;
	}
	
}
