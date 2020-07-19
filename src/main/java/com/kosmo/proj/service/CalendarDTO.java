package com.kosmo.proj.service;

import java.sql.Date;

public class CalendarDTO {
		private String MEM_NAME;
	
		private int pre_no;
		private String mem_email;
		private Date pres_date;
		private int duration;
		private int count;
		private String medi_name;
		public String getMEM_NAME() {
			return MEM_NAME;
		}
		public int getPre_no() {
			return pre_no;
		}
		public void setMEM_NAME(String mem_NAME) {
			this.MEM_NAME = mem_NAME;
		}
		public void setPre_no(int pre_no) {
			this.pre_no = pre_no;
		}
		public String getMem_email() {
			return mem_email;
		}
		public void setMem_email(String mem_email) {
			this.mem_email = mem_email;
		}
		public Date getPres_date() {
			return pres_date;
		}
		public void setPres_date(Date pres_date) {
			this.pres_date = pres_date;
		}
		public int getDuration() {
			return duration;
		}
		public void setDuration(int duration) {
			this.duration = duration;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public String getMedi_name() {
			return medi_name;
		}
		public void setMedi_name(String medi_name) {
			this.medi_name = medi_name;
		}
		
}