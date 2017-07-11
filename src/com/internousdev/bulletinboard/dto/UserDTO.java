package com.internousdev.bulletinboard.dto;




public class UserDTO {

	/** ユーザーID */
	private int userId;
	/** 写真 */
	private String userIcon;
	/** 変更画像のID */
	private int imgId;
	/** 名前 */
	private String userName;
	/** SNS用ID */
	private String snsId;
	/** ポイント */
	private int point;
	/** レベル */
	private int lv;
	/** プロフィール */
	private String profile;
	/** 削除フラグ */
	private boolean deleteFlg;
	/** 背景色 */
	private String color;
	/** 通知文 */
	private String msg;
	/** フォローする側のID */
	private int Do;
	/** フォローされる側のID */
	private int Done;
	/** URL */
	private String url;


	//以下アクセサリー

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	public boolean isDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(boolean deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}


	public int getDo() {
		return Do;
	}


	public void setDo(int do1) {
		this.Do = do1;
	}


	public int getDone() {
		return Done;
	}


	public void setDone(int done) {
		Done = done;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
