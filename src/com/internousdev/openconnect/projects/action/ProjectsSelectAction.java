package com.internousdev.openconnect.projects.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.projects.dao.ProjectsSelectDAO;
import com.internousdev.openconnect.projects.dto.ProjectsSelectDTO;
import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 検索したＤＢ情報を画面に表示する為のクラス
 *
 * @author YUICHI KIRIU
 * @since 2016/09/7
 *
 */
public class ProjectsSelectAction extends ActionSupport {
	/**
	 * シリアルＩＤ
	 */
	private static final long serialVersionUID = -4601966790767506826L;

	/**
	 * 検索ワード
	 */
	private String search = "";

	private int user_id = 1;

	/**
	 * 検索結果文字
	 */
	private String resultSelect = "該当する情報は存在しません";

	/**
	* 取得メソッド を取得
	* @return user_id
	*/
	public int getUser_id() {
		return user_id;
	}

	/**
	* 設定メソッド を設定
	* @param user_id
	*/
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	/**
	 * 検索リスト
	 */
	private List<ProjectsSelectDTO> searchList = new ArrayList<ProjectsSelectDTO>();

	/**
	 * 受講生リスト
	 */
	private List<StudentsDTO> studentsList = new ArrayList<StudentsDTO>();

	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 *
	 * @author YUICHI KIRIU TATUHUMI ITOU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result = ERROR;
		ProjectsSelectDAO dao = new ProjectsSelectDAO();
		searchList = dao.select(search);

		for (int i = 0; i < searchList.size(); i++) {

			ProjectsSelectDTO dto = new ProjectsSelectDTO();

			dto = dao.selectId(searchList.get(i).getSubManagerId());
			searchList.get(i).setSubManagerGivenNameKanji(dto.getSubManagerGivenNameKanji());
			searchList.get(i).setSubManagerFamilyNameKanji(dto.getSubManagerFamilyNameKanji());
		}
		if(dao.search(search) == null){

			return result;
		}else{
			studentsList = dao.search(search);
		}

		if (searchList.size() != 0) {
			result = SUCCESS;
			if (search.equals("")) {
				resultSelect = "すべてを表示しました。";
			} else {
				resultSelect = search + " を検索しました。";

			}
		}
		return result;




	}

	/**
	 * 取得メソッド 検索ワードを取得
	 *
	 * @author YUICHI KIRIU
	 * @return search
	 */
	public String getSearch() {
		return search;
	}

	/**
	 * 設定メソッド 検索ワードを設定
	 *
	 * @author YUICHI KIRIU
	 * @param search
	 */
	public void setSearch(String search) {
		this.search = search;
	}

	/**
	 * 取得メソッド プロジェクトリストを取得
	 *
	 * @author YUICHI KIRIU
	 * @return projectList
	 */
	public List<ProjectsSelectDTO> getProjectList() {
		return searchList;
	}

	/**
	 * 設定メソッド プロジェクトリストを設定
	 *
	 * @author YUICHI KIRIU
	 * @param projectList
	 */
	public void setProjectList(List<ProjectsSelectDTO> projectList) {
		this.searchList = projectList;
	}

	/**
	 * 取得メソッド エラーメッセージを取得
	 *
	 * @author YUICHI KIRIU
	 * @return resultString
	 */
	public String getErrorMsg() {
		return resultSelect;
	}

	/**
	 * 設定メソッド エラーメッセージを設定
	 *
	 * @author YUICHI KIRIU
	 * @param resultString
	 */
	public void setErrorMsg(String resultSelect) {
		this.resultSelect = resultSelect;
	}

	/**
	 * 取得メソッド 検索結果文字を取得
	 *
	 * @author YUICHI KIRIU
	 * @return resultString
	 */
	public String getResultSelect() {
		return resultSelect;
	}

	/**
	 * 設定メソッド 検索結果文字を設定
	 *
	 * @author YUICHI KIRIU
	 * @param resultString
	 */
	public void setResultSelect(String resultSelect) {
		this.resultSelect = resultSelect;
	}

	/**
	 * 取得メソッド 検索リストを取得
	 *
	 * @author TATUHUMI ITOU
	 * @return searchList
	 */
	public List<ProjectsSelectDTO> getSearchList() {
		return searchList;
	}

	/**
	 * 設定メソッド 検索リストを設定
	 *
	 * @author TATUHUMI ITOU
	 * @param searchList
	 */
	public void setSearchList(List<ProjectsSelectDTO> searchList) {
		this.searchList = searchList;
	}

	/**
	 * 取得メソッド 受講生リストを取得
	 *
	 * @author TATUHUMI ITOU
	 * @return studentsList
	 */
	public List<StudentsDTO> getStudentsList() {
		return studentsList;
	}

	/**
	 * 設定メソッド 受講生リストを設定
	 *
	 * @author TATUHUMI ITOU
	 * @param studentsList
	 */
	public void setStudentsList(List<StudentsDTO> studentsList) {
		this.studentsList = studentsList;
	}

	/**
	 * 取得メソッド シリアル番号を取得
	 *
	 * @author TATUHUMI ITOU
	 * @return serialVersionUID
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
