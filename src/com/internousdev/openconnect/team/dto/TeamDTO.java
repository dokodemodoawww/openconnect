/**
 *
 */
package com.internousdev.openconnect.team.dto;

/**
 * チーム関係のDBを画面に表示するためのクラス
 * @author TEPPEI MATSUMOTO
 * @since 2017/06/14
 * @version 1.0
 */
public class TeamDTO {
	/**
	 * ユーザーID
	 */
	private int userId;

	/**
	 * 漢字姓
	 */
	private String familyNameKanji;
	/**
	 * 漢字名
	 */
	private String givenNameKanji;

	/**
	 * チーム名
	 */
	private String teamName;

	/**
	 * ログインフラグ
	 */
	private int userFlg;

	/**
	 * 受講開始月
	 */
	private String month;

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return userId
	*/
	public int getUserId() {
		return userId;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param userId
	*/
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return familyNameKanji
	*/
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param familyNameKanji
	*/
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return givenNameKanji
	*/
	public String getGivenNameKanji() {
		return givenNameKanji;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param givenNameKanji
	*/
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return teamName
	*/
	public String getTeamName() {
		return teamName;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param teamName
	*/
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return userFlg
	*/
	public int getUserFlg() {
		return userFlg;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param userFlg
	*/
	public void setUserFlg(int userFlg) {
		this.userFlg = userFlg;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return month
	*/
	public String getMonth() {
		return month;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param month
	*/
	public void setMonth(String month) {
		this.month = month;
	}

}
