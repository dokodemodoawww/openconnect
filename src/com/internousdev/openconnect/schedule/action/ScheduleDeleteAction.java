package com.internousdev.openconnect.schedule.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.schedule.dao.ScheduleDeleteDAO;
import com.opensymphony.xwork2.ActionSupport;


/**
 * スケジュール一覧のDB情報を削除するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */

public class ScheduleDeleteAction extends ActionSupport implements SessionAware{




	/**
	 * @author MASAHIRO KEDSUKA
	 *スケジュールID
	 */
	private int scheduleId;


	/**
	 * 成功メッセージ
	 * @author MASAHIRO KEDSUKA
	 */
	private String successMsg;

	/**
	 * エラーメッセージ
	 * @author MASAHIRO KEDSUKA
	 */
	private String errorMsg;

	/**
	 * 管理権限
	 * @author MASAHIRO KEDSUKA
	 */
	public Map<String, Object> session;
	/**
	 * 実行メソッド。DAOにデータを渡して削除する。
	 */

	/**
	 * ScheduleSelectAcitionにチーム名渡すための変数
	 * @author WATARU AMEMIYA
	 */
	private String search;

	public String execute() throws SQLException{

		String result =ERROR;    //削除の判定


		ScheduleDeleteDAO dao = new ScheduleDeleteDAO();
		int count = 0;
		count = dao.delete(scheduleId);

		if(count > 0){ //何かしらDBが数値を返したら
			successMsg=(getText("削除しました。"));
			result = SUCCESS;
		}else{
			errorMsg=(getText("削除に失敗しました。"));
		}
		return result;
	}

	/**
	 * @author MASAHIRO KEDSUKAを取得します。
	 * @return @author MASAHIRO KEDSUKA
	 */
	public int getScheduleId() {
	    return scheduleId;
	}

	/**
	 * @author MASAHIRO KEDSUKAを設定します。
	 * @param scheduleId @author MASAHIRO KEDSUKA
	 */
	public void setScheduleId(int scheduleId) {
	    this.scheduleId = scheduleId;
	}

	/**
	 * 成功メッセージを取得します。
	 * @return 成功メッセージ
	 */
	public String getSuccessMsg() {
	    return successMsg;
	}

	/**
	 * 成功メッセージを設定します。
	 * @param successMsg 成功メッセージ
	 */
	public void setSuccessMsg(String successMsg) {
	    this.successMsg = successMsg;
	}

	/**
	 * エラーメッセージを取得します。
	 * @return エラーメッセージ
	 */
	public String getErrorMsg() {
	    return errorMsg;
	}

	/**
	 * エラーメッセージを設定します。
	 * @param errorMsg エラーメッセージ
	 */
	public void setErrorMsg(String errorMsg) {
	    this.errorMsg = errorMsg;
	}

	/**
	 * 管理権限を取得します。
	 * @return 管理権限
	 */
	public Map<String,Object> getSession() {
	    return session;
	}

	/**
	 * 管理権限を設定します。
	 * @param session 管理権限
	 */
	public void setSession(Map<String,Object> session) {
	    this.session = session;
	}

	/**
	 * 実行メソッド。DAOにデータを渡して削除する。を取得します。
	 * @return 実行メソッド。DAOにデータを渡して削除する。
	 */
	public String getSearch() {
	    return search;
	}

	/**
	 * 実行メソッド。DAOにデータを渡して削除する。を設定します。
	 * @param search 実行メソッド。DAOにデータを渡して削除する。
	 */
	public void setSearch(String search) {
	    this.search = search;
	}

}
