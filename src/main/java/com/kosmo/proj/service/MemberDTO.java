package com.kosmo.proj.service;

import java.util.Date;

public class MemberDTO {
	   private String mem_email;
	   private String mem_pwd;
	   private String mem_name;
	   private String gender;
	   private String tel;
	   private int age;
	   private int height;
	   private int weight;
	   private String role;
	   private int enable;
	   private Date signup_date;

	public String getTel() {
		return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getRole() {
		      return role;
	   }
	   public void setRole(String role) {
	      this.role = role;
	   }
	   public int getEnable() {
	      return enable;
	   }
	   public void setEnable(int enable) {
	      this.enable = enable;
	   }
	   public String getMem_email() {
	      return mem_email;
	   }
	   public void setMem_email(String mem_email) {
	      this.mem_email = mem_email;
	   }
	   public String getMem_pwd() {
	      return mem_pwd;
	   }
	   public void setMem_pwd(String mem_pwd) {
	      this.mem_pwd = mem_pwd;
	   }
	   public String getMem_name() {
	      return mem_name;
	   }
	   public void setMem_name(String mem_name) {
	      this.mem_name = mem_name;
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
	   public int getHeight() {
	      return height;
	   }
	   public void setHeight(int height) {
	      this.height = height;
	   }
	   public int getWeight() {
	      return weight;
	   }
	   public void setWeight(int weight) {
	      this.weight = weight;
	   }
	   public Date getSignup_date() {
		return signup_date;
	}
	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

}
