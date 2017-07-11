/**
 *
 */
package com.internousdev.openconnect.decision.detail.action;





import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailSelectDAO;
import com.internousdev.openconnect.decision.detail.dto.DecisionDetailDTO;
import com.opensymphony.xwork2.ActionSupport;


/**
 * DBの決裁情報を画面に表示する為のクラス
 * @author TATUHUMI ITOU, SOSHI AZUMA
 * @since 2016/09/04
 * @version 1.0
 */
public class DecisionDetailSelectAction extends ActionSupport {


	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = -7766297666062379491L;
	/**
	 * 自プロジェクト以外の決裁手続きリスト
	 */
	private List<DecisionDetailDTO> decisionDetailList1 = new ArrayList<DecisionDetailDTO>();
	/**
	 * 自プロジェクトの決裁手続きリスト
	 */
	private List<DecisionDetailDTO> decisionDetailList2 = new ArrayList<DecisionDetailDTO>();
	/**
	 * 決裁未手続きリスト
	 */
	private List<DecisionDetailDTO> decisionBeginList = new ArrayList<DecisionDetailDTO>();
	/**
	 * 検索文字
	 */
	private String searchString = "";
	/**
	 * sessionから取得したログイン中ユーザーID
	 */
	private int userId;
	/**
	 * 終了日と今日比較判定用変数
	 */
	private int time;
	/**
	 * 終了日
	 */
	private String endDay;
	/**
	 * 管理者権限メソッド
	 */
	private Map<String, Object> session;
	/**
	 * エラー文字1
	 */
	private String resultSelect1 = "全プロジェクト検索結果を表示しました";
	/**
	 * エラー文字2
	 */
	private String resultSelect2 = "自プロジェクト検索結果を表示しました";


	/**
	 * 実行メソッド DAOから指定した決裁情報を取得する
	 * @return result 決裁情報の取得に成功したらSUCCESS, 失敗したらERROR
	 */
	public String execute() throws Exception {

		String result=ERROR;

		DecisionDetailSelectDAO dao = new DecisionDetailSelectDAO();


		int userId1 = userId;


		decisionDetailList1 = dao.selectAnotherD( searchString, userId, userId1 );
		decisionDetailList2 = dao.selectMyD( userId, userId1);
		decisionBeginList = dao.selectBeginP( userId, userId1 );

		//遡求判定(日付比較)用
		DecisionDetailDTO dto = new DecisionDetailDTO();
		dto = dao.selectCompareDay( userId, userId1);
		endDay = dto.getEndDay();

		if(endDay != null) {
			time = 1;//遡求申請可能
		}
		else {
			time = 0;//不可
		}




		if( decisionDetailList1.size() == 0){
			resultSelect1 = "該当する情報はありません";
		}
		if( decisionDetailList2.size() == 0){
			resultSelect2 = "自プロジェクトはありません";
		}
		result = SUCCESS;

		return result;
	}



	/**
	* 取得メソッド 決裁手続きリストを取得
	* @return decisionDetailList1
	*/
	public List<DecisionDetailDTO> getDecisionDetailList1() {
		return decisionDetailList1;
	}



	/**
	* 設定メソッド 決裁手続きリストを設定
	* @param decisionDetailList1
	*/
	public void setDecisionDetailList1(List<DecisionDetailDTO> decisionDetailList1) {
		this.decisionDetailList1 = decisionDetailList1;
	}

	/**
	* 取得メソッド 決裁手続きリストを取得
	* @return decisionDetailList2
	*/
	public List<DecisionDetailDTO> getDecisionDetailList2() {
		return decisionDetailList2;
	}



	/**
	* 設定メソッド 決裁手続きリストを設定
	* @param decisionDetailList2
	*/
	public void setDecisionDetailList2(List<DecisionDetailDTO> decisionDetailList2) {
		this.decisionDetailList2 = decisionDetailList2;
	}

	/**
	* 取得メソッド を取得
	* @return decisionBeginList
	*/
	public List<DecisionDetailDTO> getDecisionBeginList() {
		return decisionBeginList;
	}



	/**
	* 設定メソッド を設定
	* @param decisionBeginList
	*/
	public void setDecisionBeginList(List<DecisionDetailDTO> decisionBeginList) {
		this.decisionBeginList = decisionBeginList;
	}



	/**
	* 取得メソッド シリアル番号を取得
	* @return serialVersionUID
	*/
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	* 取得メソッド 検索文を取得
	* @return searchString
	*/
	public String getSearchString() {
		return searchString;
	}

	/**
	* 設定メソッド 検索文を設定
	* @param searchString
	*/
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}



	/**
	* 取得メソッド を取得
	* @return userId
	*/
	public int getUserId() {
		return userId;
	}



	/**
	* 設定メソッド を設定
	* @param userId
	*/
	public void setUserId(int userId) {
		this.userId = userId;
	}



	/**
	* 取得メソッド を取得
	* @return time
	*/
	public int getTime() {
		return time;
	}



	/**
	* 設定メソッド を設定
	* @param time
	*/
	public void setTime(int time) {
		this.time = time;
	}



	/**
	* 取得メソッド を取得
	* @return endDay
	*/
	public String getEndDay() {
		return endDay;
	}



	/**
	* 設定メソッド を設定
	* @param endDay
	*/
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}



	/**
	* 取得メソッド を取得
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}



	/**
	* 設定メソッド を設定
	* @param session
	*/
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



	/**
	* 取得メソッド
	* @return resultSelect1
	*/
	public String getResultSelect1() {
		return resultSelect1;
	}



	/**
	* 設定メソッド
	* @param resultSelect1
	*/
	public void setResultSelect1(String resultSelect1) {
		this.resultSelect1 = resultSelect1;
	}

	/**
	* 取得メソッド
	* @return resultSelect1
	*/
	public String getResultSelect2() {
		return resultSelect2;
	}



	/**
	* 設定メソッド
	* @param resultSelect2
	*/
	public void setResultSelect2(String resultSelect2) {
		this.resultSelect2 = resultSelect2;
	}



}
