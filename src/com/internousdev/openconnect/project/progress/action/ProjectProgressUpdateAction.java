package com.internousdev.openconnect.project.progress.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.project.progress.dao.ProjectProgressUpdateDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 画面で受け取った更新情報を、DBへ転送する為のクラス
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectProgressUpdateAction extends ActionSupport  {
	/**
	 * 	シリアルID
	 */
	private static final long serialVersionUID = -3541224046836562290L;

	/**
	 * IDリスト
	 */
	private List<Integer> progressIdList = new ArrayList<Integer>();
	/**
	 * 日付リスト
	 */
	private List<String> projectDayList = new ArrayList<String>();
	/**
	 * 進捗予定リスト
	 */
	private List<String> projectPlanList = new ArrayList<String>();
	/**
	 * 進捗結果リスト
	 */
	private List<String> projectResultList = new ArrayList<String>();
	/**
	 * その他リスト
	 */
	private List<String> otherList = new ArrayList<String>();
	/**
	 * エラーメッセージ
	 */
	private String resultString = "編集できませんでした。";


	/**
	 * ユーザー情報を更新できたか否か判定するメソッド
	 * @result ERROR ヴァリデーションによるエラーメッセージ
	 * @param progressIdList.get(i)
	 * @param projectDayList.get(i)
	 * @param projectPlanList.get(i)
	 * @param projectResultList.get(i)
	 * @param otherList.get(i)
	 * @return result データベースの情報を更新できたか否か
	 * @throws SQLException
	 */
	public String execute() throws SQLException{

		String result = ERROR;
		ProjectProgressUpdateDAO dao = new ProjectProgressUpdateDAO();
		int count = 0;

		for(int i=0;i<progressIdList.size();++i){
			count = dao.update(progressIdList.get(i),projectDayList.get(i),projectPlanList.get(i),projectResultList.get(i),otherList.get(i));
		}
		if(count > 0){
			result = SUCCESS;
			resultString = "編集しました。";
		}

		return result;
	}

	/**
	 * 取得メソッド
	 * @author TATUHUMI ITOU
	 * @return progressIdList
	 */
	public List<Integer> getProgressIdList() {
		return progressIdList;
	}

	/**
	 * 設定メソッド
	 * @author TATUHUMI ITOU
	 * @param progressIdList
	 */
	public void setProgressIdList(List<Integer> progressIdList) {
		this.progressIdList = progressIdList;
	}

	/**
	 * *  取得メソッド 日付リストを取得する
	 * @author TATUHUMI ITOU
	 * @return projectDayList
	 */
	public List<String> getProjectDayList() {
		return projectDayList;
	}

	/**
	 * *   格納メソッド 日付リストを格納する
	 * @author TATUHUMI ITOU
	 * @param projectDayList セットする projectDayList
	 */
	public void setProjectDayList(List<String> projectDayList) {
		this.projectDayList = projectDayList;
	}

	/**
	 *   取得メソッド 進捗予定リストを取得する
	 * @author TATUHUMI ITOU
	 * @return projectPlanList
	 */
	public List<String> getProjectPlanList() {
		return projectPlanList;
	}

	/**
	 * *   格納メソッド 進捗予定リストを格納する
	 * @author TATUHUMI ITOU
	 * @param projectPlanList セットする projectPlanList
	 */
	public void setProjectPlanList(List<String> projectPlanList) {
		this.projectPlanList = projectPlanList;
	}

	/**
	 * 取得メソッド 進捗結果リストを取得する
	 * @author TATUHUMI ITOU
	 * @return projectResultList
	 */
	public List<String> getProjectResultList() {
		return projectResultList;
	}

	/**
	 * *   格納メソッド 進捗結果リストを格納する
	 * @author TATUHUMI ITOU
	 * @param projectResultList セットする projectResultList
	 */
	public void setProjectResultList(List<String> projectResultList) {
		this.projectResultList = projectResultList;
	}

	/**
	 *   取得メソッド その他報告リストを取得する
	 * @author TATUHUMI ITOU
	 * @return otherList
	 */
	public List<String> getOtherList() {
		return otherList;
	}

	/**
	 * *   格納メソッド その他報告リストを格納する
	 * @author TATUHUMI ITOU
	 * @param otherList セットする otherList
	 */
	public void setOtherList(List<String> otherList) {
		this.otherList = otherList;
	}

	/**
	 * 取得メソッド
	 * @author TATUHUMI ITOU
	 * @return resultString
	 */
	public String getResultString() {
		return resultString;
	}

	/**
	 * 設定メソッド
	 * @author TATUHUMI ITOU
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}


}
