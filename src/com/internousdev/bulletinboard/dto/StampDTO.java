package com.internousdev.bulletinboard.dto;

public class StampDTO {

	/** スタンプID */
	private int stampId;
	
	/** 種別ID */
	private int typeId;

	/** 使用可能レベル */
	private int lv;

	/** URL */
	private String url;
	

	public int getStampId() {
		return stampId;
	}

	public int getTypeId() {
		return typeId;
	}

	public int getLv() {
		return lv;
	}

	public String getUrl() {
		return url;
	}

	public void setStampId(int stampId) {
		this.stampId = stampId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
