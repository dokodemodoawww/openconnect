package com.internousdev.openconnect.projects.dto;
public class ProjectsListDTO {



	/**
	 * プロジェクトＩＤ
	 */
	private int projectId;

	/**
	 * プロジェクト名
	 */
	private String projectName;

	/**
	 * 管理者ＩＤ（リーダー）
	 */
	private int managerId;

	/**
	 * 管理者ＩＤ（サブ）
	 */
	private int  subManagerId;

	/**
	 * 人数
	 */
	private int memberNumber;

	/**
	 * 開始日
	 */
	private String startDate;

	/**
	 * 終了日
	 */
	private String endDate;

	/**
	 * 備考
	 */
	private String Note;


private String familyNameKanji;

private String givenNameKanji;



	/**
* 取得メソッド
* @author TATSUYA HOSHI
* @return
*/
public String getFamilyNameKanji() {
	return familyNameKanji;
}
/**
* 設定メソッド
* @author TATSUYA HOSHI
* @param
*/
public void setFamilyNameKanji(String familyNameKanji) {
	this.familyNameKanji = familyNameKanji;
}
/**
* 取得メソッド
* @author TATSUYA HOSHI
* @return
*/
public String getGivenNameKanji() {
	return givenNameKanji;
}
/**
* 設定メソッド
* @author TATSUYA HOSHI
* @param
*/
public void setGivenNameKanji(String givenNameKanji) {
	this.givenNameKanji = givenNameKanji;
}
	/**
	 * 取得メソッド プロジェクトＩＤを取得
	 * @author YUICHI KIRIU
	 * @return projectId
	 */
	public int getProjectId() {
		return projectId;
	}
	/**
	 * 設定メソッド プロジェクトＩＤを設定
	 * @author YUICHI KIRIU
	 * @param expected
	 */
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}


	/**
	 * 取得メソッド プロジェクト名を取得
	 * @author YUICHI KIRIU
	 * @return projectName
	 */
	public String getProjectName() {
		return projectName;
	}
	/**
	 * 設定メソッド プロジェクト名を設定
	 * @author YUICHI KIRIU
	 * @param projectName
	 */
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	 * 取得メソッド 管理者ＩＤ（リーダー）を取得
	 * @author YUICHI KIRIU
	 * @return managerId
	 */
	public int getManagerId() {
		return managerId;
	}
	/**
	 * 設定メソッド 管理者ＩＤ（リーダー）を設定
	 * @author YUICHI KIRIU
	 * @param managerId
	 */
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	/**
	 * 取得メソッド 管理者ＩＤ（サブ）を取得
	 * @author YUICHI KIRIU
	 * +
	 * @return subManagerId
	 */
	public int getSubManagerId() {
		return subManagerId;
	}
	/**
	 * 設定メソッド 管理者ＩＤ（サブ）を設定
	 * @author YUICHI KIRIU
	 * @param subManagerId
	 */
	public void setSubManagerId(int subManagerId) {
		this.subManagerId = subManagerId;
	}
	/**
	 * 取得メソッド 開始日を取得
	 * @author YUICHI KIRIU
	 * @return startDate
	 */
	public String getStartDate() {
		return startDate;
	}
	/**
	 * 設定メソッド  開始日を設定
	 * @author YUICHI KIRIU
	 * @param startDate
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	/**
	 * 取得メソッド 終了日を取得
	 * @author YUICHI KIRIU
	 * @return endDate
	 */
	public String getEndDate() {
		return endDate;
	}
	/**
	 * 設定メソッド 終了日を設定
	 * @author YUICHI KIRIU
	 * @param endDate
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	/**
	 * 取得メソッド 備考を取得
	 * @author YUICHI KIRIU
	 * @return endDate
	 */
	public String getNote() {
		return Note;
	}
	/**
	 * 設定メソッド 備考を設定
	 * @author YUICHI KIRIU
	 * @param note
	 */
	public void setNote(String note) {
		this.Note = note;
	}
	/**
	* 取得メソッド を取得
	* @return memberNumber
	*/
	public int getMemberNumber() {
		return memberNumber;
	}
	/**
	* 設定メソッド を設定
	* @param memberNumber
	*/
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

}
