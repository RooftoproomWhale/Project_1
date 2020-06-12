package com.kosmo.proj.service;

import java.sql.Date;

public class CalendarVO {
		private int _id;
		private String userid;
		private String title;
		private String type;
		private String Start;
		private String end;
		private String url;
		private String color;
		private String allDay ="false";
		public CalendarVO(int _id, String userid, String title, String type, String start, String end, String url,
				String color, String allDay) {
			super();
			this._id = _id;
			this.userid = userid;
			this.title = title;
			this.type = type;
			Start = start;
			this.end = end;
			this.url = url;
			this.color = color;
			this.allDay = allDay;
		}
		public int getId() {
			return _id;
		}
		public void setId(int id) {
			this._id = id;
		}
		public String getuserid() {
			return userid;
		}
		public void setuserid(String userid) {
			this.userid = userid;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getStart() {
			return Start;
		}
		public void setStart(String start) {
			Start = start;
		}
		public String getEnd() {
			return end;
		}
		public void setEnd(String end) {
			this.end = end;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public String getAllDay() {
			return allDay;
		}
		public void setAllDay(String allDay) {
			this.allDay = allDay;
		}
}
		