package com.kosmo.proj;

import java.sql.Date;

public class CalendarVO {
		private String title;
		private String Start;
		private String end;
		private String url;
		private String color;
		private String textcolor;
		private String allDay ="false";
		public CalendarVO(String title, String start, String end, String url, String color, String textcolor,
				String allDay) {
			super();
			this.title = title;
			Start = start;
			this.end = end;
			this.url = url;
			this.color = color;
			this.textcolor = textcolor;
			this.allDay = allDay;
		}
		public String getTitle() {
			return title;
		}
		public String getStart() {
			return Start;
		}
		public String getEnd() {
			return end;
		}
		public String getUrl() {
			return url;
		}
		public String getColor() {
			return color;
		}
		public String getTextcolor() {
			return textcolor;
		}
		public String getAllDay() {
			return allDay;
		}
}
	