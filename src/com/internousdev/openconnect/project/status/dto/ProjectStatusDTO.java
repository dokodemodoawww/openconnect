/**
 *
 */
package com.internousdev.openconnect.project.status.dto;

/**
 * DBのリリース状況の情報を画面に表示する為のクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectStatusDTO {
	/**
	 * プロジェクトID
	 */
	private int projectId;
	/**
	 * プロジェクト名
	 */
	private String projectName;
	/**
	 * A環境開始日
	 */
	private String aEnvStart;
	/**
	 * A環境終了日
	 */
	private String aEnvEnd;
	/**
	 * B環境開始日
	 */
	private String bEnvStart;
	/**
	 * B環境終了日
	 */
	private String bEnvEnd;
	/**
	 * リリース環境開始日
	 */
	private String rEnvStart;
	/**
	 * リリース環境終了日
	 */
	private String rEnvEnd;
	/**
	 * リリース状況
	 */
	private String awsStatus;
	/**
	 * 備考
	 */
	private String note;
	/**
	 * リリース状況ID
	 */
	private int statusId;
	/**
	* 取得メソッド プロジェクトIDを取得
	* @author KOHEI NITABARU
	* @return projectId
	*/
	public int getProjectId() {
		return projectId;
	}
	/**
	* 設定メソッド プロジェクトIDを設定
	* @author KOHEI NITABARU
	* @param projectId
	*/
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	/**
	* 取得メソッド プロジェクト名を取得
	* @author KOHEI NITABARU
	* @return projectName
	*/
	public String getProjectName() {
		return projectName;
	}
	/**
	* 設定メソッド プロジェクト名を設定
	* @author KOHEI NITABARU
	* @param projectName
	*/
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	* 取得メソッド A環境開始日を取得
	* @author KOHEI NITABARU
	* @return aEnvStart
	*/
	public String getAEnvStart() {
		return aEnvStart;
	}
	/**
	* 設定メソッド A環境開始日を設定
	* @author KOHEI NITABARU
	* @param aEnvStart
	*/
	public void setAEnvStart(String aEnvStart) {
		this.aEnvStart = aEnvStart;
	}
	/**
	* 取得メソッド A環境終了日を取得
	* @author KOHEI NITABARU
	* @return aEnvEnd
	*/
	public String getAEnvEnd() {
		return aEnvEnd;
	}
	/**
	* 設定メソッド A環境終了日を設定
	* @author KOHEI NITABARU
	* @param aEnvEnd
	*/
	public void setAEnvEnd(String aEnvEnd) {
		this.aEnvEnd = aEnvEnd;
	}
	/**
	* 取得メソッド B環境開始日を取得
	* @author KOHEI NITABARU
	* @return bEnvStart
	*/
	public String getBEnvStart() {
		return bEnvStart;
	}
	/**
	* 設定メソッド B環境開始日を設定
	* @author KOHEI NITABARU
	* @param bEnvStart
	*/
	public void setBEnvStart(String bEnvStart) {
		this.bEnvStart = bEnvStart;
	}
	/**
	* 取得メソッド B環境終了日を取得
	* @author KOHEI NITABARU
	* @return bEnvEnd
	*/
	public String getBEnvEnd() {
		return bEnvEnd;
	}
	/**
	* 設定メソッド B環境終了日を設定
	* @author KOHEI NITABARU
	* @param bEnvEnd
	*/
	public void setBEnvEnd(String bEnvEnd) {
		this.bEnvEnd = bEnvEnd;
	}
	/**
	* 取得メソッド リリース状況環境開始日を取得
	* @author KOHEI NITABARU
	* @return rEnvStart
	*/
	public String getREnvStart() {
		return rEnvStart;
	}
	/**
	* 設定メソッド リリース状況環境開始日を設定
	* @author KOHEI NITABARU
	* @param rEnvStart
	*/
	public void setREnvStart(String rEnvStart) {
		this.rEnvStart = rEnvStart;
	}
	/**
	* 取得メソッド リリース状況環境終了日を取得
	* @author KOHEI NITABARU
	* @return rEnvEnd
	*/
	public String getREnvEnd() {
		return rEnvEnd;
	}
	/**
	* 設定メソッド リリース状況環境終了日を設定
	* @author KOHEI NITABARU
	* @param rEnvEnd
	*/
	public void setREnvEnd(String rEnvEnd) {
		this.rEnvEnd = rEnvEnd;
	}
	/**
	* 取得メソッド AWSリリース状況を取得
	* @author KOHEI NITABARU
	* @return awsStatus
	*/
	public String getAwsStatus() {
		return awsStatus;
	}
	/**
	* 設定メソッド AWSリリース状況を設定
	* @author KOHEI NITABARU
	* @param awsStatus
	*/
	public void setAwsStatus(String awsStatus) {
		this.awsStatus = awsStatus;
	}
	/**
	* 取得メソッド ノートを取得
	* @author KOHEI NITABARU
	* @return note
	*/
	public String getNote() {
		return note;
	}
	/**
	* 設定メソッド ノートを設定
	* @author KOHEI NITABARU
	* @param note
	*/
	public void setNote(String note) {
		this.note = note;
	}
	/**
	* 取得メソッド リリース状況IDを取得
	* @author KOHEI NITABARU
	* @return statusId
	*/
	public int getStatusId() {
		return statusId;
	}
	/**
	* 設定メソッド リリース状況IDを設定
	* @author KOHEI NITABARU
	* @param statusId
	*/
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}


}
