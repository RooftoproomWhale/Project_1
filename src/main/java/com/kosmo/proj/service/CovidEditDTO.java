package com.kosmo.proj.service;

import java.sql.Date;

public class CovidEditDTO {

	private int person;
	private Date date_;
	private String content;
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public Date getDate_() {
		return date_;
	}
	public void setDate_(Date date_) {
		this.date_ = date_;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CovidEditDTO [person=" + person + ", date_=" + date_ + ", content=" + content + "]";
	}
	
}
