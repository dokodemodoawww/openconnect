package com.internousdev.openconnect.projects.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.projects.dao.ProjectsListDAO;
import com.internousdev.openconnect.projects.dto.ProjectsListDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
DB情報を画面に表示させるクラス
 * @author YUICHI KIRIU
 * @since 2016/09/7
 * @version 1.0
 */
public class ProjectsAction extends ActionSupport{

	/**
	 *シリアル番号
	 */
	private static final long serialVersionUID = -62325123075153619L;

	/**
	 *プロジェクトリスト
	 */
	private List<ProjectsListDTO> projectList = new ArrayList<ProjectsListDTO>();


	private int managerId;
	/**
	 *
	 *
	 *
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 * @author YUICHI KIRIU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result = ERROR;
		ProjectsListDAO dao = new ProjectsListDAO();
		projectList = dao.select();

		if (!(projectList == null)) {
			result = SUCCESS;
		}
		return result;
	}

	/**
	 * 取得メソッド プロジェクトリストを取得
	 * @author  YUICHI KIRIU
	 * @return projectList
	 */
	public List<ProjectsListDTO> getProjectList() {
		return projectList;
	}
	/**
	 * 設定メソッド プロジェクトリストを設定
	 * @author  YUICHI KIRIU
	 * @param projectList
	 */
	public void setProjectList(List<ProjectsListDTO> projectList) {
		this.projectList = projectList;
	}

	/**
	* 取得メソッド
	* @author TATSUYA HOSHI
	* @return
	*/
	public int getManagerId() {
		return managerId;
	}

	/**
	* 設定メソッド
	* @author TATSUYA HOSHI
	* @param
	*/
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

}
