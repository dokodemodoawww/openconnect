package com.internousdev.bulletinboard.dto;

public class ColorDTO {

	/** ヘッターカラー */
	private String hColor;

	/** ボディカラー */
	private String bColor;

	/** フッターカラー */
	private String fColor;

	
	public String gethColor() {
		return hColor;
	}

	public void sethColor(String hColor) {
		this.hColor = hColor;
	}

	public String getbColor() {
		return bColor;
	}

	public void setbColor(String bColor) {
		this.bColor = bColor;
	}

	public String getfColor() {
		return fColor;
	}

	public void setfColor(String fColor) {
		this.fColor = fColor;
	}

}
