/**
 *
 */
package com.internousdev.openconnect.decision.detail.action;

import java.util.Map;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailRecourseDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 遡求申請ボタン押下時にDBの情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/24
 * @version 1.0
 */
public class DecisionDetailRecourseAction extends ActionSupport {


	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = 570817582132722601L;
	/**
	 * 決裁ID
	 */
	private int decisionId;
	/**
	 * sessionから取得したログイン中ユーザーID
	 */
	private int userId;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "遡求申請できませんでした。";
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;



	/**
	 * 実行メソッド 遡求申請による値の更新をする
	 * @return result 決裁情報の更新に成功したらSUCCESS, 失敗したらERROR
	 */
	public String execute() {

		String result=ERROR;

		DecisionDetailRecourseDAO dao = new DecisionDetailRecourseDAO();

		int count = 0;

		count = dao.recourse( decisionId );


		if (count > 0 ) {
			result = SUCCESS;
			resultString = "遡求申請しました! ";
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
