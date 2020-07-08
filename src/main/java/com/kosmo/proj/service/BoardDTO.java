package com.kosmo.proj.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {

	private String noti_no;
	private String mem_email;
	private String title;
	private String content;
	private Date postdate;
	private String file_addr;
	private MultipartFile upload;
	private int hit;



	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(String noti_no) {
		this.noti_no = noti_no;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_addr() {
		return file_addr;
	}
	public void setFile_addr(String file_addr) {
		this.file_addr = file_addr;
	}


}
