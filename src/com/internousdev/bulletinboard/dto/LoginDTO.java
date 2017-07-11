package com.internousdev.bulletinboard.dto;



/**
 * ログインに関するDTOクラス
 * @author Miyauchi Akitomo
 * @since 2017/5/11
 * @version 1.0
 */
public class LoginDTO {

	/** ユーザーの名前 */
	private String userName;
	
	/** メールアドレス */
	private String phoneEmail;

	/** ユーザーID */
	private int userId;
	
	/** パスワード */
	private String password;
	
	/** 退会フラグ */
	private boolean userdelFlg;
	
	/** ログインフラグ */
	private boolean loginFlg;
	
	/** ユーザーID */
	private int userFlg;
	
	/** OAuthID */
	private String oauthId;

	/** OAuth名 */
	private int oauthName;
	
	/** OAuthアカウント */
	private String oauthAccount;


	//以下アクセサリー

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhoneEmail() {
		return phoneEmail;
	}

	public void setPhoneEmail(String phoneEmail) {
		this.phoneEmail = phoneEmail;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isUserdelFlg() {
		return userdelFlg;
	}

	public void setUserdelFlg(boolean userdelFlg) {
		this.userdelFlg = userdelFlg;
	}

	public boolean isLoginFlg() {
		return loginFlg;
	}

	public void setLoginFlg(boolean loginFlg) {
		this.loginFlg = loginFlg;
	}

	public int getUserFlg() {
		return userFlg;
	}

	public void setUserFlg(int userFlg) {
		this.userFlg = userFlg;
	}

	public String getOauthId() {
		return oauthId;
	}

	public void setOauthId(String oauthId) {
		this.oauthId = oauthId;
	}

	public int getOauthName() {
		return oauthName;
	}

	public void setOauthName(int oauthName) {
		this.oauthName = oauthName;
	}

	public String getOauthAccount() {
		return oauthAccount;
	}

	public void setOauthAccount(String oauthAccount) {
		this.oauthAccount = oauthAccount;
	}

}