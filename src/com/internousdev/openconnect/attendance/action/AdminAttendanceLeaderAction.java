/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.attendance.dao.AdminAttendanceLeaderDAO;
import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author Kawamura
 * @since 6/29
 * @version 1.0.0
 */
public class AdminAttendanceLeaderAction extends ActionSupport implements SessionAware{

	/* 自動入力 年 */
	private int atYear;
	/* 自動入力 月 */
	private int atMonth;
	/* 自動入力 日 */
	private int atDay;
	/* 日付 */
	private String atDate;
	/* 受講開始 月 */
	private String month;
	/* 漢字 姓 */
	private String familyNameKanji;
	/* 漢字 名 */
	private String givenNameKanji;
	/* チーム名 */
	private String teamName;
	/* 勤怠 */
	private String attendance;
	/* 備考 */
	private String reason;

	/* 出席数 */
	private int present = 0;
	/* 欠席数 */
	private int absent = 0;
	/* 遅刻数 */
	private int late = 0;
	/* 早退数 */
	private int early = 0;
	/* 連絡なし数 */
	private int noContact = 0;
	/* エラーメッセージ */
	private String errorMsg;
	/* ユーザーリスト */
	private ArrayList<AttendanceDTO> searchList = new ArrayList<AttendanceDTO>();
	/**
	 * セッション
	 */
	private Map<String,Object> session;

	/**
	 * チームリスト
	 */
	private ArrayList<AttendanceDTO> atTeamList = new ArrayList<AttendanceDTO>();

	/**
	 * ユーザID
	 */
	private int userId;





	public String execute(){

		String result = ERROR;
		System.out.println("AAA");
		System.out.println(this.getTeamName());

		AdminAttendanceLeaderDAO dao = new AdminAttendanceLeaderDAO();
		searchList = dao.select(atYear,atMonth,atDay,attendance,teamName);

//			int userId = (int) session.get("userId");
//			AdminAttendanceLeaderDAO dao2 = new AdminAttendanceLeaderDAO();
//		atTeamList = dao2.select2(userId);

		for(int i = 0; i<searchList.size(); i++){
			String attend = searchList.get(i).getAttendance();
			if(attend.equals("出席")){
				present = present + 1;
			} else if(attend.equals("欠席")){
				absent = absent + 1;
			} else if(attend.equals("遅刻")){
				late = late + 1;
			} else if(attend.equals("早退")){
				early = early + 1;
			}  else if(attend.equals("連絡なし")){
				noContact = noContact + 1;
			}
		}

		if(searchList.size() > 0){
			result = SUCCESS;
		}else{
			this.errorMsg="報告がありません。";
		}
		return result;


	}

