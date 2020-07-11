package com.kosmo.proj.service;

public class IllnessDTO {

	private String ill_code; //번호
	private String ill_name; //질병명
	private String ill_content; //증상
	private String prevention; //예방
	private String cause; //원인

	public String getIll_code() {
		return ill_code;
	}
	public void setIll_code(String ill_code) {
		this.ill_code = ill_code;
	}
	public String getIll_name() {
		return ill_name;
	}
	public void setIll_name(String ill_name) {
		this.ill_name = ill_name;
	}
	public String getIll_content() {
		return ill_content;
	}
	public void setIll_content(String ill_content) {
		this.ill_content = ill_content;
	}
	public String getPrevention() {
		return prevention;
	}
	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}


}
