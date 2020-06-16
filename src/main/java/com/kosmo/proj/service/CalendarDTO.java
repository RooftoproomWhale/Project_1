package com.kosmo.proj.service;

import java.sql.Date;

public class CalendarDTO {
		private int _calendarno;
		private String MEM_EMAIL;
		private String title;
		private String type;
		private String Start;
		private String end;
		private String patient;
		private String backgroundColor;
		public CalendarDTO(int _calendarno, String mEM_EMAIL, String title, String type, String start, String end,
				String patient, String backgroundColor, String allDay) {
			super();
			this._calendarno = _calendarno;
			MEM_EMAIL = mEM_EMAIL;
			this.title = title;
			this.type = type;
			Start = start;
			this.end = end;
			this.patient = patient;
			this.backgroundColor = backgroundColor;
			this.allDay = allDay;
		}
		private String allDay;
		public int get_calendarno() {
			return _calendarno;
		}
		public String getMEM_EMAIL() {
			return MEM_EMAIL;
		}
		public String getTitle() {
			return title;
		}
		public String getType() {
			return type;
		}
		public String getStart() {
			return Start;
		}
		public String getEnd() {
			return end;
		}
		public String getPatient() {
			return patient;
		}
		public String getBackgroundColor() {
			return backgroundColor;
		}
		public String getAllDay() {
			return allDay;
		}
	
}
		