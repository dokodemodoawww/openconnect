/**
 *
 */
package com.internousdev.openconnect.decision.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.decision.dao.DecisionDAO;
import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author KOTA MIYAZATO
 *
 */
/**
 * @author internousdev
 *
 */
public class DecisionUpdateAction extends ActionSupport implements SessionAware{


	/**
	 * 実施起案者ユーザーID
	 *
	 */
	private int jDrafterId;

	/**
	 * 契約/実施兼契約起案者ユーザーID
	 *
	 */
	private int kDrafterId;

	/**
	 * 決裁ID
	 */
	private int decisionId;
	/**
	 * 案件名
	 *
	 */
	private String decisionName;

	/**
	 * 実施起案番号
	 *
	 */
	private String jImpId;
	/**
	 * 実施決裁番号
	 *
	 */
	private String jDecId;
	/**
	 * 契約起案番号
	 *
	 */
	private String kImpId;
	/**
	 * 契約決裁番号
	 *
	 */
	private String kDecId;
	/**
	 * 実施兼契約起案番号
	 *
	 */
	private String jkImpId;
	/**
	 * 実施兼契約番号
	 *
	 */

	private String jkDecId;


	/**
	 * 理由・目的
	 */
	private String cause;



	/**
	 * 建設費用
	 */
	private float bildCost;

	/**
	 * 損益費用
	 */
	private float benefit;

	/**
	 * 合計金額
	 */
	private float amountAll;

	/**
	 * 概要
	 */
	private String summary;

	/**
	 * 開始日
	 */
	private String startDay;

	/**
	 * 終了日
	 */
	public String endDay;

	/**
	 * 開発端末料
	 */
	private int prove;

	/**
	 * リリース環境使用料
	 */
	private float re;

	/**
	 *回線使用料
	 */
	private int line;


	/**
	 *施設使用料
	 */
	private float room;

	/**
	 *開発要員
	 */
	private int human;

	/**
	 * 人数
	 */
	private int persons;


	/**
	 *雑費
	 */
	private float etc;

	/**
	 *姓（漢字）
	 */
	private String familyNameKanji;

	/**
	 *名（漢字）
	 */
	public String givenNameKanji;


	/*
	 * decisionList コレクションクラスのオブジェクト宣言
	 * @author kota.miyazato
     * @since 2017/06/07
     * @version 1.0
     */

	/**
	 * 決裁手続きの情報をリスト化
	 */
	private ArrayList<DecisionDTO> decisionList = new  ArrayList<DecisionDTO>();

	/**
	 * セッション情報
	 */
	private Map<String,Object> session;



	/**
	 * エラーメッセージ
	 */
	private String resultString = "更新できません。";


	/**
     * 決裁手続きの情報をリストを更新する
     * @author kota.miyazato
     * @since 2017/06/07
     * @version 1.0
     */

	public String execute() {
		String result =ERROR;
         DecisionDAO dao= new DecisionDAO();
         int count=0;


         int totalProve = prove * persons;

         float totalRe = re * (float)persons;

         int totalLine = line * persons;

         float totalRoom = room * 1;

         int totalHuman = human * persons;

         float totalEtc = etc * (float)persons;

         float benefit = totalHuman + totalEtc;

         float bildCost = (float)totalProve + totalRe + totalLine + (float)totalRoom;

         float amountAll = benefit + bildCost;

         count=dao.update(decisionName,summary,cause,startDay,endDay,persons,totalProve,totalRe,totalLine,totalRoom,totalHuman,totalEtc,benefit,bildCost,amountAll,jDrafterId,kDrafterId,decisionId);

			if(count>0){
				result = SUCCESS;
				resultString = "更新しました。";
			}



			return result;
}


	/**
	* 取得メソッド を取得
	* @return jDrafterId
	*/
	public int getJDrafterId() {
		return jDrafterId;
	}


	/**
	* 設定メソッド を設定
	* @param jDrafterId
	*/
	public void setJDrafterId(int jDrafterId) {
		this.jDrafterId = jDrafterId;
	}


	/**
	* 取得メソッド を取得
	* @return kDrafterId
	*/
	public int getkDrafterId() {
		return kDrafterId;
	}


