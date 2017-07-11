package com.internousdev.openconnect.project.progress.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.project.progress.dao.ProjectProgressSelectDAO;
import com.internousdev.openconnect.project.progress.dto.ProjectProgressDTO;
import com.internousdev.openconnect.projects.dao.ProjectsSelectDAO;
import com.internousdev.openconnect.projects.dto.ProjectsSelectDTO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 画面で受け取った内容に似た物を、DBのプロジェクト名から検索する為のクラス
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectProgressSelectAction extends ActionSupport {
	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -75847044350L;
	/**
	 * 検索キーワード
	 */
	private String search="";
	/**
	 * 検索キーワードリスト
	 */
	private List<ProjectProgressDTO> searchList = new ArrayList<ProjectProgressDTO>();
	/**
	 * プロジェクトリスト
	 */
	private List<ProjectsSelectDTO> projectsList = new ArrayList<ProjectsSelectDTO>();
	/**
	 * 検索結果
	 */
	private String resultSelect = "該当する情報は存在しません。";
	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 *
	 * @author TATUHUMI ITOU
	 * @param search
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result = ERROR;
		ProjectProgressSelectDAO dao = new ProjectProgressSelectDAO();
		ProjectsSelectDAO projectsDao = new ProjectsSelectDAO();
		searchList = dao.select(search);
		projectsList = projectsDao.select("");
		if (searchList.size() != 0) {
			result = SUCCESS;
			resultSelect = "検索結果を表示しました。";
		}
		return result;
	}

	/**
	* 取得メソッド  検索結果を取得
	* @author YUICHI KIRIU
	* @return resultSelect
	*/
	public String getResultSelect() {
		return resultSelect;
	}

	/**
	* 設定メソッド 検索結果を設定
	* @author YUICHI KIRIU
	* @param resultSelect
	*/
	public void setResultSelect(String resultSelect) {
		this.resultSelect = resultSelect;
	}

	/**
	* 取得メソッド シリアル番号を取得
	* @author YUICHI KIRIU
	* @return serialVersionUID
	*/
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 *  取得メソッド searchを取得する
	 * @author TATUHUMI ITOU
	 * @return search
	 */
	public String getSearch() {
		return search;
	}
	/**
	 *   格納メソッド searchを格納する
	 * @author TATUHUMI ITOU
	 * @param search セットする　search
	 */
	public void setSearch(String search) {
		this.search = search;
	}

	/**
	 *  取得メソッド 検索リストを取得する
	 * @author TATUHUMI ITOU
	 * @return searchList
	 */
	public List<ProjectProgressDTO> getSearchList() {
		return searchList;
	}
	/**
	 *   格納メソッド IDリストを格納する
	 * @author TATUHUMI ITOU
	 * @param searchList セットする searchList
	 */
	public void setSearchList(List<ProjectProgressDTO> searchList) {
		this.searchList = searchList;
	}
	/**
	 *   取得メソッド プロジェクトリストを取得する
	 * @author MASAHIRO KEDSUKA
	 * @param projectsList セットする projectsList
	 */
	public List<ProjectsSelectDTO> getProjectsList() {
		return projectsList;
	}
	/**
	 *   格納メソッド プロジェクトリストを格納する
	 * @author MASAHIRO KEDSUKA
	 * @param projectsList セットする projectsList
	 */
	public void setProjectsList(List<ProjectsSelectDTO> projectsList) {
		this.projectsList = projectsList;
	}



}