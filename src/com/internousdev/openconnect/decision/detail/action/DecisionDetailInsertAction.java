/**
 *
 */
package com.internousdev.openconnect.decision.detail.action;


import java.util.Map;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailInsertDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 新規決裁追加ボタン押下時にDBに情報を格納するクラス
 * @author TATUHUMI ITOU, SOSHI AZUMA
 * @since 2016/09/04
 * @version 1.0
 */
public class DecisionDetailInsertAction extends ActionSupport {


	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = 4142536908215440601L;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "追加できませんでした。もしくは作成済みです。";
	/**
	 * プロジェクトID
	 */
	private int projectId;
	/**
	 * 決済種類
	 */
	private String decisionType = "実施";
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;
	/**
	 * sessionから取得したログイン中ユーザーID
	 */
	private int userId;



	/**
	 * 実行メソッド 追加による値の格納をする
	 * @return result 決裁情報の追加に成功したらSUCCESS, 失敗したらERROR
	 */
	public String execute() {

		String result=ERROR;

		DecisionDetailInsertDAO dao = new DecisionDetailInsertDAO();

		int count = 0;

		count = dao.insert( projectId, decisionType );

		if (count > 0 ) {
			result = SUCCESS;
			resultString = "追加できました!";
		}

		return result;
	}



	/**
	* 取得メソッド プロジェクトIDを取得
	* @return projectId
	*/
	public int getProjectId() {
		return projectId;
	}
	/**
	* 設定メソッド プロジェクトIDを設定
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
	* 取得メソッド 結果を取得
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}

	/**
	* 設定メソッド 結果を設定
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	/**
	* 取得メソッド を取得
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	* 設定メソッド を設定
	* @param session
	*/
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

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



}
