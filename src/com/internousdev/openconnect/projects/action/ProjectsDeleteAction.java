package com.internousdev.openconnect.projects.action;

import com.internousdev.openconnect.projects.dao.ProjectsDeleteDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBの情報を削除するクラス。
 * @author YUICHI KIRIU
 * @since 2016/09/09
 */
public class ProjectsDeleteAction extends ActionSupport {

	/**
	 * シリアル番号
	 */
	private static final long serialVersionUID = -758470450L;
	/**
	 * プロジェクト
	 */
	private int projectId;
	/**
	 * 結果文字
	 */
	private String resultString ="このプロジェクトは削除できません。";
	/**
	 * 実行メソッド DAOにデータを渡して、結果を返す
	 * @author YUICHI KIRIU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute(){
		ProjectsDeleteDAO dao = new ProjectsDeleteDAO();
		String result = ERROR;
		int count = 0;

		count = dao.delete(projectId);
		if(count > 0){
			result = SUCCESS;

			resultString = "削除に成功しました。";
		}
		return result;
	}
	/**
	 * 取得メソッド  プロジェクトＩＤ
	 * @author YUICHI KIRIU
	 * @return projectId
	 */
	public int getProjectId() {
		return projectId;
	}
	/**
	 * 設定メソッド プロジェクトＩＤ
	 * @author YUICHI KIRIU
	 * @param projectId
	 */
	public void setProjectId(int projectId) {
		this.projectId = projectId;
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
	 * @author  YUICHI KIRIU
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}
	/**
	 * 取得メソッド シリアル番号を取得
	 * @author  YUICHI KIRIU
	 * @return serialVersionUID
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}


