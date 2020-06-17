package com.kosmo.proj.service;

import java.sql.Date;

public class ReservationDTO {
	private String HOSP_NAME;
	private int RESERV_NO;
	private String HOSP_CODE;
	private int DEPT_CODE;
	private String MEM_EMAIL;
	private String RES_DATE;
	private String RES_TIME;
	private Date APPLY_TIME;
	private String SEL_SYMP;
	
	
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
	public int getDEPT_CODE() {
		return DEPT_CODE;
	}
	public void setDEPT_CODE(int DEPT_CODE) {
		this.DEPT_CODE = DEPT_CODE;
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
	public Date getAPPLY_TIME() {
		return APPLY_TIME;
	}
	public void setAPPLY_TIME(Date APPLY_TIME) {
		this.APPLY_TIME = APPLY_TIME;
	}
	public String getSEL_SYMP() {
		return SEL_SYMP;
	}
	public void setSEL_SYMP(String SEL_SYMP) {
		this.SEL_SYMP = SEL_SYMP;
	}
	
	
}