	/**
	 * atYearを取得します。
	 * @return atYear
	 */
	public int getAtYear() {
	    return atYear;
	}
	/**
	 * atYearを設定します。
	 * @param atYear atYear
	 */
	public void setAtYear(int atYear) {
	    this.atYear = atYear;
	}
	/**
	 * atMonthを取得します。
	 * @return atMonth
	 */
	public int getAtMonth() {
	    return atMonth;
	}
	/**
	 * atMonthを設定します。
	 * @param atMonth atMonth
	 */
	public void setAtMonth(int atMonth) {
	    this.atMonth = atMonth;
	}
	/**
	 * atDayを取得します。
	 * @return atDay
	 */
	public int getAtDay() {
	    return atDay;
	}
	/**
	 * atDayを設定します。
	 * @param atDay atDay
	 */
	public void setAtDay(int atDay) {
	    this.atDay = atDay;
	}
	/**
	 * atDateを取得します。
	 * @return atDate
	 */
	public String getAtDate() {
	    return atDate;
	}
	/**
	 * atDateを設定します。
	 * @param atDate atDate
	 */
	public void setAtDate(String atDate) {
	    this.atDate = atDate;
	}
	/**
	 * monthを取得します。
	 * @return month
	 */
	public String getMonth() {
	    return month;
	}
	/**
	 * monthを設定します。
	 * @param month month
	 */
	public void setMonth(String month) {
	    this.month = month;
	}
	/**
	 * familyNameKanjiを取得します。
	 * @return familyNameKanji
	 */
	public String getFamilyNameKanji() {
	    return familyNameKanji;
	}
	/**
	 * familyNameKanjiを設定します。
	 * @param familyNameKanji familyNameKanji
	 */
	public void setFamilyNameKanji(String familyNameKanji) {
	    this.familyNameKanji = familyNameKanji;
	}
	/**
	 * givenNameKanjiを取得します。
	 * @return givenNameKanji
	 */
	public String getGivenNameKanji() {
	    return givenNameKanji;
	}
	/**
	 * givenNameKanjiを設定します。
	 * @param givenNameKanji givenNameKanji
	 */
	public void setGivenNameKanji(String givenNameKanji) {
	    this.givenNameKanji = givenNameKanji;
	}
	/**
	 * teamNameを取得します。
	 * @return teamName
	 */
	public String getTeamName() {
	    return teamName;
	}
	/**
	 * teamNameを設定します。
	 * @param teamName teamName
	 */
	public void setTeamName(String teamName) {
	    this.teamName = teamName;
	}
	/**
	 * attendanceを取得します。
	 * @return attendance
	 */
	public String getAttendance() {
	    return attendance;
	}
	/**
	 * attendanceを設定します。
	 * @param attendance attendance
	 */
	public void setAttendance(String attendance) {
	    this.attendance = attendance;
	}
	/**
	 * reasonを取得します。
	 * @return reason
	 */
	public String getReason() {
	    return reason;
	}
	/**
	 * reasonを設定します。
	 * @param reason reason
	 */
	public void setReason(String reason) {
	    this.reason = reason;
	}
	/**
	 * presentを取得します。
	 * @return present
	 */
	public int getPresent() {
	    return present;
	}
	/**
	 * presentを設定します。
	 * @param present present
	 */
	public void setPresent(int present) {
	    this.present = present;
	}
	/**
	 * absentを取得します。
	 * @return absent
	 */
	public int getAbsent() {
	    return absent;
	}
	/**
	 * absentを設定します。
	 * @param absent absent
	 */
	public void setAbsent(int absent) {
	    this.absent = absent;
	}
	/**
	 * lateを取得します。
	 * @return late
	 */
	public int getLate() {
	    return late;
	}
	/**
	 * lateを設定します。
	 * @param late late
	 */
	public void setLate(int late) {
	    this.late = late;
	}
	/**
	 * earlyを取得します。
	 * @return early
	 */
	public int getEarly() {
	    return early;
	}
	/**
	 * earlyを設定します。
	 * @param early early
	 */
	public void setEarly(int early) {
	    this.early = early;
	}
	/**
	 * errorMsgを取得します。
	 * @return errorMsg
	 */
	public String getErrorMsg() {
	    return errorMsg;
	}


	/**
	 * errorMsgを設定します。
	 * @param errorMsg errorMsg
	 */
	public void setErrorMsg(String errorMsg) {
	    this.errorMsg = errorMsg;
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
	* @return atTeamList
	*/
	public ArrayList<AttendanceDTO> getAtTeamList() {
		return atTeamList;
	}


	/**
	* 設定メソッド を設定
	* @param atTeamList
	*/
	public void setAtTeamList(ArrayList<AttendanceDTO> atTeamList) {
		this.atTeamList = atTeamList;
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
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}

	/* (非 Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ

	}

	public String getAllTeamNames(){
		return "";
	}

	/**
	* 取得メソッド を取得
	* @return noContact
	*/
	public int getNoContact() {
		return noContact;
	}

	/**
	* 設定メソッド を設定
	* @param noContact
	*/
	public void setNoContact(int noContact) {
		this.noContact = noContact;
	}


}
