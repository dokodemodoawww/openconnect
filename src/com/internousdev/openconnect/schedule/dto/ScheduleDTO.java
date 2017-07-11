package com.internousdev.openconnect.schedule.dto;

/**
 * スケジュール一覧から検索したデータを溜め込むクラス。
 * @author WATARU AMEMIYA
 * @since 2016/09/07
 */
public class ScheduleDTO {

	/**
	 * id
	 * @author WATARU AMEMIYA
	 */
	private int id;

	private int userid;

	/**
	 * 開始日
	 * @author WATARU AMEMIYA
	 */
	private String startDay;

	/**
	 * 終了日
	 *@author WATARU AMEMIYA
	 */
	private String endDay;

	/**
	 * 件名
	 * @author WATARU AMEMIYA
	 */
	private String title;

	/**
	 * 内容
	 * @author WATARU AMEMIYA
	 */
	private String content;

	/**
	 * チーム
	 * @author WATARU AMEMIYA
	 */
	private String teamName;

	/**
	 * メモのコメント
	 * @author seiya takahashi
	 */
	private String comment;

	/**
	 * 取得メソッド IDを取得
	 * @author WATARU AMEMIYA
	 * @return id
	 */
	public int getId() {
		return id;
	}

	/**
	 * 設定メソッド IDを設定
	 * @author WATARU AMEMIYA
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * useridを取得します。
	 * @return userid
	 */
	public int getUserid() {
	    return userid;
	}

	/**
	 * useridを設定します。
	 * @param userid userid
	 */
	public void setUserid(int userid) {
	    this.userid = userid;
	}

	/**
	 * 取得メソッド 開始日を取得
	 * @author WATARU AMEMIYA
	 * @return startDay
	 */
	public String getStartDay() {
		return startDay;
	}

	/**
	 * 設定メソッド 開始日を設定
	 * @author WATARU AMEMIYA
	 * @param startDay
	 */
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	/**
	 * 取得メソッド 終了日を取得
	 * @author WATARU AMEMIYA
	 * @return endDay
	 */
	public String getEndDay() {
		return endDay;
	}

	/**
	 * 設定メソッド 終了日を設定
	 * @author WATARU AMEMIYA
	 * @param endDay
	 */
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	/**
	 * 取得メソッド 件名を取得
	 * @author WATARU AMEMIYA
	 * @return title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 設定メソッド 件名を設定
	 * @author WATARU AMEMIYA
	 * @param title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得メソッド 内容を取得
	 * @author WATARU AMEMIYA
	 * @return content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 設定メソッド 内容を設定
	 * @author WATARU AMEMIYA
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
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
	 * @param teamName
	 */
	public void setTeamName(String teamName) {
	    this.teamName = teamName;
	}

	/**
	 * commentを取得
	 * @return comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * commentを設定します。
	 * @param comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
}