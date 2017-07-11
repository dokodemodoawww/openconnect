/**
 *
 */
package com.internousdev.openconnect.project.status.action;

import java.util.ArrayList;

import com.internousdev.openconnect.project.status.dao.ProjectStatusSelectDAO;
import com.internousdev.openconnect.project.status.dto.ProjectStatusDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBからリリース状況を取得し表示する為のクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectStatusSelectAction extends ActionSupport{

	/**
	 * シリアル番号
	 */
	private static final long serialVersionUID = 671961516965709160L;
	/**
	 * 検索文字
	 */
	private String searchString = "";
	/**
	 * リリース状況リスト
	 */
	private ArrayList<ProjectStatusDTO> projectStatusList = new ArrayList<ProjectStatusDTO>();
	/**
	 * 結果文字
	 */
	private String resultSelect = "該当する情報はありません。";

	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 * @author KOHEI NITABARU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute(){
		String result = ERROR;
		ProjectStatusSelectDAO dao = new ProjectStatusSelectDAO();

		projectStatusList = dao.select(searchString);

		if( projectStatusList.size() != 0 ){

			result = SUCCESS;

			if(searchString.equals("")){
				resultSelect ="すべてを表示しました。";
			} else {
				resultSelect = (getText("｢"+searchString + "｣ を検索しました。"));
			}
		}

		return result;
}

	/**
	* 取得メソッド 検索文字を取得
	* @author KOHEI NITABARU
	* @return searchString
	*/
	public String getSearchString() {
		return searchString;
	}

	/**
	* 設定メソッド 検索文字を設定
	* @author KOHEI NITABARU
	* @param searchString
	*/
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	/**
	* 取得メソッド プロジェクトリリース状況リストを取得
	* @author KOHEI NITABARU
	* @return projectStatusList
	*/
	public ArrayList<ProjectStatusDTO> getProjectStatusList() {
		return projectStatusList;
	}

	/**
	* 設定メソッド プロジェクトリリース状況リストを設定
	* @author KOHEI NITABARU
	* @param projectStatusList
	*/
	public void setProjectStatusList(ArrayList<ProjectStatusDTO> projectStatusList) {
		this.projectStatusList = projectStatusList;
	}

	/**
	* 取得メソッド 結果文字を取得
	* @author KOHEI NITABARU
	* @return resultString
	*/
	public String getResultSelect() {
		return resultSelect;
	}

	/**
	* 設定メソッド 結果文字を設定
	* @author KOHEI NITABARU
	* @param resultString
	*/
	public void setResultSelect(String resultString) {
		this.resultSelect = resultString;
	}

	/**
	* 取得メソッド シリアル番号を取得
	* @author KOHEI NITABARU
	* @return serialVersionUID
	*/
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
