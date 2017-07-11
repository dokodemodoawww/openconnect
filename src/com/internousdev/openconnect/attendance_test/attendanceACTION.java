/**
 *
 */
package com.internousdev.openconnect.attendance_test;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 出欠状況を検索するクラス
 * @author 河村
 * @since 6/19
 * @version 1.0.0
 */
public class attendanceACTION extends ActionSupport implements SessionAware{


	private int atYear;
	private int atMonth;
	private int atDay;
	private String atDate;
	private String month;
	private String familyNameKanji;
	private String givenNameKanji;
	private String teamName;
	private String attendance;	//勤怠
	private String reason;


	/*ユーザーリスト*/
	private ArrayList<AttendanceDTO> searchList = new ArrayList<AttendanceDTO>();

	public String execute(){

		String result = ERROR;

		AttendanceDao dao = new AttendanceDao();
		searchList = dao.select(atYear,atMonth,atDay,attendance,teamName);
		if(searchList.size() > 0){
			result=SUCCESS;
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



	/* (非 Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ

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
}