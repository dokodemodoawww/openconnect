/**
 *
 */
package com.internousdev.openconnect.decision.detail.dto;

/**
 * 決裁手続きに関するデータを溜め込むDTOクラス。
 * @author SOSHI AZUMA
 * @since 2017/06/15
 * @version 1.0
 */
public class DecisionDetailDTO {


	/**
	 * 起案番号一時保管庫(DecisionDetailApplicationDAO)
	 */
	private String idNumAmount;
	/**
	* 取得メソッド を取得
	* @return idNumAmount
	*/
	public String getIdNumAmount() {
		return idNumAmount;
	}
	/**
	* 設定メソッド を設定
	* @param idNumAmount
	*/
	public void setIdNumAmount(String idNumAmount) {
		this.idNumAmount = idNumAmount;
	}



	/**
	 * sessionから取得したログイン中ユーザーID
	 */
	private int userId;
	/**
	* 取得メソッド を取得
	* @return userId
	*/
	public int getUserId() {
		return userId;
	}
	/**
	* 設定メソッド を設定
	* @param userId
	*/
	public void setUserId(int userId) {
		this.userId = userId;
	}



	/**
	 *  リーダーID
	 */
	private int managerId;
	/**
	 *  サブリーダーID
	 */
	private int subManagerId;
	/**
	 *  プロジェクト名
	 */
	private String projectName;




	/**
	 *  決裁ID
	 */
	private int decisionId;
	/**
	 *  プロジェクトID
	 */
	private int projectId;
	/**
	 *  決裁種類
	 */
	private String decisionType;
	/**
	 *  決裁状況
	 */
	private int decisionStatus;
	/**
	 * 承認状況
	 */
	private int permitStatus;
	/**
	 * 変更有無
	 */
	private int changeStatus;
	/**
	 * 遡求有無
	 */
	private int recourseStatus;
	/**
	 * 終了日
	 */
	private String endDay;






	/**
	 * 実施起案番号
	 */
	private String jImpId;
	/**
	 * 契約起案番号
	 */
	private String kImpId;
	/**
	 * 実施兼契約起案番号
	 */
	private String jkImpId;
	/**
	 * 実施決裁番号
	 */
	private String jDecId;
	/**
	 * 実施起案者ID
	 */
	private int jDrafterId;
	/**
	 * 契約/実施兼契約起案者ID
	 */
	private int kDrafterId;
	/**
	 * 実施_承認者ID(1人目:リーダー)
	 */
	private int jPermiterId1;
	/**
	 * 契約_承認者ID(1人目:リーダー)
	 */
	private int kPermiterId1;
	/**
	 * 契約_承認者ID(3人目:先生)
	 */
	private int kPermiterId3;
	/**
	 * 遡求承認者ID(先生)
	 */
	private int sPermiterId;
	/**
	 * 実施申請日
	 */
	private String jApplyDay;
	/**
	 * 契約/実施兼契約申請日
	 */
	private String kApplyDay;
	/**
	 * 遡求申請日
	 */
	private String sApplyDay;











