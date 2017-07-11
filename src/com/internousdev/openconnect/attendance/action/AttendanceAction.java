
/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.attendance.dao.AttendanceCheckDAO;
import com.internousdev.openconnect.attendance.dao.AttendanceDAO;
import com.internousdev.openconnect.attendance.dao.GoAttendanceDAO;
import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * AttendanceAction
 * 出欠情報をDBに格納するメソッド
 * @author Teppei Matsumoto
 *@since 2017/06/02
 *@version 1.0
 */
public class AttendanceAction extends ActionSupport implements SessionAware {

	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = -5350844672857079386L;

	/**
	 * ユーザーID
	 * joinでuser_nameを引っ張って来たい
	 */
	private int userId;

	/**
	 * 出欠状況
	 */
	private String attendance;

	/**
	 * 備考欄
	 */
	private String reason;

	/**
	 * ユーザー情報
	 */
	private Map<String, Object> session;

	/**
	 * 報告年
	 */
	private int atYear;

	/**
	 * 報告月
	 */
	private int atMonth;

	/**
	 * 報告日
	 */
	private int atDay;

	/**
	 * チーム名
	 */
    private String teamName;
	/**
	 * 漢字姓
	 */
	private String familyNameKanji;

	/**
	 * 漢字名
	 */
	private String givenNameKanji;

	/**
	 * エラーメッセージ
	 */
	private String errorMsg;


	/**
	 * ユーザーリスト
	 */
	private ArrayList<AttendanceDTO> atUserList = new ArrayList<AttendanceDTO>();

	private ArrayList<AttendanceDTO> searchList = new ArrayList<AttendanceDTO>();

	/**
	 * 実行メソッド 出欠状況の送信処理をする
	 * @author Teppei Matsumoto
	 * @since 2017/06/02
	 * @return SUCCESS/ERROR
	 */
	public String execute(){
		String result =ERROR;
		int userId = (int) session.get("userId");
		AttendanceCheckDAO dao2 = new AttendanceCheckDAO();
		searchList = dao2.select(userId,atYear,atMonth,atDay);

		if(searchList.size() > 0){
			GoAttendanceDAO dao3 = new GoAttendanceDAO();
			atUserList = dao3.select(userId);
			  this.errorMsg="１日１回しか報告できません。";
			  System.out.println("test");
			result = ERROR;
		}
		else if(session.get("userId") != null){
			  AttendanceDAO dao=new AttendanceDAO();
			  atUserList = dao.select(userId);

		    if(dao.insert(userId,atYear,atMonth,atDay,attendance,reason) > 0 && atUserList.size() > 0){
		      result = SUCCESS;

				}
		}
		  return result;
	}

	/**
	 * ユーザーIDを取得します。
	 * @return ユーザーID
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * ユーザーIDを設定します。
	 * @param userId ユーザーID
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * 出欠状況を取得します。
	 * @return 出欠状況
	 */
	public String getAttendance() {
		return attendance;
	}

	/**
	 * 出欠状況を設定します。
	 * @param attendance 出欠状況
	 */
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}

	/**
	 * 報告年を取得します。
	 * @return 報告年
	 */
	public int getAtYear() {
		return atYear;
	}

	/**
	 * 報告年を設定します。
	 * @param atYear 報告年
	 */
	public void setAtYear(int atYear) {
		this.atYear = atYear;
	}

	/**
	 * 報告月を取得します。
	 * @return 報告月
	 */
	public int getAtMonth() {
		return atMonth;
	}

	/**
	 * 報告月を設定します。
	 * @param atMonth 報告月
	 */
	public void setAtMonth(int atMonth) {
		this.atMonth = atMonth;
	}

	/**
	 * 漢字姓を取得します。
	 * @return 漢字姓
	 */
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}

	/**
	 * 漢字姓を設定します。
	 * @param familyNameKanji 漢字姓
	 */
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}

	/**
	 * 漢字名を取得します。
	 * @return 漢字名
	 */
	public String getGivenNameKanji() {
		return givenNameKanji;
	}

	/**
	 * 漢字名を設定します。
	 * @param givenNameKanji 漢字名
	 */
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}

	/**
	 * 備考欄を取得します。
	 * @return 備考欄
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * 備考欄を設定します。
	 * @param reason 備考欄
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * @return session
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * @param session セットする session
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * 報告日を取得します。
	 * @return 報告日
	 */
	public int getAtDay() {
		return atDay;
	}

	/**
	 * 報告日を設定します。
	 * @param atDay 報告日
	 */
	public void setAtDay(int atDay) {
		this.atDay = atDay;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return teamName
	*/
	public String getTeamName() {
		return teamName;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param teamName
	*/
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	/**
	 * ユーザーリストを取得します。
	 * @return ユーザーリスト
	 */
	public ArrayList<AttendanceDTO> getAtUserList() {
		return atUserList;
	}

	/**
	 * ユーザーリストを設定します。
	 * @param atUserList ユーザーリスト
	 */
	public void setAtUserList(ArrayList<AttendanceDTO> atUserList) {
		this.atUserList = atUserList;
	}

	/**
	 * searchListを取得します。
	 * @return searchList
	 */
	public ArrayList<AttendanceDTO> getSearchList() {
	    return searchList;
	}

	/**
	 * searchListを設定します。
	 * @param searchList searchList
	 */
	public void setSearchList(ArrayList<AttendanceDTO> searchList) {
	    this.searchList = searchList;
	}

	/**
	* 取得メソッド を取得
	* @return errorMsg
	*/
	public String getErrorMsg() {
		return errorMsg;
	}

	/**
	* 設定メソッド を設定
	* @param errorMsg
	*/
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}


}
