/**
 *
 */
package com.internousdev.openconnect.decision.action;

import java.util.ArrayList;
import java.util.Map;

import org.omg.CORBA.portable.UnknownException;

import com.internousdev.openconnect.decision.dao.DecisionPreviewDAO;
import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Hideyuki Nozawa
 * @since 2017/06/19
 * @version 1.0
 *
 */
public class DecisionPreviewAction extends ActionSupport {

	/**
	 * 決裁ID
	 *
	 */
	private int decisionId;

	/**
	 * 起案者ユーザーID
	 *
	 */
	private int jDrafterId;

	/**
	 * 起案者ユーザーID
	 *
	 */
	private int kDrafterId;

	/**
	 * ユーザーID
	 */
	private int userId;



	/**
	 *姓（漢字）
	 */
	public String familyNameKanji;

	/**
	 *名（漢字）
	 */
	public String givenNameKanji;

	/**
	 *実施承認者ユーザーID1(リーダー)
	 */
	public int jPermiterId1;

	/**
	 *実施承認者ユーザーID2(リーダー)
	 */
	public int jPermiterId2;

	/**
	 *実施承認者ユーザーID3(先生)
	 */
	public int jPermiterId3;

	/**
	 *実施兼契約承認者ユーザーID1(リーダー)
	 */
	public int kPermiterId1;

	/**
	 *実施兼契約承認者ユーザーID2(リーダー)
	 */
	public int kPermiterId2;

	/**
	 *実施兼契約承認者ユーザーID3(先生)
	 */
	public int kPermiterId3;

	/**
	 * 実施/契約/実施兼契約を判断するタイプ。
	 */
	public int type;


	/**
	* 取得メソッド を取得
	* @return type
	*/
	public int getType() {
		return type;
	}




	/**
	* 設定メソッド を設定
	* @param type
	*/
	public void setType(int type) {
		this.type = type;
	}




	/**
	 * 決裁手続きの情報をリスト化
	 */
	private ArrayList<DecisionDTO> decisionPreviewList = new  ArrayList<DecisionDTO>();

	/**
	 * 実施起案者の情報のリスト
	 */
	private ArrayList<DecisionDTO> jNameList = new ArrayList<DecisionDTO>();

	/**
	 * 契約起案者の情報のリスト
	 */
	private ArrayList<DecisionDTO> kNameList = new ArrayList<DecisionDTO>();

	/**
	 * 実施承認者1人目の情報のリスト
	 */
	private ArrayList<DecisionDTO> jPermiter1nameList = new ArrayList<DecisionDTO>();
	/**
	 * 実施承認者2人目の情報のリスト
	 */
	private ArrayList<DecisionDTO> jPermiter2nameList = new ArrayList<DecisionDTO>();
	/**
	 * 実施承認者3人目の情報のリスト
	 */
	private ArrayList<DecisionDTO> jPermiter3nameList = new ArrayList<DecisionDTO>();

	/**
	 * 契約/実施兼契約承認者1人目の情報のリスト
	 */
	private ArrayList<DecisionDTO> kPermiter1nameList = new ArrayList<DecisionDTO>();
	/**
	 * 契約/実施兼契約承認者2人目の情報のリスト
	 */
	private ArrayList<DecisionDTO> kPermiter2nameList = new ArrayList<DecisionDTO>();
	/**
	 * 契約/実施兼契約承認者3人目の情報のリスト
	 */
	private ArrayList<DecisionDTO> kPermiter3nameList = new ArrayList<DecisionDTO>();

	/**
	 * セッション情報
	 */
	private Map<String,Object> session;


