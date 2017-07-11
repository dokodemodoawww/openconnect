package com.internousdev.openconnect.projects.action;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.projects.dao.ProjectsUpdateDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 *編集されたDB情報を画面に表示させるクラス
 * @author YUICHI KIRIU
 * @since 2016/09/8
 * @version 1.0
 */

public class ProjectsUpdateAction extends ActionSupport implements SessionAware{

	/**
	 * シリアルＩＤ
	 */
	private static final long serialVersionUID = 1453496957429527686L;

	/**
	 * プロジェクトＩＤリスト
	 */
	private List<Integer> projectIdList= new ArrayList<Integer>();

	/**
	 * プロジェクト名リスト
	 */
	private List<String> projectNameList = new ArrayList<String>();

	/**
	 * 管理者ＩＤ（リーダー）
	 */
	private List<Integer> projectManagerIdList = new ArrayList<Integer>();

	/**
	 * 管理者ＩＤ（サブ）
	 */
	private List<Integer> projectSubManagerIdList = new ArrayList<Integer>();

	/**
	 * 人数
	 */
	private List<Integer> projectMemberNumberList = new ArrayList<Integer>();

	/**
	 * 開始日
	 */
	private List<String> projectStartDateList = new ArrayList<String>();

	/**
	 * 終了日
	 */
	private List<String> projectEndDateList = new ArrayList<String>();

	/**
	 * 備考
	 */
	private List<String> projectNoteList = new ArrayList<String>();

	/**
	 * 結果文字
	 */
	private String resultString = "編集に失敗しました。";

	/**
	 * セッション
	 */
	public Map<String, Object> session;




	/**
	 * プロジェクト一覧情報を更新できたか否か判定するメソッド
	 * @author  YUICHI KIRIU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 *
	 */
	public String execute(){


		String result =ERROR;
		ProjectsUpdateDAO dao = new ProjectsUpdateDAO();



		int count = 0;
		for(int i=0;i<projectIdList.size();++i){


			count = dao.select(
					projectNameList.get(i),
					projectManagerIdList.get(i),
					projectSubManagerIdList.get(i),
					projectMemberNumberList.get(i),
					projectStartDateList.get(i),
					projectEndDateList.get(i),
					projectNoteList.get(i),
					projectIdList.get(i));
		}
		if(count > 0){
			result = SUCCESS;
			 resultString = "編集に成功しました。";
		}
		return result;
	}

	/**
	 * 取得メソッド プロジェクトリストを取得
	 * @author YUICHI KIRIU
	 * @return projectIdList
	 */
	public List<Integer> getProjectIdList() {
		return projectIdList;
	}

	/**
	 * 設定メソッド プロジェクトリストを設定
	 * @author YUICHI KIRIU
	 * @param projectIdList
	 */
	public void setProjectIdList(List<Integer> projectIdList) {
		this.projectIdList = projectIdList;
	}

	/**
	 * 取得メソッド プロジェクト名リストを取得
	 * @author YUICHI KIRIU
	 * @return projectNameList
	 */
	public List<String> getProjectNameList() {
		return projectNameList;
	}

	/**
	 * 設定メソッド プロジェクト名リストを設定
	 * @author YUICHI KIRIU
	 * @param projectNameList
	 */
	public void setProjectNameList(List<String> projectNameList) {
		this.projectNameList = projectNameList;
	}

	/**
	 * 取得メソッド 管理者ＩＤ（リーダー）リストを取得
	 * @author YUICHI KIRIU
	 * @return projectManagerIdList
	 */
	public List<Integer> getProjectManagerIdList() {
		return projectManagerIdList;
	}

	/**
	 * 設定メソッド  管理者ＩＤ（リーダー）リストを設定
	 * @author YUICHI KIRIU
	 * @param projectManagerIdList
	 */
	public void setProjectManagerIdList(List<Integer> projectManagerIdList) {
		this.projectManagerIdList = projectManagerIdList;
	}

	/**
	 * 取得メソッド 管理者（サブ）リストを取得
	 * @author YUICHI KIRIU
	 * @return projectSubManagerIdList
	 */
	public List<Integer> getProjectSubManagerIdList() {
		return projectSubManagerIdList;
	}

	/**
	 * 設定メソッド 管理者（サブ）リストを設定
	 * @author YUICHI KIRIU
	 * @param projectSubManagerIdList
	 */
	public void setProjectSubManagerIdList(List<Integer> projectSubManagerIdList) {
		this.projectSubManagerIdList = projectSubManagerIdList;
	}

	/**
	 * 取得メソッド 開始日リストを取得
	 * @author YUICHI KIRIU
	 * @return projectStartDateList
	 */
	public List<String> getProjectStartDateList() {
		return projectStartDateList;
	}

	/**
	 * 設定メソッド 開始日リストを設定
	 * @author  YUICHI KIRIU
	 * @param projectStartDateList
	 */
	public void setProjectStartDateList(List<String> projectStartDateList) {
		this.projectStartDateList = projectStartDateList;
	}

	/**
	 * 取得メソッド 終了日リストを取得
	 * @author  YUICHI KIRIU
	 * @return projectEndDateList
	 */
	public List<String> getProjectEndDateList() {
		return projectEndDateList;
	}

	/**
	 * 設定メソッド 終了日リストを設定
	 * @author YUICHI KIRIU
	 * @param projectEndDateList
	 */
	public void setProjectEndDateList(List<String> projectEndDateList) {
		this.projectEndDateList = projectEndDateList;
	}

	/**
	 * 取得メソッド 備考リストを取得
	 * @author  YUICHI KIRIU
	 * @return projectNoteList
	 */
	public List<String> getProjectNoteList() {
		return projectNoteList;
	}

	/**
	 * 設定メソッド 備考リストを設定
	 * @author YUICHI KIRIU
	 * @param projectNoteList
	 */
	public void setProjectNoteList(List<String> projectNoteList) {
		this.projectNoteList = projectNoteList;
	}

	/**
	 * 設定メソッド セッションを設定
	 * @author YUICHI KIRIU
	 * @param Session
	 */
	@Override
	public void setSession(Map<String, Object> arg0) {

	}

	/**
	* 取得メソッド 結果文字を取得
	* @author YUICHI KIRIU
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}

	/**
	* 設定メソッド 結果文字を設定
	* @author YUICHI KIRIU
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	/**
	* 取得メソッド セッションを取得
	* @author YUICHI KIRIU
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	* 取得メソッド を取得
	* @return projectMemberNumberList
	*/
	public List<Integer> getProjectMemberNumberList() {
		return projectMemberNumberList;
	}

	/**
	* 設定メソッド を設定
	* @param projectMemberNumberList
	*/
	public void setProjectMemberNumberList(List<Integer> projectMemberNumberList) {
		this.projectMemberNumberList = projectMemberNumberList;
	}


}