	/**
	* 設定メソッド を設定
	* @param kDrafterId
	*/
	public void setkDrafterId(int kDrafterId) {
		this.kDrafterId = kDrafterId;
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
	* @return decisionName
	*/
	public String getDecisionName() {
		return decisionName;
	}


	/**
	* 設定メソッド を設定
	* @param decisionName
	*/
	public void setDecisionName(String decisionName) {
		this.decisionName = decisionName;
	}


	/**
	* 取得メソッド を取得
	* @return jImpId
	*/
	public String getJImpId() {
		return jImpId;
	}


	/**
	* 設定メソッド を設定
	* @param jImpId
	*/
	public void setJImpId(String jImpId) {
		this.jImpId = jImpId;
	}


	/**
	* 取得メソッド を取得
	* @return jDecId
	*/
	public String getJDecId() {
		return jDecId;
	}


	/**
	* 設定メソッド を設定
	* @param jDecId
	*/
	public void setJDecId(String jDecId) {
		this.jDecId = jDecId;
	}


	/**
	* 取得メソッド を取得
	* @return kImpId
	*/
	public String getKImpId() {
		return kImpId;
	}


	/**
	* 設定メソッド を設定
	* @param kImpId
	*/
	public void setKImpId(String kImpId) {
		this.kImpId = kImpId;
	}


	/**
	* 取得メソッド を取得
	* @return kDecId
	*/
	public String getKDecId() {
		return kDecId;
	}


	/**
	* 設定メソッド を設定
	* @param kDecId
	*/
	public void setKDecId(String kDecId) {
		this.kDecId = kDecId;
	}


	/**
	* 取得メソッド を取得
	* @return jkImpId
	*/
	public String getJkImpId() {
		return jkImpId;
	}


	/**
	* 設定メソッド を設定
	* @param jkImpId
	*/
	public void setJkImpId(String jkImpId) {
		this.jkImpId = jkImpId;
	}


	/**
	* 取得メソッド を取得
	* @return jkDecId
	*/
	public String getJkDecId() {
		return jkDecId;
	}


	/**
	* 設定メソッド を設定
	* @param jkDecId
	*/
	public void setJkDecId(String jkDecId) {
		this.jkDecId = jkDecId;
	}


	/**
	* 取得メソッド を取得
	* @return cause
	*/
	public String getCause() {
		return cause;
	}


	/**
	* 設定メソッド を設定
	* @param cause
	*/
	public void setCause(String cause) {
		this.cause = cause;
	}


	/**
	* 取得メソッド を取得
	* @return bildCost
	*/
	public float getBildCost() {
		return bildCost;
	}


	/**
	* 設定メソッド を設定
	* @param bildCost
	*/
	public void setBildCost(float bildCost) {
		this.bildCost = bildCost;
	}


	/**
	* 取得メソッド を取得
	* @return benefit
	*/
	public float getBenefit() {
		return benefit;
	}


	/**
	* 設定メソッド を設定
	* @param benefit
	*/
	public void setBenefit(float benefit) {
		this.benefit = benefit;
	}


	/**
	* 取得メソッド を取得
	* @return amountAll
	*/
	public float getAmountAll() {
		return amountAll;
	}


	/**
	* 設定メソッド を設定
	* @param amountAll
	*/
	public void setAmountAll(float amountAll) {
		this.amountAll = amountAll;
	}


	/**
	* 取得メソッド を取得
	* @return summary
	*/
	public String getSummary() {
		return summary;
	}


	/**
	* 設定メソッド を設定
	* @param summary
	*/
	public void setSummary(String summary) {
		this.summary = summary;
	}


	/**
	* 取得メソッド を取得
	* @return startDay
	*/
	public String getStartDay() {
		return startDay;
	}


	/**
	* 設定メソッド を設定
	* @param startDay
	*/
	public void setStartDay(String startDay) {
		this.startDay = startDay;
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
	* @return prove
	*/
	public int getProve() {
		return prove;
	}


	/**
	* 設定メソッド を設定
	* @param prove
	*/
	public void setProve(int prove) {
		this.prove = prove;
	}


	/**
	* 取得メソッド を取得
	* @return re
	*/
	public float getRe() {
		return re;
	}


	/**
	* 設定メソッド を設定
	* @param re
	*/
	public void setRe(float re) {
		this.re = re;
	}


	/**
	* 取得メソッド を取得
	* @return line
	*/
	public int getLine() {
		return line;
	}


	/**
	* 設定メソッド を設定
	* @param line
	*/
	public void setLine(int line) {
		this.line = line;
	}


	/**
	* 取得メソッド を取得
	* @return room
	*/
	public float getRoom() {
		return room;
	}


	/**
	* 設定メソッド を設定
	* @param room
	*/
	public void setRoom(float room) {
		this.room = room;
	}


	/**
	* 取得メソッド を取得
	* @return human
	*/
	public int getHuman() {
		return human;
	}


	/**
	* 設定メソッド を設定
	* @param human
	*/
	public void setHuman(int human) {
		this.human = human;
	}


	/**
	* 取得メソッド を取得
	* @return persons
	*/
	public int getPersons() {
		return persons;
	}


	/**
	* 設定メソッド を設定
	* @param persons
	*/
	public void setPersons(int persons) {
		this.persons = persons;
	}


	/**
	* 取得メソッド を取得
	* @return etc
	*/
	public float getEtc() {
		return etc;
	}


	/**
	* 設定メソッド を設定
	* @param etc
	*/
	public void setEtc(float etc) {
		this.etc = etc;
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
	* 取得メソッド を取得
	* @return decisionList
	*/
	public ArrayList<DecisionDTO> getDecisionList() {
		return decisionList;
	}


	/**
	* 設定メソッド を設定
	* @param decisionList
	*/
	public void setDecisionList(ArrayList<DecisionDTO> decisionList) {
		this.decisionList = decisionList;
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






}








