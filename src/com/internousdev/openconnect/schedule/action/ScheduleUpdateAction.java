package com.internousdev.openconnect.schedule.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.schedule.dao.ScheduleUpdateDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * スケジュール一覧で入力された値を更新するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */
public class ScheduleUpdateAction extends ActionSupport {

	/**
	 * シリアル番号
	 */
	private static final long serialVersionUID = 2437915534439167729L;

	/**
	 * ID
	 * @author MASAHIRO KEDSUKA
	 */
	private List<Integer> scheduleIdList = new ArrayList<Integer>();

	private List<Integer> scheduleList = new ArrayList<Integer>();

	/**
	 * 開始日
	 * @author MASAHIRO KEDSUKA
	 */
	private List<String> scheduleStartdayList = new ArrayList<String>();

	/**
	 *終了日
	 * @author MASAHIRO KEDSUKA
	 */
	private List<String> scheduleEnddayList = new ArrayList<String>();

	/**
	 * 件名
	 * @author MASAHIRO KEDSUKA
	 */
	private List<String> scheduleTitleList = new ArrayList<String>();

	/**
	 * 内容
	 * @author MASAHIRO KEDSUKA
	 */
	private List<String> scheduleContentList = new ArrayList<String>();

	/**
	 * とりあえず用意してあるチームリスト
	 * @author WATARU AMEMIYA
	 */
	private List<String> scheduleTeamList = new ArrayList<String>();
	private List<String> teamList = new ArrayList<String>();

	/**
	 * エラーメッセージ
	 * @author MASAHIRO KEDSUKA
	 */
	private String errorMsg;


	/**
	 * 成功メッセージ
	 * @author MASAHIRO KEDSUKA
	 */
	private String successMsg;

	/**
	 * ScheduleSelectAcitionにチーム名渡すための変数
	 * @author WATARU AMEMIYA
	 */
	private String search;

	/**
	 * jspから配列teamNameを取得する
	 * @author WATARU AMEMIYA
	 */
	private List<String> teamName = new ArrayList<String>();


	/**
	 * 更新のメソッド。
	 */
	public String execute(){
		String ret = ERROR;

		search = teamName.get(0);

		ScheduleUpdateDAO dao = new ScheduleUpdateDAO();
		int count = 0;

		for(int i = 0 ; i < scheduleIdList.size() ;++i){
			count = dao.update(
					scheduleIdList.get(i),
					scheduleStartdayList.get(i),
					scheduleEnddayList.get(i),
					scheduleTitleList.get(i)
					);
		}
		if ( count > 0) {
			successMsg=(getText("更新しました。"));
			ret = SUCCESS;
		} else {
			errorMsg=(getText("更新できませんでした"));
		}
		return ret;
	}


	/**
	 * IDを取得します。
	 * @return ID
	 */
	public List<Integer> getScheduleIdList() {
	    return scheduleIdList;
	}


	/**
	 * IDを設定します。
	 * @param scheduleIdList ID
	 */
	public void setScheduleIdList(List<Integer> scheduleIdList) {
	    this.scheduleIdList = scheduleIdList;
	}


	/**
	 * scheduleListを取得します。
	 * @return scheduleList
	 */
	public List<Integer> getScheduleList() {
	    return scheduleList;
	}


	/**
	 * scheduleListを設定します。
	 * @param scheduleList scheduleList
	 */
	public void setScheduleList(List<Integer> scheduleList) {
	    this.scheduleList = scheduleList;
	}


	/**
	 * 開始日を取得します。
	 * @return 開始日
	 */
	public List<String> getScheduleStartdayList() {
	    return scheduleStartdayList;
	}


	/**
	 * 開始日を設定します。
	 * @param scheduleStartdayList 開始日
	 */
	public void setScheduleStartdayList(List<String> scheduleStartdayList) {
	    this.scheduleStartdayList = scheduleStartdayList;
	}


	/**
	 * 終了日を取得します。
	 * @return 終了日
	 */
	public List<String> getScheduleEnddayList() {
	    return scheduleEnddayList;
	}


	/**
	 * 終了日を設定します。
	 * @param scheduleEnddayList 終了日
	 */
	public void setScheduleEnddayList(List<String> scheduleEnddayList) {
	    this.scheduleEnddayList = scheduleEnddayList;
	}


	/**
	 * 件名を取得します。
	 * @return 件名
	 */
	public List<String> getScheduleTitleList() {
	    return scheduleTitleList;
	}


	/**
	 * 件名を設定します。
	 * @param scheduleTitleList 件名
	 */
	public void setScheduleTitleList(List<String> scheduleTitleList) {
	    this.scheduleTitleList = scheduleTitleList;
	}


	/**
	 * 内容を取得します。
	 * @return 内容
	 */
	public List<String> getScheduleContentList() {
	    return scheduleContentList;
	}


	/**
	 * 内容を設定します。
	 * @param scheduleContentList 内容
	 */
	public void setScheduleContentList(List<String> scheduleContentList) {
	    this.scheduleContentList = scheduleContentList;
	}


	/**
	 * とりあえず用意してあるチームリストを取得します。
	 * @return とりあえず用意してあるチームリスト
	 */
	public List<String> getScheduleTeamList() {
	    return scheduleTeamList;
	}


	/**
	 * とりあえず用意してあるチームリストを設定します。
	 * @param scheduleTeamList とりあえず用意してあるチームリスト
	 */
	public void setScheduleTeamList(List<String> scheduleTeamList) {
	    this.scheduleTeamList = scheduleTeamList;
	}


	/**
	 * teamListを取得します。
	 * @return teamList
	 */
	public List<String> getTeamList() {
	    return teamList;
	}


	/**
	 * teamListを設定します。
	 * @param teamList teamList
	 */
	public void setTeamList(List<String> teamList) {
	    this.teamList = teamList;
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
	 * ScheduleSelectAcitionにチーム名渡すための変数を取得します。
	 * @return ScheduleSelectAcitionにチーム名渡すための変数
	 */
	public String getSearch() {
	    return search;
	}


	/**
	 * ScheduleSelectAcitionにチーム名渡すための変数を設定します。
	 * @param search ScheduleSelectAcitionにチーム名渡すための変数
	 */
	public void setSearch(String search) {
	    this.search = search;
	}


	/**
	 * jspからteamNameを取得するを取得します。
	 * @return jspからteamNameを取得する
	 */
	public List<String> getTeamName() {
	    return teamName;
	}


	/**
	 * jspからteamNameを取得するを設定します。
	 * @param teamName jspからteamNameを取得する
	 */
	public void setTeamName(List<String> teamName) {
	    this.teamName = teamName;
	}


		}