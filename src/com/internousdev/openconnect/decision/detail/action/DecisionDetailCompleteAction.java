/**
 *
 */
package com.internousdev.openconnect.decision.detail.action;

import java.util.Map;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;


/**
 * リリース完了ボタン押下時にDBの情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/23
 * @version 1.0
 */
public class DecisionDetailCompleteAction extends ActionSupport {


	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = 8633009576791703661L;
	/**
	 * 決裁ID
	 */
	private int decisionId;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "リリース完了できませんでした。";
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;



	/**
	 * 実行メソッド リリース完了による値の更新をする
	 * @return result 決裁情報の更新に成功したらSUCCESS, 失敗したらERROR
	 */
	public String execute() {

		String result=ERROR;

		DecisionDetailCompleteDAO dao = new DecisionDetailCompleteDAO();

		int count = 0;

		count = dao.releaseComplete( decisionId );


		if (count > 0 ) {
			result = SUCCESS;
			resultString = "リリース完了しました! ";
		}
		return result;
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



}
