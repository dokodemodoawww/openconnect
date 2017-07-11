/**
 *
 */
package com.internousdev.openconnect.decision.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.omg.CORBA.portable.UnknownException;

import com.internousdev.openconnect.decision.dao.DecisionDAO;
import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
public class GoDecisionFileEdit extends ActionSupport implements SessionAware{


	/**
	 * 起案者ユーザーID
	 *
	 */
	private int jDrafterId;

	/**
	 * 決裁ID
	 */
	private int decisionId;

	private int type;

	private ArrayList<DecisionDTO> decisionList = new  ArrayList<DecisionDTO>();

	private ArrayList<DecisionDTO> nameList = new ArrayList<DecisionDTO>();

	/**
	 * セッション情報
	 */
	private Map<String,Object> session;


	private String resultString = "	表示できません。";


	public String execute(){
		String result = ERROR;
		DecisionDAO dao = new DecisionDAO();

		try {
		decisionList=dao.select(decisionId,type);
		nameList = dao.selectByIds(jDrafterId);
       } catch (UnknownException e) {
		e.printStackTrace();
       }



		result=SUCCESS;
		resultString ="表示しました。";

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
	* @return nameList
	*/
	public ArrayList<DecisionDTO> getNameList() {
		return nameList;
	}





	/**
	* 設定メソッド を設定
	* @param nameList
	*/
	public void setNameList(ArrayList<DecisionDTO> nameList) {
		this.nameList = nameList;
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
