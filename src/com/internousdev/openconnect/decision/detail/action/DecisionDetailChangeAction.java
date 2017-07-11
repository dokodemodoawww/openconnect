/**
*
*/
package com.internousdev.openconnect.decision.detail.action;

import java.util.Map;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailChangeDAO;
import com.opensymphony.xwork2.ActionSupport;


/**
 * 変更申請ボタン押下時にDBの情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/28
 * @version 1.0
 */
public class DecisionDetailChangeAction extends ActionSupport {

	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -2651575283199660553L;
	/**
	 * 決裁ID
	 */
	private int decisionId;
	/**
	 * 承認状況
	 */
	private int permitStatus;
	/**
	 * 決裁種類
	 */
	private String decisionType;
	/**
	 * sessionから取得したログイン中ユーザーID
	 */
	private int userId;
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "変更申請できませんでした。もしくは申請済みです。";



	/**
	 * 実行メソッド 変更申請による値の更新をする
	 * @return result 決裁情報の更新に成功したらSUCCESS, 失敗したらERROR
	 */
	public String execute() {

		String result=ERROR;

		DecisionDetailChangeDAO dao = new DecisionDetailChangeDAO();

		int count = 0;


		if(permitStatus == 0) {
			count = dao.change(decisionType, decisionId);
		}
		else if(permitStatus >= 1) {
			count = dao.changeRtime(decisionId);
		}


		if (count > 0 ) {
			result = SUCCESS;
			resultString = "変更申請できました! ";
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
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}



	/**
	* 設定メソッド を設定
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

}

