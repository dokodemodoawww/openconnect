/**
 *
 */
package com.internousdev.openconnect.decision.detail.action;


import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.decision.detail.dao.DecisionDetailApplicationDAO;
import com.internousdev.openconnect.decision.detail.dao.DecisionDetailPermitDAO;
import com.internousdev.openconnect.decision.detail.dto.DecisionDetailDTO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 決裁手続き画面で新規に追加した情報を、DBに追加する為のクラス
 * @author SOSHI AZUMA
 * @since 2017/06/16
 * @version 1.0
 */
public class DecisionDetailPermitAction extends ActionSupport implements SessionAware {


	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = -3834616624579202920L;
	/**
	 * 決裁ID
	 */
	private int decisionId;
	/**
	 * 承認状況
	 */
	private int permitStatus;
	/**
	 * 決裁種類
	 */
	private String decisionType;
	/**
	 * sessionから取得したログイン中ユーザーID
	 */
	private int userId;
	/**
	 * 決裁状況
	 */
	private int decisionStatus;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "承認できませんでした。もしくは承認済みです。";
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;
	/**
	 * ID番号振り分けリスト
	 */
	private List<DecisionDetailDTO> idNumList = new ArrayList<DecisionDetailDTO>();

	private String token;

	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}


	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {

		String result=ERROR;

		DecisionDetailPermitDAO daoPer = new DecisionDetailPermitDAO();
		DecisionDetailApplicationDAO daoApp = new DecisionDetailApplicationDAO();


		//現在日時を取得する
        Calendar c = Calendar.getInstance();
        //フォーマットパターンを指定して表示する
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String num = sdf.format( c.getTime() );

		//決裁番号の生成
		String jDecId = "J-" + num + "-";
		String kDecId = "K-" + num + "-";
		String jkDecId = "JK-" + num + "-";

		//番号末尾を100桁表示に変換
		DecimalFormat dformat = new DecimalFormat("000");

		String idNum = "";
		int count = 0;


		//リーダーの承認(変更時含む)
		if( permitStatus == 0 || permitStatus == 1 ) {
			count = daoPer.updateP(decisionType, permitStatus, userId, decisionId);
		}


		//先生の承認
		if( permitStatus == 2 ) {

			//実施決裁の承認
			if(decisionType.equals("実施")) {

				//変更時の承認
				if(decisionStatus == 4) {
					count = daoPer.updateChangePJ( userId, decisionId );
				}
				else {
					idNum = jDecId;
					idNumList = daoApp.select(decisionType, idNum);

					//本日発行された実施決裁番号がある場合
					if(idNumList.size() > 0) {
						int a = idNumList.size() + 1;
						String b = dformat.format(a);
						jDecId = jDecId + b;
					}
					//本日発行された実施決裁番号がない場合
					else {
						jDecId = jDecId + "001";
					}
					count = daoPer.updatePJ( jDecId, userId, decisionId );
				}
			}


			//契約決裁の承認
			else if(decisionType.equals("契約")) {

				//変更時の承認
				if(decisionStatus == 4) {
					count = daoPer.updateChangePK( userId, decisionId );
				}
				//遡求時の承認
				else if(decisionStatus == 6) {
					count = daoPer.updateRecoursePK( userId, decisionId );
				}
				else {
					idNum = kDecId;
					idNumList = daoApp.select(decisionType, idNum);

					//本日発行された契約決裁番号がある場合
					if(idNumList.size() > 0) {
						int a = idNumList.size() + 1;
						String b = dformat.format(a);
						kDecId = kDecId + b;
					}
					//本日発行された契約決裁番号がない場合
					else {
						kDecId = kDecId + "001";
					}
					count = daoPer.updatePK( kDecId, userId, decisionId );
				}
			}


			//実施兼契約決裁の承認
			else  {

				//変更時の承認
				if(decisionStatus == 4) {
					count = daoPer.updateChangePK( userId, decisionId );
				}
				//遡求時の承認
				else if(decisionStatus == 6) {
					count = daoPer.updateRecoursePK( userId, decisionId );
				}
				else {
					idNum = jkDecId;
					idNumList = daoApp.select(decisionType, idNum);

					//本日発行された実施兼契約決裁番号がある場合
					if(idNumList.size() > 0) {
						int a = idNumList.size() + 1;
						String b = dformat.format(a);
						jkDecId = jkDecId + b;
					}
					//本日発行された実施兼契約決裁番号がない場合
					else {
						jkDecId = jkDecId + "001";
					}
					count = daoPer.updatePJK( jkDecId, userId, decisionId );
				}
			}

		}


		if (count > 0 ) {
			result = SUCCESS;
			resultString = "承認できました! ";
		}

		return result;
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
	* @return permitStatus
	*/
	public int getPermitStatus() {
		return permitStatus;
	}
	/**
	* 設定メソッド を設定
	* @param permitStatusJ
	*/
	public void setPermitStatus(int permitStatus) {
		this.permitStatus = permitStatus;
	}

	public String getDecisionType() {
		return decisionType;
	}

	public void setDecisionType(String decisionType) {
		this.decisionType = decisionType;
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
	* @return decisionStatus
	*/
	public int getDecisionStatus() {
		return decisionStatus;
	}

	/**
	* 設定メソッド を設定
	* @param decisionStatus
	*/
	public void setDecisionStatus(int decisionStatus) {
		this.decisionStatus = decisionStatus;
	}

	/**
	* 取得メソッド 結果を取得
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}

	/**
	* 設定メソッド 結果を設定
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
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

	public List<DecisionDetailDTO> getIdNumList() {
		return idNumList;
	}

	public void setIdNumList(List<DecisionDetailDTO> idNumList) {
		this.idNumList = idNumList;
	}



}
