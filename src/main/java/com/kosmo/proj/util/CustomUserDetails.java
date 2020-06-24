package com.kosmo.proj.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {
	
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
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public Date getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

	public boolean isENABLED() {
		if(enable==1) {
			ENABLED=true;
		}
		else {
			ENABLED=false;
		}
		return ENABLED;
	}

	public void setENABLED(boolean eNABLED) {
		ENABLED = eNABLED;
	}

	private Date signup_date;
	private boolean ENABLED;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(role));
        return auth;
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

	@Override
	public String getPassword() {
		return mem_pwd;
	}

	@Override
	public String getUsername() {
		return mem_email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return ENABLED;
	}

	public String getNAME() {
		return mem_name;
	}

	public void setNAME(String name) {
		mem_name = name;
	}
	
}
