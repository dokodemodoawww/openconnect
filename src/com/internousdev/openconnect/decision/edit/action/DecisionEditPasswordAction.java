package com.internousdev.openconnect.decision.edit.action;

import com.internousdev.openconnect.decision.edit.dao.DecisionEditPasswordDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * DBの情報を画面に表示する為のクラス
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */

public class DecisionEditPasswordAction extends ActionSupport {
	/**
	 * エラーメッセージ
	 */
	private String resultString = "パスワードを変更できませんでした。";
	/**
	 * パスワード
	 */
	private String password;
	/**
	 * 決裁手続きID
	 */
	private int decisionDetailId;;
	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -7586577377473680450L;
	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 * @author TATUHUMI ITOU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result =ERROR;
		DecisionEditPasswordDAO dao = new DecisionEditPasswordDAO();
		int count = 0;
		count = dao.select(password,decisionDetailId);
		if(count > 0){
			result = SUCCESS;
			resultString = "パスワードを変更しました。";
		}
		return result;
	}

	/**
	 * パスワード取得メソッド
	 * @authorCHI TATUHUMI ITOU
	 * @return password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * パスワード設定メソッド
	 * @author TATUHUMI ITOU
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * ディティール取得メソッド
	 * @authorCHI TATUHUMI ITOU
	 * @return decisionDetailId
	 */

	public int getDecisionDetailId() {
		return decisionDetailId;
	}

	/**
	 * ディティール設定メソッド
	 * @author TATUHUMI ITOU
	 * @paramdecisionDetailId
	 */
	public void setDecisionDetailId(int decisionDetailId) {
		this.decisionDetailId = decisionDetailId;
	}

	/**
	 * エラーメッセージ取得メソッド
	 * @author TATUHUMI ITOU
	 * @return resultString
	 */
	public String getResultString() {
		return resultString;
	}

	/**
	 * エラーメッセージ設定メソッド
	 * @author TATUHUMI ITOU
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

}