	public String execute(){
		String result = ERROR;
		DecisionPreviewDAO dao = new DecisionPreviewDAO();
		try {
			decisionPreviewList=dao.select(decisionId,type);
		} catch (UnknownException e) {
		e.printStackTrace();
		}

		if(decisionPreviewList!=null){

				try {

					// 実施決裁の起案者IDの数字を持ってくる
					jDrafterId = decisionPreviewList.get(0).getJDrafterId();
					jNameList = dao.selectByJDrafterIds(jDrafterId);

					// 契約/実施兼契約決裁の起案者IDの数字を持ってくる
					kDrafterId = decisionPreviewList.get(0).getKDrafterId();
					kNameList = dao.selectByKDrafterIds(kDrafterId);

					// 実施決裁の承認者IDの数字を持ってくる
					jPermiterId1 = decisionPreviewList.get(0).getJPermiterId1();
					jPermiter1nameList = dao.selectByJPermiterId1(jPermiterId1);
					jPermiterId2 = decisionPreviewList.get(0).getJPermiterId2();
					jPermiter2nameList = dao.selectByJPermiterId2(jPermiterId2);
					jPermiterId3 = decisionPreviewList.get(0).getJPermiterId3();
					jPermiter3nameList = dao.selectByJPermiterId3(jPermiterId3);

					// 契約/実施兼契約決裁の承認者IDの数字を持ってくる
					kPermiterId1 = decisionPreviewList.get(0).getKPermiterId1();
					kPermiter1nameList = dao.selectByKPermiterId1(kPermiterId1);
					kPermiterId2 = decisionPreviewList.get(0).getKPermiterId2();
					kPermiter2nameList = dao.selectByKPermiterId2(kPermiterId2);
					kPermiterId3 = decisionPreviewList.get(0).getKPermiterId3();
					kPermiter3nameList = dao.selectByKPermiterId3(kPermiterId3);

				} catch (UnknownException e) {
					e.printStackTrace();
				}
			}

		/**
		if(decisionPreviewList!=null){

			for(int i=0 ; i < decisionPreviewList.size(); i++){
				try {
					jDrafterId = decisionPreviewList.get(i).getJDrafterId();
					nameList = dao.selectByIds(jDrafterId);
					jPermiterId1 = decisionPreviewList.get(i).getJPermiterId1();
					jPermiter1nameList = dao.selectByJPermiterId1(jPermiterId1);
					jPermiterId2 = decisionPreviewList.get(i).getJPermiterId2();
					jPermiter2nameList = dao.selectByJPermiterId2(jPermiterId2);
					jPermiterId3 = decisionPreviewList.get(i).getJPermiterId3();
					jPermiter3nameList = dao.selectByJPermiterId3(jPermiterId3);
				} catch (UnknownException e) {
					e.printStackTrace();
				}
			}
		}
		*/

		result=SUCCESS;
		return result;
		}




	/**
	 * @return decisionId
	 */
	public int getDecisionId() {
		return decisionId;
	}

	/**
	 * @param decisionId セットする userId
	 */
	public void setDecisionId(int decisionId) {
		this.decisionId = decisionId;
	}
	/**
	 * @return userId
	 */
	public int getJDrafterId() {
		return jDrafterId;
	}

	/**
	 * @param userId セットする userId
	 */
	public void setJDrafterId(int jDrafterId) {
		this.jDrafterId = jDrafterId;
	}

	/**
	* 取得メソッド を取得
	* @return KDrafterId
	*/
	public int getKDrafterId() {
		return kDrafterId;
	}




	/**
	* 設定メソッド を設定
	* @param KDrafterId
	*/
	public void setKDrafterId(int kDrafterId) {
		this.kDrafterId = kDrafterId;
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
	 * 承認者1人目の情報のリストを取得します。
	 * @return 承認者1人目の情報のリスト
	 */
	public ArrayList<DecisionDTO> getJPermiter1nameList() {
	    return jPermiter1nameList;
	}


	/**
	 * 承認者1人目の情報のリストを設定します。
	 * @param jPermiter1nameList 承認者1人目の情報のリスト
	 */
	public void setJPermiter1nameList(ArrayList<DecisionDTO> jPermiter1nameList) {
	    this.jPermiter1nameList = jPermiter1nameList;
	}


	/**
	 * 承認者2人目の情報のリストを取得します。
	 * @return 承認者2人目の情報のリスト
	 */
	public ArrayList<DecisionDTO> getJPermiter2nameList() {
	    return jPermiter2nameList;
	}


	/**
	 * 承認者2人目の情報のリストを設定します。
	 * @param jPermiter2nameList 承認者2人目の情報のリスト
	 */
	public void setJPermiter2nameList(ArrayList<DecisionDTO> jPermiter2nameList) {
	    this.jPermiter2nameList = jPermiter2nameList;
	}


	/**
	 * 承認者3人目の情報のリストを取得します。
	 * @return 承認者3人目の情報のリスト
	 */
	public ArrayList<DecisionDTO> getJPermiter3nameList() {
	    return jPermiter3nameList;
	}


	/**
	 * 承認者3人目の情報のリストを設定します。
	 * @param jPermiter3nameList 承認者3人目の情報のリスト
	 */
	public void setJPermiter3nameList(ArrayList<DecisionDTO> jPermiter3nameList) {
	    this.jPermiter3nameList = jPermiter3nameList;
	}


	/**
	* 取得メソッド を取得
	* @return kPermiter1nameList
	*/
	public ArrayList<DecisionDTO> getKPermiter1nameList() {
		return kPermiter1nameList;
	}




	/**
	* 設定メソッド を設定
	* @param kPermiter1nameList
	*/
	public void setKPermiter1nameList(ArrayList<DecisionDTO> kPermiter1nameList) {
		this.kPermiter1nameList = kPermiter1nameList;
	}




	/**
	* 取得メソッド を取得
	* @return kPermiter2nameList
	*/
	public ArrayList<DecisionDTO> getKPermiter2nameList() {
		return kPermiter2nameList;
	}




	/**
	* 設定メソッド を設定
	* @param kPermiter2nameList
	*/
	public void setKPermiter2nameList(ArrayList<DecisionDTO> kPermiter2nameList) {
		this.kPermiter2nameList = kPermiter2nameList;
	}




	/**
	* 取得メソッド を取得
	* @return kPermiter3nameList
	*/
	public ArrayList<DecisionDTO> getKPermiter3nameList() {
		return kPermiter3nameList;
	}




	/**
	* 設定メソッド を設定
	* @param kPermiter3nameList
	*/
	public void setKPermiter3nameList(ArrayList<DecisionDTO> kPermiter3nameList) {
		this.kPermiter3nameList = kPermiter3nameList;
	}




	/**
	 * @return session
	 */
	public Map<String,Object> getSession() {
		return session;
	}

	/**
	 * @param session セットする session
	 */
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

	/**
	 * @return decisionPreviewList
	 */
	public ArrayList<DecisionDTO> getDecisionPreviewList() {
		return decisionPreviewList;
	}

	/**
	 * @param decisionPreviewList セットする decisionPreviewList
	 */
	public void setDecisionPreviewList(ArrayList<DecisionDTO> decisionPreviewList) {
		this.decisionPreviewList = decisionPreviewList;
	}




	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return nameList
	*/
	public ArrayList<DecisionDTO> getJNameList() {
		return jNameList;
	}

	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param nameList
	*/
	public void setJNameList(ArrayList<DecisionDTO> jNameList) {
		this.jNameList = jNameList;
	}

	/**
	* 取得メソッド を取得
	* @return KNameList
	*/
	public ArrayList<DecisionDTO> getKNameList() {
		return kNameList;
	}




	/**
	* 設定メソッド を設定
	* @param KNameList
	*/
	public void setKNameList(ArrayList<DecisionDTO> kNameList) {
		this.kNameList = kNameList;
	}



	/**
	* 取得メソッド を取得
	* @return familyNameKanji
	*/
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}


