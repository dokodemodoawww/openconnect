/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.attendance.dao.AdminAttendanceSelectDAO;
import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
public class AdminAttendanceSelectAction extends ActionSupport implements SessionAware{


	private int atMonth;

	private ArrayList<AttendanceDTO> selectList = new ArrayList<AttendanceDTO>();

	public String execute() {

		String result = ERROR;


		AdminAttendanceSelectDAO dao = new AdminAttendanceSelectDAO();
		selectList = dao.select(atMonth);


	if(selectList.size() > 0){
		result=SUCCESS;
	}else{

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

	/* (非 Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ

	}






	/**
	 * selectListを取得します。
	 * @return selectList
	 */
	public ArrayList<AttendanceDTO> getSelectList() {
	    return selectList;
	}






	/**
	 * selectListを設定します。
	 * @param selectList selectList
	 */
	public void setSelectList(ArrayList<AttendanceDTO> selectList) {
	    this.selectList = selectList;
	}




}
