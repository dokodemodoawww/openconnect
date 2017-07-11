/**
 *
 */
package com.internousdev.openconnect.attendance.dto;

/**
 * DBの情報を画面に表示する為のクラス
 * @author MINORI SUNAGAWA
 * @since 2016/09/04
 * @version 1.0
 */
public class AttendanceDTO {
	/*
	 * 手入力の報告年
	 */
	private int atYear;
    /*
     * 手入力の報告月
     */
	private int atMonth;
	/*
	 * 手入力の報告日
	 */
	private int atDay;
	/**
	 * 日付
	 */
	private String atDate;
	/**
	 * ユーザーID
	 */
	private int userId;
	/**
	 * 受講年
	 */
	private String year;
	/**
	 * 受講開始月
	 */
	private String month;
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
	 * かな性
	 */
	private String familyNameKana;
	/**
	 * かな名
	 */
	private String givenNameKana;
	/**
	 * 勤怠
	 */
	private String attendance;
	/**
	 * 勤怠文字
	 */
	private String attendanceString;
	/**
	 * 面談
	 */
	private int interview;
	/**
	 * 面談文字
	 */
	private String interviewString;
	/**
	 * 備考
	 */
    private String reason;

    /**
     * ユーザー名
     */
    private String userName;

	/**
     * テストカウント
     */
    private int testCount;

    private int syusseki;
	private int kesseki;
	/**
	* 取得メソッド 日付を取得
	* @author MINORI SUNAGAWA
	* @return date
	*/
	public String getAtDate() {
		return atDate;
	}
	/**
	* 設定メソッド 日付を設定
	* @author MINORI SUNAGAWA
	* @param date
	*/
	public void setAtDate(String atDate) {
		this.atDate = atDate;
	}

	/**
	* 取得メソッド ユーザーIDを取得
	* @author MINORI SUNAGAWA
	* @return userId
	*/
	public int getUserId() {
		return userId;
	}
	/**
	* 設定メソッド ユーザーIDを設定
	* @author MINORI SUNAGAWA
	* @param userId
	*/
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	* 取得メソッド 受講年を取得
	* @author MINORI SUNAGAWA
	* @return year
	*/
	public String getYear() {
		return year;
	}
	/**
	* 設定メソッド 受講年を設定
	* @author MINORI SUNAGAWA
	* @param year
	*/
	public void setYear(String year) {
		this.year = year;
	}
	/**
	* 取得メソッド 受講開始月を取得
	* @author MINORI SUNAGAWA
	* @return month
	*/
	public String getMonth() {
		return month;
	}
	/**
	* 設定メソッド 受講開始月を設定
	* @author MINORI SUNAGAWA
	* @param month
	*/
	public void setMonth(String month) {
		this.month = month;
	}
	/**
	* 取得メソッド 漢字姓を取得
	* @author MINORI SUNAGAWA
	* @return familyNameKanji
	*/
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}
	/**
	* 設定メソッド 漢字姓を設定
	* @author MINORI SUNAGAWA
	* @param familyNameKanji
	*/
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}
	/**
	* 取得メソッド 漢字名を取得
	* @author MINORI SUNAGAWA
	* @return givenNameKanji
	*/
	public String getGivenNameKanji() {
		return givenNameKanji;
	}
	/**
	* 設定メソッド 漢字名を設定
	* @author MINORI SUNAGAWA
	* @param givenNameKanji
	*/
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}
	/**
	* 取得メソッド かな性を取得
	* @author MINORI SUNAGAWA
	* @return familyNameKana
	*/
	public String getFamilyNameKana() {
		return familyNameKana;
	}
	/**
	* 設定メソッド かな姓を設定
	* @author MINORI SUNAGAWA
	* @param familyNameKana
	*/
	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}
	/**
	* 取得メソッド  かな名を取得
	* @author MINORI SUNAGAWA
	* @return givenNameKana
	*/
	public String getGivenNameKana() {
		return givenNameKana;
	}
	/**
	* 設定メソッド かな名を設定
	* @author MINORI SUNAGAWA
	* @param givenNameKana
	*/
	public void setGivenNameKana(String givenNameKana) {
		this.givenNameKana = givenNameKana;
	}
	/**
	* 取得メソッド 勤怠を取得
	* @author MINORI SUNAGAWA
	* @return attendance
	*/
	public String getAttendance() {
		return attendance;
	}
	/**
	* 設定メソッド 勤怠を設定
	* @author MINORI SUNAGAWA
	* @param attendance
	*/
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	/**
	* 取得メソッド 面談を取得
	* @author MINORI SUNAGAWA
	* @return interview
	*/
	public int getInterview() {
		return interview;
	}
	/**
	* 設定メソッド 面談を設定
	* @author MINORI SUNAGAWA
	* @param interview
	*/
	public void setInterview(int interview) {
		this.interview = interview;
	}
	/**
	* 取得メソッド 勤怠文字を取得
	* @author MINORI SUNAGAWA
	* @return attendanceString
	*/
	public String getAttendanceString() {
		return attendanceString;
	}
	/**
	* 設定メソッド 勤怠文字を設定
	* @author MINORI SUNAGAWA
	* @param attendanceString
	*/
	public void setAttendanceString(String attendanceString) {
		this.attendanceString = attendanceString;
	}
	/**
	* 取得メソッド 面談文字を取得
	* @author MINORI SUNAGAWA
	* @return interviewString
	*/
	public String getInterviewString() {
		return interviewString;
	}
	/**
	* 設定メソッド  面談文字を設定
	* @author MINORI SUNAGAWA
	* @param interviewString
	*/
	public void setInterviewString(String interviewString) {
		this.interviewString = interviewString;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return reason
	*/
	public String getReason() {
		return reason;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param reason
	*/
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return atYear
	*/
	public int getAtYear() {
		return atYear;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param atYear
	*/
	public void setAtYear(int atYear) {
		this.atYear = atYear;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return atMonth
	*/
	public int getAtMonth() {
		return atMonth;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param atMonth
	*/
	public void setAtMonth(int atMonth) {
		this.atMonth = atMonth;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return atDay
	*/
	public int getAtDay() {
		return atDay;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param atDay
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
	 * テストカウントを取得します。
	 * @return テストカウント
	 */
	public int getTestCount() {
	    return testCount;
	}
	/**
	 * テストカウントを設定します。
	 * @param testCount テストカウント
	 */
	public void setTestCount(int testCount) {
	    this.testCount = testCount;
	}
	/**
	 * syussekiを取得します。
	 * @return syusseki
	 */
	public int getSyusseki() {
	    return syusseki;
	}
	/**
	 * syussekiを設定します。
	 * @param syusseki syusseki
	 */
	public void setSyusseki(int syusseki) {
	    this.syusseki = syusseki;
	}
	/**
	 * kessekiを取得します。
	 * @return kesseki
	 */
	public int getKesseki() {
	    return kesseki;
	}
	/**
	 * kessekiを設定します。
	 * @param kesseki kesseki
	 */
	public void setKesseki(int kesseki) {
	    this.kesseki = kesseki;
	}

	 /**
		* 取得メソッド を取得
		* @return userName
		*/
		public String getUserName() {
			return userName;
		}
		/**
		* 設定メソッド を設定
		* @param userName
		*/
		public void setUserName(String userName) {
			this.userName = userName;
		}

}
