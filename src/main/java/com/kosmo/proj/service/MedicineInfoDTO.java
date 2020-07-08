package com.kosmo.proj.service;

public class MedicineInfoDTO {
	private String ITEM_NAME;
	private String ENTP_NAME;
	private String MATERIAL_NAME;
	private String STORAGE_METHOD;
	private String VALID_TERM;
	private String CHART;
	private String COLOR_CLASS1;
	private String DRUG_SHAPE;
	private String ITEM_IMAGE;
	private String EE_DOC;
	private String UD_DOC;
	private String NB_DOC;
	public MedicineInfoDTO() {}
	
	public String getEE_DOC() {
		return EE_DOC;
	}

	public void setEE_DOC(String eE_DOC) {
		EE_DOC = eE_DOC;
	}

	public String getUD_DOC() {
		return UD_DOC;
	}

	public void setUD_DOC(String uD_DOC) {
		UD_DOC = uD_DOC;
	}

	public String getNB_DOC() {
		return NB_DOC;
	}

	public void setNB_DOC(String nB_DOC) {
		NB_DOC = nB_DOC;
	}

	public String getCHART() {
		return CHART;
	}
	public String getCOLOR_CLASS1() {
		return COLOR_CLASS1;
	}
	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}
	public void setENTP_NAME(String eNTP_NAME) {
		ENTP_NAME = eNTP_NAME;
	}
	public void setMATERIAL_NAME(String mATERIAL_NAME) {
		MATERIAL_NAME = mATERIAL_NAME;
	}
	public void setSTORAGE_METHOD(String sTORAGE_METHOD) {
		STORAGE_METHOD = sTORAGE_METHOD;
	}
	public void setVALID_TERM(String vALID_TERM) {
		VALID_TERM = vALID_TERM;
	}
	public void setCHART(String cHART) {
		CHART = cHART;
	}
	public void setCOLOR_CLASS1(String cOLOR_CLASS1) {
		COLOR_CLASS1 = cOLOR_CLASS1;
	}
	public void setDRUG_SHAPE(String dRUG_SHAPE) {
		DRUG_SHAPE = dRUG_SHAPE;
	}
	public void setITEM_IMAGE(String iTEM_IMAGE) {
		ITEM_IMAGE = iTEM_IMAGE;
	}
	public String getDRUG_SHAPE() {
		return DRUG_SHAPE;
	}
	public String getITEM_IMAGE() {
		return ITEM_IMAGE;
	}
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
