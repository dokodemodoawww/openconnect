/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import java.sql.SQLException;

import com.internousdev.openconnect.attendance.dao.AdminAttendanceUpdateDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
public class AdminAttendanceUpdateAction extends ActionSupport{

	/**
     * シリアル番号
     */
    private static final long serialVersionUID = 8587637642584563442L;

//    ユーザーID
    private int userId;
//    出欠
    private String attendance;
//    備考
    private String reason;
//    年
    private int atYear;
//    月
    private int atMonth;
//    日
    private int atDay;

    public String execute() throws SQLException {

        String result = ERROR;
        AdminAttendanceUpdateDAO dao = new AdminAttendanceUpdateDAO();
        int count = 0;
        count = dao.update(userId,attendance,reason,atYear,atMonth,atDay);
        if (count != 0) {
            result = SUCCESS;

        }
        return result;
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
	* @return attendance
	*/
	public String getAttendance() {
		return attendance;
	}
	/**
	* 設定メソッド を設定
	* @param attendance
	*/
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	/**
	* 取得メソッド を取得
	* @return reason
	*/
	public String getReason() {
		return reason;
	}
	/**
	* 設定メソッド を設定
	* @param reason
	*/
	public void setReason(String reason) {
		this.reason = reason;
	}


	/**
	* 取得メソッド を取得
	* @return atYear
	*/
	public int getAtYear() {
		return atYear;
	}


	/**
	* 設定メソッド を設定
	* @param atYear
	*/
	public void setAtYear(int atYear) {
		this.atYear = atYear;
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
	* @return atDay
	*/
	public int getAtDay() {
		return atDay;
	}


	/**
	* 設定メソッド を設定
	* @param atDay
	*/
	public void setAtDay(int atDay) {
		this.atDay = atDay;
	}

}