	/**
	* 設定メソッド を設定
	* @param familyNameKanji
	*/
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}


	/**
	* 取得メソッド を取得
	* @return givenNameKanji
	*/
	public String getGivenNameKanji() {
		return givenNameKanji;
	}


	/**
	* 設定メソッド を設定
	* @param givenNameKanji
	*/
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}

	/**
	 * 承認者ユーザーID1(リーダー)を取得します。
	 * @return 承認者ユーザーID1(リーダー)
	 */
	public int getJPermiterId1() {
	    return jPermiterId1;
	}


	/**
	 * 承認者ユーザーID1(リーダー)を設定します。
	 * @param JPermiterId1 承認者ユーザーID1(リーダー)
	 */
	public void setJPermiterId1(int jPermiterId1) {
	    this.jPermiterId1 = jPermiterId1;
	}


	/**
	 * 承認者ユーザーID2(リーダー)を取得します。
	 * @return 承認者ユーザーID2(リーダー)
	 */
	public int getJPermiterId2() {
	    return jPermiterId2;
	}


	/**
	 * 承認者ユーザーID2(リーダー)を設定します。
	 * @param JPermiterId2 承認者ユーザーID2(リーダー)
	 */
	public void setJPermiterId2(int jPermiterId2) {
	    this.jPermiterId2 = jPermiterId2;
	}


	/**
	 * 承認者ユーザーID3(先生)を取得します。
	 * @return 承認者ユーザーID3(先生)
	 */
	public int getJPermiterId3() {
	    return jPermiterId3;
	}


	/**
	 * 承認者ユーザーID3(先生)を設定します。
	 * @param JPermiterId3 承認者ユーザーID3(先生)
	 */
	public void setJPermiterId3(int jPermiterId3) {
	    this.jPermiterId3 = jPermiterId3;
	}




	/**
	* 取得メソッド を取得
	* @return kPermiterId1
	*/
	public int getKPermiterId1() {
		return kPermiterId1;
	}




	/**
	* 設定メソッド を設定
	* @param kPermiterId1
	*/
	public void setKPermiterId1(int kPermiterId1) {
		this.kPermiterId1 = kPermiterId1;
	}




	/**
	* 取得メソッド を取得
	* @return kPermiterId2
	*/
	public int getKPermiterId2() {
		return kPermiterId2;
	}




	/**
	* 設定メソッド を設定
	* @param kPermiterId2
	*/
	public void setKPermiterId2(int kPermiterId2) {
		this.kPermiterId2 = kPermiterId2;
	}




	/**
	* 取得メソッド を取得
	* @return kPermiterId3
	*/
	public int getKPermiterId3() {
		return kPermiterId3;
	}




	/**
	* 設定メソッド を設定
	* @param kPermiterId3
	*/
	public void setKPermiterId3(int kPermiterId3) {
		this.kPermiterId3 = kPermiterId3;
	}

}
