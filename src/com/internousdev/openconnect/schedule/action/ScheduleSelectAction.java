package com.internousdev.openconnect.schedule.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.schedule.dao.ScheduleSelectDAO;
import com.internousdev.openconnect.schedule.dto.ScheduleDTO;
import com.opensymphony.xwork2.ActionSupport;


/**
 * スケジュール一覧のDBを検索するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */
public class ScheduleSelectAction extends ActionSupport{


	/**
	 * シリアル番号
	 */
	private static final long serialVersionUID = -6055065667656806167L;

	/**
	 * @author MASAHIRO KEDSUKA
	 * スケジュールリスト
	 */
	private List<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();

	private List<ScheduleDTO> teamList = new ArrayList<ScheduleDTO>();

	/**
	 * 検索文
	 * @author MASAHIRO KEDSUKA
	 */
	private String search = "";

	/**
	 *成功メッセージ
	 * @author MASAHIRO KEDSUKA
	 */
	private String selectSuccessMsg;
	/**
	 *エラーメッセージ
	 * @author MASAHIRO KEDSUKA
	 */
	private String selectErrorMsg;

	/**
	 * 検索の実行メソッド
	 * @author MASAHIRO KEDSUKA
	 */
	public String execute() {
		String result = ERROR;

		if(search.equals("全件表示")){
			search = "";
		}
		ScheduleSelectDAO dao = new ScheduleSelectDAO();
		ScheduleSelectDAO dao2 = new ScheduleSelectDAO();
		scheduleList = dao.select(search);
		teamList	 = dao2.select2();
		if (scheduleList.size() != 0) {
			if(search.equals("")){
				selectSuccessMsg ="すべてを表示しました。";
			}else{selectSuccessMsg = (getText("「"+search+"」を検索しました。"));}
			result = SUCCESS;
		} else {
			selectErrorMsg = (getText("該当する情報は存在しません"));
		}
		return result;
	}

	/**
	 * @author MASAHIRO KEDSUKAを取得します。
	 * @return @author MASAHIRO KEDSUKA
	 */
	public List<ScheduleDTO> getScheduleList() {
	    return scheduleList;
	}

	/**
	 * @author MASAHIRO KEDSUKAを設定します。
	 * @param scheduleList @author MASAHIRO KEDSUKA
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
	 * 検索文を取得します。
	 * @return 検索文
	 */
	public String getSearch() {
	    return search;
	}

	/**
	 * 検索文を設定します。
	 * @param search 検索文
	 */
	public void setSearch(String search) {
	    this.search = search;
	}

	/**
	 * 成功メッセージを取得します。
	 * @return 成功メッセージ
	 */
	public String getSelectSuccessMsg() {
	    return selectSuccessMsg;
	}

	/**
	 * 成功メッセージを設定します。
	 * @param selectSuccessMsg 成功メッセージ
	 */
	public void setSelectSuccessMsg(String selectSuccessMsg) {
	    this.selectSuccessMsg = selectSuccessMsg;
	}

	/**
	 * エラーメッセージを取得します。
	 * @return エラーメッセージ
	 */
	public String getSelectErrorMsg() {
	    return selectErrorMsg;
	}

	/**
	 * エラーメッセージを設定します。
	 * @param selectErrorMsg エラーメッセージ
	 */
	public void setSelectErrorMsg(String selectErrorMsg) {
	    this.selectErrorMsg = selectErrorMsg;
	}


	}