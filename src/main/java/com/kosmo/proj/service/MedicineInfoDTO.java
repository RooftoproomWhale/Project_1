package com.kosmo.proj.service;

import java.util.List;

import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MedicineInfoDTO {
	private String ITEM_NAME;
	private String ENTP_NAME;
	private String MATERIAL_NAME;
	private String STORAGE_METHOD;
	private String VALID_TERM;
	public MedicineInfoDTO() {}
	public String getITEM_NAME() {
		return ITEM_NAME;
	}
	public String getENTP_NAME() {
		return ENTP_NAME;
	}
	public String getMATERIAL_NAME() {
		MATERIAL_NAME = MATERIAL_NAME.replace("|","</br>");
		System.out.println(MATERIAL_NAME);
		return MATERIAL_NAME;
	}
	public String getSTORAGE_METHOD() {
		return STORAGE_METHOD;
	}
	public String getVALID_TERM() {
		return VALID_TERM;
	}
	
	
	
	
}
