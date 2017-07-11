/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.attendance.dao.GoAttendanceDAO;
import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
** GoAttendanceAction 管理者画面にログインするためのアクション
 * @author Teppei Matsumoto
 * @since  2017/06/07
 * @version 1.0
 */
public class GoAttendanceAction extends ActionSupport implements SessionAware{


	private static final long serialVersionUID = 1181846755041839614L;

	/**
	 * セッション
	 */
	private Map<String,Object> session;

	/**
	 * ユーザーリスト
	 */
	private ArrayList<AttendanceDTO> atUserList = new ArrayList<AttendanceDTO>();

	/**
	 * ユーザID
	 */
	private int userId;

	/**
	 * 漢字姓
	 */
	private String familyNameKanji;

	/**
	 * 漢字名
	 */
	private String givenNameKanji;




	public String execute() {
		String result = ERROR;

		if(session.get("userId") != null){
			int userId = (int) session.get("userId");

			GoAttendanceDAO dao = new GoAttendanceDAO();
		atUserList = dao.select(userId);

		if(atUserList.size() > 0){
			result=SUCCESS;
		}
		}
	return result;
	}




	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}



	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param session
	*/
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return atUserList
	*/
	public ArrayList<AttendanceDTO> getAtUserList() {
		return atUserList;
	}



	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param atUserList
	*/
	public void setAtUserList(ArrayList<AttendanceDTO> atUserList) {
		this.atUserList = atUserList;
	}



	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return userId
	*/
	public int getUserId() {
		return userId;
	}



	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param userId
	*/
	public void setUserId(int userId) {
		this.userId = userId;
	}


	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return familyNameKanji
	*/
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}




	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param familyNameKanji
	*/
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}




	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return givenNameKanji
	*/
	public String getGivenNameKanji() {
		return givenNameKanji;
	}




	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param givenNameKanji
	*/
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}




}
