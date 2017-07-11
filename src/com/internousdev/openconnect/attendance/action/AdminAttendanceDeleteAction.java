/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import com.internousdev.openconnect.attendance.dao.AdminAttendanceDeleteDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
public class AdminAttendanceDeleteAction extends ActionSupport {



	private int atMonth;

	private String deleteMsg;


	public String execute(){
		AdminAttendanceDeleteDAO dao = new AdminAttendanceDeleteDAO();
		String result = ERROR;
		int list=0;
		list=dao.delete(atMonth);
		if(list>0){
			result = SUCCESS;
			this.setDeleteMsg(atMonth + "月のデータを削除しました。");
		}else{
			this.setDeleteMsg(atMonth + "月のデータは入っていません。");
		}
		return result;
	}





	/**
	 * 取得メソッド を取得
	 * @return atMonth
	 */
	public int getAtMonth() {
		return atMonth;
	}

	/**
	 * 設定メソッド を設定
	 * @param atMonth
	 */
	public void setAtMonth(int atMonth) {
		this.atMonth = atMonth;
	}





	/**
	* 取得メソッド を取得
	* @return deleteMsg
	*/
	public String getDeleteMsg() {
		return deleteMsg;
	}





	/**
	* 設定メソッド を設定
	* @param msg
	*/
	public void setDeleteMsg(String deleteMsg) {
		this.deleteMsg = deleteMsg;
	}
}
