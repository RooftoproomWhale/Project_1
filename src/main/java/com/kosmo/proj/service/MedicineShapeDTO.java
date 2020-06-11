package com.kosmo.proj.service;

import java.util.List;

import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MedicineShapeDTO {
	private String CHART;
	private String COLOR_CLASS1;
	private String DRUG_SHAPE;
	private String ITEM_IMAGE;
	
	public MedicineShapeDTO() {}

	public String getCHART() {
		return CHART;
	}

	public String getCOLOR_CLASS1() {
		return COLOR_CLASS1;
	}

	public String getDRUG_SHAPE() {
		return DRUG_SHAPE;
	}

	public String getITEM_IMAGE() {
		return ITEM_IMAGE;
	}
	
	
	
	
	
}