	/**
	* 取得メソッド を取得
	* @return managerId
	*/
	public int getManagerId() {
		return managerId;
	}
	/**
	* 設定メソッド を設定
	* @param managerId
	*/
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	/**
	* 取得メソッド を取得
	* @return subManagerId
	*/
	public int getSubManagerId() {
		return subManagerId;
	}
	/**
	* 設定メソッド を設定
	* @param subManagerId
	*/
	public void setSubManagerId(int subManagerId) {
		this.subManagerId = subManagerId;
	}
	/**
	* 取得メソッド を取得
	* @return projectName
	*/
	public String getProjectName() {
		return projectName;
	}
	/**
	* 設定メソッド を設定
	* @param projectName
	*/
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	* 取得メソッド を取得
	* @return decisionId
	*/
	public int getDecisionId() {
		return decisionId;
	}
	/**
	* 設定メソッド を設定
	* @param decisionId
	*/
	public void setDecisionId(int decisionId) {
		this.decisionId = decisionId;
	}
	/**
	* 取得メソッド を取得
	* @return projectId
	*/
	public int getProjectId() {
		return projectId;
	}
	/**
	* 設定メソッド を設定
	* @param projectId
	*/
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	/**
	* 取得メソッド を取得
	* @return decisionType
	*/
	public String getDecisionType() {
		return decisionType;
	}
	/**
	* 設定メソッド を設定
	* @param decisionType
	*/
	public void setDecisionType(String decisionType) {
		this.decisionType = decisionType;
	}
	/**
	* 取得メソッド を取得
	* @return decisionStatus
	*/
	public int getDecisionStatus() {
		return decisionStatus;
	}
	/**
	* 設定メソッド を設定
	* @param decisionStatus
	*/
	public void setDecisionStatus(int decisionStatus) {
		this.decisionStatus = decisionStatus;
	}
	/**
	* 取得メソッド を取得
	* @return permitStatus
	*/
	public int getPermitStatus() {
		return permitStatus;
	}
	/**
	* 設定メソッド を設定
	* @param permitStatus
	*/
	public void setPermitStatus(int permitStatus) {
		this.permitStatus = permitStatus;
	}
	/**
	* 取得メソッド を取得
	* @return changeStatus
	*/
	public int getChangeStatus() {
		return changeStatus;
	}
	/**
	* 設定メソッド を設定
	* @param changeStatus
	*/
	public void setChangeStatus(int changeStatus) {
		this.changeStatus = changeStatus;
	}
	/**
	* 取得メソッド を取得
	* @return recourseStatus
	*/
	public int getRecourseStatus() {
		return recourseStatus;
	}
	/**
	* 設定メソッド を設定
	* @param recourseStatus
	*/
	public void setRecourseStatus(int recourseStatus) {
		this.recourseStatus = recourseStatus;
	}
	/**
	* 取得メソッド を取得
	* @return endDay
	*/
	public String getEndDay() {
		return endDay;
	}
	/**
	* 設定メソッド を設定
	* @param endDay
	*/
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	/**
	* 取得メソッド を取得
	* @return jImpId
	*/
	public String getJImpId() {
		return jImpId;
	}
	/**
	* 設定メソッド を設定
	* @param jImpId
	*/
	public void setJImpId(String jImpId) {
		this.jImpId = jImpId;
	}
	/**
	* 取得メソッド を取得
	* @return kImpId
	*/
	public String getKImpId() {
		return kImpId;
	}
	/**
	* 設定メソッド を設定
	* @param kImpId
	*/
	public void setKImpId(String kImpId) {
		this.kImpId = kImpId;
	}
	/**
	* 取得メソッド を取得
	* @return jkImpId
	*/
	public String getJkImpId() {
		return jkImpId;
	}
	/**
	* 設定メソッド を設定
	* @param jkImpId
	*/
	public void setJkImpId(String jkImpId) {
		this.jkImpId = jkImpId;
	}
	/**
	* 取得メソッド を取得
	* @return jDecId
	*/
	public String getJDecId() {
		return jDecId;
	}
	/**
	* 設定メソッド を設定
	* @param jDecId
	*/
	public void setJDecId(String jDecId) {
		this.jDecId = jDecId;
	}
	/**
	* 取得メソッド を取得
	* @return jDrafterId
	*/
	public int getJDrafterId() {
		return jDrafterId;
	}
	/**
	* 設定メソッド を設定
	* @param jDrafterId
	*/
	public void setJDrafterId(int jDrafterId) {
		this.jDrafterId = jDrafterId;
	}
	/**
	* 取得メソッド を取得
	* @return kDrafterId
	*/
	public int getKDrafterId() {
		return kDrafterId;
	}
	/**
	* 設定メソッド を設定
	* @param kDrafterId
	*/
	public void setKDrafterId(int kDrafterId) {
		this.kDrafterId = kDrafterId;
	}
	/**
	* 取得メソッド を取得
	* @return jPermiterId1
	*/
	public int getJPermiterId1() {
		return jPermiterId1;
	}
	/**
	* 設定メソッド を設定
	* @param jPermiterId1
	*/
	public void setJPermiterId1(int jPermiterId1) {
		this.jPermiterId1 = jPermiterId1;
	}
	/**
	* 取得メソッド を取得
	* @return kPermiterId1
	*/
	public int getKPermiterId1() {
		return kPermiterId1;
	}
	/**
	* 設定メソッド を設定
	* @param kPermiterId1
	*/
	public void setKPermiterId1(int kPermiterId1) {
		this.kPermiterId1 = kPermiterId1;
	}
	/**
	* 取得メソッド を取得
	* @return kPermiterId3
	*/
	public int getKPermiterId3() {
		return kPermiterId3;
	}
	/**
	* 設定メソッド を設定
	* @param kPermiterId3
	*/
	public void setKPermiterId3(int kPermiterId3) {
		this.kPermiterId3 = kPermiterId3;
	}
	/**
	* 取得メソッド を取得
	* @return sPermiterId
	*/
	public int getSPermiterId() {
		return sPermiterId;
	}
	/**
	* 設定メソッド を設定
	* @param sPermiterId
	*/
	public void setSPermiterId(int sPermiterId) {
		this.sPermiterId = sPermiterId;
	}
	/**
	* 取得メソッド を取得
	* @return jApplyDay
	*/
	public String getJApplyDay() {
		return jApplyDay;
	}
	/**
	* 設定メソッド を設定
	* @param jApplyDay
	*/
	public void setJApplyDay(String jApplyDay) {
		this.jApplyDay = jApplyDay;
	}
	/**
	* 取得メソッド を取得
	* @return kApplyDay
	*/
	public String getKApplyDay() {
		return kApplyDay;
	}
	/**
	* 設定メソッド を設定
	* @param kApplyDay
	*/
	public void setKApplyDay(String kApplyDay) {
		this.kApplyDay = kApplyDay;
	}
	/**
	* 取得メソッド を取得
	* @return sApplyDay
	*/
	public String getSApplyDay() {
		return sApplyDay;
	}
	/**
	* 設定メソッド を設定
	* @param sApplyDay
	*/
	public void setSApplyDay(String sApplyDay) {
		this.sApplyDay = sApplyDay;
	}










}
