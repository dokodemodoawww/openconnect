/**
 *
 */
package com.internousdev.openconnect.decision.detail.action;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;

import com.internousdev.openconnect.decision.detail.dao.DecisionArchiveDAO;
import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.opensymphony.xwork2.ActionSupport;

public class DecisionArchiveAction extends ActionSupport {

	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = 6045130027645771884L;

	/**
	 * プロジェクト名
	 */
	private String projectName;

	/**
	 * 決済ID
	 */
	private int decisionId;

	/**
	 * 決済種類
	 */
	private String decisionType;

	/**
	 * 決裁手続きの情報をリスト化
	 */
	private ArrayList<DecisionDTO> archiveList = new  ArrayList<DecisionDTO>();

	/**
	 * エラーメッセージ
	 */
	private String resultString = "失敗";


	public String execute() {

		String result=ERROR;
		DecisionArchiveDAO dao = new DecisionArchiveDAO();

		archiveList = dao.archive(decisionId, projectName, decisionType);
		if(archiveList.size() > 0){
			result=SUCCESS;
			resultString="成功";
		}

		return result;
	}




	/**
	* 取得メソッド を取得
	* @return projectName
	*/
	public String getProjectName() {
		return projectName;
	}

	/**
	* 設定メソッド を設定
	* @param projectName
	*/
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	/**
	* 取得メソッド を取得
	* @return decisionId
	*/
	public int getDecisionId() {
		return decisionId;
	}

	/**
	* 設定メソッド を設定
	* @param decisionId
	*/
	public void setDecisionId(int decisionId) {
		this.decisionId = decisionId;
	}


	/**
	* 取得メソッド を取得
	* @return decisionType
	*/
	public String getDecisionType() {
		return decisionType;
	}

	/**
	* 設定メソッド を設定
	* @param decisionType
	*/
	public void setDecisionType(String decisionType) {
		this.decisionType = decisionType;
	}


	/**
	* 取得メソッド を取得
	* @return archiveList
	*/
	public ArrayList<DecisionDTO> getArchiveList() {
		return archiveList;
	}

	/**
	* 設定メソッド を設定
	* @param archiveList
	*/
	public void setArchiveList(ArrayList<DecisionDTO> archiveList) {
		this.archiveList = archiveList;
	}


	/**
	* 取得メソッド を取得
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}


	/**
	* 設定メソッド を設定
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}




	/*
	 * 契約済みのDecisionのdtoリストを得る
	 */
	public List<DecisionDTO> getContractedArchiveList(){
		// dto List for return
		List<DecisionDTO> dtoList = new ArrayList<DecisionDTO>();

		// 条件判定関数。dtoを引数にとり、それが契約済みデータであるかどうか判定する。
		UnaryOperator<String> emptyIfNull = (obj) -> { return ( obj != null ? obj : "" ); };
		Predicate<DecisionDTO> is_contracted = ( dto ) -> {
			String decisionType = emptyIfNull.apply(dto.getDecisionType());
			return decisionType.equals("契約") || decisionType.equals("実施兼契約") ;
			};


		// 所有するすべてのDTOについて、それが条件判定に合致するなら、そのセットをリストとしてリターン
		for ( DecisionDTO dto : this.getArchiveList() ){;
			// 条件判断
			if ( dto != null && is_contracted.test(dto) ){

				dtoList.add(dto);
			}
		}

		return dtoList;
	}

}
