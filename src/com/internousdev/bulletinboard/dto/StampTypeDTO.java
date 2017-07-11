package com.internousdev.bulletinboard.dto;

import java.util.ArrayList;

public class StampTypeDTO {

	/** 種別ID */
	private int typeId;

	/** スタンプURL */
	private String typeUrl;

	/** 該当タイプのスタンプリスト */
	private ArrayList<StampDTO> typedStampList= new ArrayList<StampDTO>();


	public int getTypeId() {
		return typeId;
	}
	
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public ArrayList<StampDTO> getTypedStampList() {
		return typedStampList;
	}

	public void setTypedStampList(ArrayList<StampDTO> typedStampList) {
		this.typedStampList = typedStampList;
	}

	public String getTypeUrl() {
		return typeUrl;
	}

	public void setTypeUrl(String typeUrl) {
		this.typeUrl = typeUrl;
	}


}
