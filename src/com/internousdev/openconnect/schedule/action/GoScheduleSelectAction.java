package com.internousdev.openconnect.schedule.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.schedule.dao.GoScheduleSelectDAO;
import com.internousdev.openconnect.schedule.dto.ScheduleDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoScheduleSelectAction extends ActionSupport implements SessionAware{

	/**
	 * @author WATARU AMEMIYA
	 * スケジュール情報を格納しておく変数
	 */
	private List<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();

	/**
	 * @author WATARU AMEMIYA
	 * チームの情報を格納しておく変数
	 */
	private List<ScheduleDTO> teamList = new ArrayList<ScheduleDTO>();

	/**
	 * @author WATARU AMEMIYA
	 * ログインしたユーザーidを格納しておく変数
	 */
	private int userId;

	/**
	  * @author WATARU AMEMIYA
	  * ログインしたチームの名前を格納しておく変数
	  */
	private String teamName;

	/**
	 * @author WATARU AMEMIYA
	 * jspに検索する文字列の変数として一応用意
	 * 現状○○さんのスケジュールなど、見出しを変更するためだけに使用
	 */
	private String search = "";

	/**
	 * @author WATARU AMEMIYA
	 * ログインしたユーザーの情報を格納する変数
	 */
	private Map<String,Object> session;

	/**
	 * 初めはuserIdでsql検索し、usersテーブルとscheduleテーブルを
	 * team_nameで紐付けて情報を結合して、サイトのテーブルに情報が表示できるようにしていた
	 * しかしこれだとscheduleテーブルに情報が入っていないときにエラーが起きるので
	 * GoScheduleSelectではusersテーブルからuserIdでteam_nameを持ってこれるようにして
	 * 検索についてはSchduleSelectにすべて任せることにした
	 * */
	public String execute(){
		String result = ERROR;
		int userId = (int) session.get("userId");
		/*GoScheduleSelectDAO dao = new GoScheduleSelectDAO();*/
		GoScheduleSelectDAO dao2 = new GoScheduleSelectDAO();
		/*scheduleList = dao.select(userId);*/
		teamList = dao2.select2(userId);
		search = teamList.get(0).getTeamName();
		result = SUCCESS;


		return result;
	}

	/**
	 * scheduleListを取得します。
	 * @return scheduleList
	 */
	public List<ScheduleDTO> getScheduleList() {
	    return scheduleList;
	}

	/**
	 * scheduleListを設定します。
	 * @param scheduleList scheduleList
	 */
	public void setScheduleList(List<ScheduleDTO> scheduleList) {
	    this.scheduleList = scheduleList;
	}

	/**
	 * teamListを取得します。
	 * @return teamList
	 */
	public List<ScheduleDTO> getTeamList() {
	    return teamList;
	}

	/**
	 * teamListを設定します。
	 * @param teamList teamList
	 */
	public void setTeamList(List<ScheduleDTO> teamList) {
	    this.teamList = teamList;
	}

	/**
	 * userIdを取得します。
	 * @return userId
	 */
	public int getUserId() {
	    return userId;
	}

	/**
	 * userIdを設定します。
	 * @param userId userId
	 */
	public void setUserId(int userId) {
	    this.userId = userId;
	}

	/**
	 * teamを取得します。
	 * @return team
	 */
	public String getTeam() {
	    return teamName;
	}

	/**
	 * teamを設定します。
	 * @param team team
	 */
	public void setTeam(String teamName) {
	    this.teamName = teamName;
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
	 * searchを取得します。
	 * @return search
	 */
	public String getSearch() {
	    return search;
	}

	/**
	 * searchを設定します。
	 * @param search search
	 */
	public void setSearch(String search) {
	    this.search = search;
	}

	/**
	 * sessionを取得します。
	 * @return session
	 */
	public Map<String,Object> getSession() {
	    return session;
	}

	/**
	 * sessionを設定します。
	 * @param session session
	 */
	public void setSession(Map<String,Object> session) {
	    this.session = session;
	}


}

