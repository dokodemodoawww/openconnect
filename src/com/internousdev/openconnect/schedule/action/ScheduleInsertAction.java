/**
 *
 */
package com.internousdev.openconnect.schedule.action;
import java.util.Map;

import com.internousdev.openconnect.schedule.dao.ScheduleInsertDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * スケジュール一覧のDBに情報を追加するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */
public class ScheduleInsertAction extends ActionSupport{

	/**
	 * シリアル番号
	 */
	private static final long serialVersionUID = -1823142777543076903L;

	/**
	 * 開始日
	 * @author MASAHIRO KEDSUKA
	 */
	private String startDay;

	/**
	 * 終了日
	 * @author MASAHIRO KEDSUKA
	 */
	private String endDay;
	/**
	 * 件名
	 * @author MASAHIRO KEDSUKA
	 */
	private String title;

	/**
	 * 内容
	 * @author MASAHIRO KEDSUKA
	 */
	private String content;

	/**
	 * チーム名
	 * @author MASAHIRO KEDSUKA
	 * selectActionに渡す情報のためチーム名の変数をsearchとしている
	 */
	private String search;

	/**
	 *エラー
	 * @author MASAHIRO KEDSUKA
	 */
	private String errorMsg;

	/**
	 * 成功
	 * @author MASAHIRO KEDSUKA
	 */
	private String successMsg;

	/**
	 * 管理権限
	 * @author MASAHIRO KEDSUKA
	 */
	public Map<String, Object> session;

	/**
	 * 実行メソッド。DAOに情報を渡して、DBに追加する。
	 */
	public String execute(){
		String ret = ERROR;
		int k;

		if(startDay.isEmpty()&&title.isEmpty()){
			ret = ERROR;
			errorMsg=(getText("追加できませんでした"));
			return ret;
		}else{

			ScheduleInsertDAO dao = new ScheduleInsertDAO();

			k = dao.insert(startDay,endDay,title,search);

			if (k>0) {
				successMsg=(getText("追加しました。"));
				ret = SUCCESS;
			} else {
				errorMsg=(getText("追加に失敗しました"));
			}
		}
		return ret;
	}


	/**
	 * 取得メソッド 開始日を取得
	 * @author MASAHIRO KEDSUKA
	 * @return startDay
	 */
	public String getStartDay() {
		return startDay;
	}


	/**
	 * 設定メソッド 開始日を設定
	 * @author MASAHIRO KEDSUKA
	 * @param startDay
	 */
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}



	/**
	 * endDayを取得します。
	 * @return endDay
	 */
	public String getEndDay() {
	    return endDay;
	}


	/**
	 * endDayを設定します。
	 * @param endDay endDay
	 */
	public void setEndDay(String endDay) {
	    this.endDay = endDay;
	}


	/**
	 * 取得メソッド 件名を取得
	 * @author MASAHIRO KEDSUKA
	 * @return Title
	 */
	public String getTitle() {
		return title;
	}


	/**
	 * 設定メソッド 件名を設定
	 * @author MASAHIRO KEDSUKA
	 * @param title
	 */
	public void setTitle(String title) {
		this.title = title;
	}


	/**
	 * 取得メソッド 内容を取得
	 * @author MASAHIRO KEDSUKA
	 * @return Content
	 */
	public String getContent() {
		return content;
	}


	/**
	 * 設定メソッド 内容を設定
	 * @author MASAHIRO KEDSUKA
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}


	/**
	 * チーム名を取得します。
	 * @return チーム名
	 */
	public String getSearch() {
	    return search;
	}


	/**
	 * チーム名を設定します。
	 * @param search チーム名
	 */
	public void setSearch(String search) {
	    this.search = search;
	}


	/**
	 * 取得メソッド エラーメッセージを取得
	 * @author MASAHIRO KEDSUKA
	 * @return errorMsg
	 */
	public String getErrorMsg() {
		return errorMsg;
	}


	/**
	 * 設定メソッド エラーメッセージを設定
	 * @author MASAHIRO KEDSUKA
	 * @param errorMsg
	 */
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}


	/**
	 * 取得メソッド 成功メッセージを取得
	 * @author MASAHIRO KEDSUKA
	 * @return successMsg
	 */
	public String getSuccessMsg() {
		return successMsg;
	}


	/**
	 * 設定メソッド 成功メッセージを設定
	 * @author MASAHIRO KEDSUKA
	 * @param successMsg
	 */
	public void setSuccessMsg(String successMsg) {
		this.successMsg = successMsg;
	}


	/**
	* 取得メソッド 管理権限の状態を取得
	* @author MASAHIRO KEDSUKA
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}


	/**
	* 設定メソッド 管理権限の状態を設定
	* @author MASAHIRO KEDSUKA
	* @param session
	*/
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	/**
	 * 取得メソッド シリアルIDを取得
	 * @author MASAHIRO KEDSUKA
	 * @return serialVersionUID
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
