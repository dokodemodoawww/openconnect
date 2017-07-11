/**
 *
 */
package com.internousdev.openconnect.project.progress.action;


import com.internousdev.openconnect.project.progress.dao.ProjectProgressDeleteDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 画面で受け取ったIDを元にして、DBの情報を削除する為のクラス
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectProgressDeleteAction extends ActionSupport{
	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -758470450L;
	/**
	 * プロジェクトID
	 */
	private int progressId;
	/**
	 * 結果文字
	 */
	private String resultString = "削除に失敗しました。";
	/**
	 * 実行メソッド DAOにデータを渡して、結果を返す
	 * @author TATUHUMI ITOU
	 * @param progressId
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute(){
		ProjectProgressDeleteDAO dao = new ProjectProgressDeleteDAO();
		String result = ERROR;
		int count = 0;
		count = dao.delete(progressId);
		if(count > 0){
			result = SUCCESS;
			resultString = "削除に成功しました。";
		}
		return result;
	}
	/**
	* 取得メソッド 進捗報告IDを取得
	* @author TATUHUMI ITOU
	* @return progressId
	*/
	public int getProgressId() {
		return progressId;
	}
	/**
	* 設定メソッド 進捗報告IDを設定
	* @author TATUHUMI ITOU
	* @param progressId
	*/
	public void setProgressId(int progressId) {
		this.progressId = progressId;
	}
	/**
	* 取得メソッド 結果文字を取得
	* @author TATUHUMI ITOU
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}
	/**
	* 設定メソッド 結果文字を設定
	* @author TATUHUMI ITOU
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}
	/**
	* 取得メソッド シリアル番号を取得
	* @author TATUHUMI ITOU
	* @return serialVersionUID
	*/
	public static long getSerialversionuid() {
		return serialVersionUID;
	}






}
