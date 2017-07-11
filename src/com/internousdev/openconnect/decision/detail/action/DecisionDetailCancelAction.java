/**
*
*/
package com.internousdev.openconnect.decision.detail.action;

import java.util.Map;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailCancelDAO;
import com.opensymphony.xwork2.ActionSupport;


/**
 * 申請取り消しボタン押下時にDBの情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/28
 * @version 1.0
 */
public class DecisionDetailCancelAction extends ActionSupport {

	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -4560754407665304461L;
	/**
	 * 決裁ID
	 */
	private int decisionId;
	/**
	 * 決裁状況
	 */
	private int decisionStatus;
	/**
	 * 決裁種類
	 */
	private String decisionType;
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "申請取り消しできませんでした。もしくは取り消し済みです。";



	/**
	 * 実行メソッド 申請取り消しによる値の更新をする
	 * @return result 決裁情報の更新に成功したらSUCCESS, 失敗したらERROR
	 */
	public String execute() {

		String result=ERROR;

		DecisionDetailCancelDAO dao = new DecisionDetailCancelDAO();

		int count = 0;


		count = dao.cancel(decisionType, decisionStatus, decisionId);


		if (count > 0 ) {
			result = SUCCESS;
			resultString = "申請取り消しできました! ";
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

