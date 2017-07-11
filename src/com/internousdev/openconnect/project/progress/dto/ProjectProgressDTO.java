/**
 *
 */
package com.internousdev.openconnect.project.progress.dto;

/**
 * @author internous
 *
 */
public class ProjectProgressDTO {

	private int projectId;
	private String projectDay;
	private String projectName;
	private String projectPlan;
	private String projectResult;
	private String other;
	private int managerId;
	private int subManagerId;
	private String startDate;
	private String endDate;
	private String note;
	private int progressId;



	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return progressId
	*/
	public int getProgressId() {
		return progressId;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param progressId
	*/
	public void setProgressId(int progressId) {
		this.progressId = progressId;
	}

	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return projectName
	*/
	public String getProjectName() {
		return projectName;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param projectName
	*/
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return managerId
	*/
	public int getManagerId() {
		return managerId;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param managerId
	*/
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return subManagerId
	*/
	public int getSubManagerId() {
		return subManagerId;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param subManagerId
	*/
	public void setSubManagerId(int subManagerId) {
		this.subManagerId = subManagerId;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return startDate
	*/
	public String getStartDate() {
		return startDate;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param startDate
	*/
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return endDate
	*/
	public String getEndDate() {
		return endDate;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param endDate
	*/
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return note
	*/
	public String getNote() {
		return note;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param note
	*/
	public void setNote(String note) {
		this.note = note;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return projectId
	*/
	public int getProjectId() {
		return projectId;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param projectId
	*/
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return projectDay
	*/
	public String getProjectDay() {
		return projectDay;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param projectDay
	*/
	public void setProjectDay(String projectDay) {
		this.projectDay = projectDay;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return projectPlan
	*/
	public String getProjectPlan() {
		return projectPlan;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param projectPlan
	*/
	public void setProjectPlan(String projectPlan) {
		this.projectPlan = projectPlan;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return projectResult
	*/
	public String getProjectResult() {
		return projectResult;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param projectResult
	*/
	public void setProjectResult(String projectResult) {
		this.projectResult = projectResult;
	}
	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return other
	*/
	public String getOther() {
		return other;
	}
	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param other
	*/
	public void setOther(String other) {
		this.other = other;
	}


}
