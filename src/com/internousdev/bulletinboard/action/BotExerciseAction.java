package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.BotDAO;
import com.opensymphony.xwork2.ActionSupport;

public class BotExerciseAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId;

	/** 文章 */
	private String sentence;

	/** どんな文章を入れたのかの説明 */
	private String label;

	/** 結果の文章 */
	private String resultSentence;

	/** セッション */
	private Map<String,Object> session;
	

	public String execute() {
		String result = ERROR;

		//ID-1でログインしているかの確認
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId!=-1){
			resultSentence = "文章を教えるにはbotくんのIDでログインする必要があります。";
			return result;
			}

		BotDAO dao = new BotDAO();
		//ラベルが重複してないかの確認
		if(dao.labelCheck(label)){
			//学習マスターテーブルにインサート
			if(dao.masterSet(label)!=0){
				//先程インサートしたマスターの文章IDを探す
				int sentenceId = dao.sentenceIdSearch(label);
				if(sentenceId!=0){
					//学習テーブルにインサート
					if(dao.wordSet(sentence, sentenceId)!=0){
						resultSentence = "おめでとう！botくんがあなたの入力した文章を覚えました！";
						result = SUCCESS;
					}
				}
			}
		}else{
			resultSentence = "その要約はすでに使われてるので使用できません。ごめんね！";
		}

		return result;
	}


	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getResultSentence() {
		return resultSentence;
	}

	public void setResultSentence(String resultSentence) {
		this.resultSentence = resultSentence;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
