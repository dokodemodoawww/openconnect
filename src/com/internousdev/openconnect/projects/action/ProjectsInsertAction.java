package com.internousdev.openconnect.projects.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.project.status.dao.ProjectStatusInsertDAO;
import com.internousdev.openconnect.projects.dao.ProjectsInsertDAO;
import com.internousdev.openconnect.projects.dao.ProjectsSelectDAO;
import com.internousdev.openconnect.projects.dto.ProjectsListDTO;
import com.internousdev.openconnect.projects.dto.ProjectsSelectDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 画面から追加された情報をＤＢに追加するクラス
 *
 * @author YUICHI KIRIU
 * @since 2016/09/07
 */
public class ProjectsInsertAction extends ActionSupport {

	/**
	 * シリアルＩＤ
	 */
	private static final long serialVersionUID = -3262256805448882848L;

	/**
	 * プロジェクトＩＤ
	 */
	private int projectId;

	/**
	 * プロジェクト名
	 */
	private String projectName;

	/**
	 * 管理者名（リーダー）
	 */
	private int managerId;

	/**
	 * 管理者名（サブ）
	 */
	private int subManagerId;

	/**
	 * 開始日
	 */
	private String startDate;

	/**
	 * 人数
	 */
	private int memberNumber;

	/**
	 * 結果文字
	 */
	private String resultString = "";



	/**
	 * 管理者の姓
	 */
	private String managerFamilyName;

	/**
	 * 管理者の名
	 */
	private String managerGivenName;

	/**
	 * サブリーダーの姓
	 */
	private String subManagerFamilyName;

	/**
	 * サブリーダーの名
	 */
	private String subManagerGivenName;

	ArrayList<ProjectsListDTO> checkList = new ArrayList<ProjectsListDTO>();


	public String execute() {

		String result = ERROR;
		ProjectsInsertDAO dao = new ProjectsInsertDAO();

		//プロジェクト名二重チェックメソッド
				checkList = dao.select(projectName);

				if(checkList.size() > 0){
					resultString = "--そのプロジェクト名は既に登録されています。--";
				}else{

		if(dao.managerIdFinder(managerFamilyName, managerGivenName) != 0 && dao.subManagerIdFinder(subManagerFamilyName, subManagerGivenName) != 0){
			managerId = dao.managerIdFinder(managerFamilyName, managerGivenName);
			subManagerId = dao.subManagerIdFinder(subManagerFamilyName, subManagerGivenName);
		}

		int count = 0;
		count = dao.insert(projectName, managerId, subManagerId, memberNumber, startDate);

		if (count > 0) {
			result = SUCCESS;

			resultString = "--追加に成功しました--";

			int maxId = 0;

			ProjectsSelectDAO selectDao = new ProjectsSelectDAO();

			List<ProjectsSelectDTO> list = selectDao.select("");

			for (int i = 0; i < list.size(); i++) {

				if (list.get(i).getProjectId() > maxId)
					maxId = list.get(i).getProjectId();
			}

			ProjectStatusInsertDAO insertDao = new ProjectStatusInsertDAO();

			insertDao.insert(maxId);
		} else {
			resultString = "--追加に失敗しました--";
		}
				}

		return result;
	}

	/**
	 * 取得メソッド プロジェクトＩＤを取得
	 *
	 * @author YUICHI KIRIU
	 * @return projectId
	 */
	public int getProjectId() {
		return projectId;
	}

	/**
	 * 設定メソッド プロジェクトＩＤを設定
	 *
	 * @author YUICHI KIRIU
	 * @param projectId
	 */
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	/**
	 * 取得メソッド プロジェクト名を取得
	 *
	 * @author YUICHI KIRIU
	 * @return projectName
	 */
	public String getProjectName() {
		return projectName;
	}

	/**
	 * 設定メソッド プロジェクト名を設定
	 *
	 * @author YUICHI KIRIU
	 * @param projectName
	 */
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	/**
	 * 取得メソッド 管理者ＩＤ（リーダー）を取得
	 *
	 * @author YUICHI KIRIU
	 * @return managerId
	 */
	public int getManagerId() {
		return managerId;
	}

	/**
	 * 設定メソッド 管理者ＩＤ（リーダー）を設定
	 *
	 * @author YUICHI KIRIU
	 * @param managerId
	 */
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	/**
	 * 取得メソッド 管理者ＩＤ（サブ）を取得
	 *
	 * @author YUICHI KIRIU
	 * @return subManagerId
	 */
	public int getSubManagerId() {
		return subManagerId;
	}

	/**
	 * 設定メソッド管理者ＩＤ（サブ）を設定
	 *
	 * @author YUICHI KIRIU
	 * @param subManagerId
	 */
	public void setSubManagerId(int subManagerId) {
		this.subManagerId = subManagerId;
	}

	/**
	 * 取得メソッド 開始日を取得
	 *
	 * @author YUICHI KIRIU
	 * @return startDate
	 */
	public String getStartDate() {
		return startDate;
	}

	/**
	 * 設定メソッド 開始日を設定
	 *
	 * @author YUICHI KIRIU
	 * @param startDate
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	/**
	 * 取得メソッド 結果文字を取得
	 *
	 * @author YUICHI KIRIU
	 * @return resultString
	 */
	public String getResultString() {
		return resultString;
	}

	/**
	 * 設定メソッド 結果文字を設定
	 *
	 * @author YUICHI KIRIU
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
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

	/**
	* 取得メソッド を取得
	* @return managerFamilyName
	*/
	public String getManagerFamilyName() {
		return managerFamilyName;
	}

	/**
	* 設定メソッド を設定
	* @param managerFamilyName
	*/
	public void setManagerFamilyName(String managerFamilyName) {
		this.managerFamilyName = managerFamilyName;
	}

	/**
	* 取得メソッド を取得
	* @return managerGivenName
	*/
	public String getManagerGivenName() {
		return managerGivenName;
	}

	/**
	* 設定メソッド を設定
	* @param managerGivenName
	*/
	public void setManagerGivenName(String managerGivenName) {
		this.managerGivenName = managerGivenName;
	}

	/**
	* 取得メソッド を取得
	* @return subManagerFamilyName
	*/
	public String getSubManagerFamilyName() {
		return subManagerFamilyName;
	}

	/**
	* 設定メソッド を設定
	* @param subManagerFamilyName
	*/
	public void setSubManagerFamilyName(String subManagerFamilyName) {
		this.subManagerFamilyName = subManagerFamilyName;
	}

	/**
	* 取得メソッド を取得
	* @return subManagerGivenName
	*/
	public String getSubManagerGivenName() {
		return subManagerGivenName;
	}

	/**
	* 設定メソッド を設定
	* @param subManagerGivenName
	*/
	public void setSubManagerGivenName(String subManagerGivenName) {
		this.subManagerGivenName = subManagerGivenName;
	}



	/**
	* 取得メソッド を取得
	* @return checkList
	*/
	public ArrayList<ProjectsListDTO> getCheckList() {
		return checkList;
	}

	/**
	* 設定メソッド を設定
	* @param checkList
	*/
	public void setCheckList(ArrayList<ProjectsListDTO> checkList) {
		this.checkList = checkList;
	}

	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 *
	 * @author YUICHI KIRIU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */

}
