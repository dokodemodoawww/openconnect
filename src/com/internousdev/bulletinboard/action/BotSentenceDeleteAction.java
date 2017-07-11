/**
 *
 */
package com.internousdev.bulletinboard.action;

import com.internousdev.bulletinboard.dao.BotDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
public class BotSentenceDeleteAction extends ActionSupport{

	/** 文章ID */
	public int sentenceId;

	/** 結果の文章 */
	private String resultSentence;

	public String execute() {
		String result = ERROR;

		BotDAO dao = new BotDAO();
		if(dao.sentenceDelete(sentenceId)!=0){
			if(dao.masterDelete(sentenceId)!=0){
				resultSentence = "botくんが選択した文章を綺麗さっぱり忘れました！";
				result = SUCCESS;
			}
		}
		if(resultSentence==null){
			resultSentence = "忘れられなかった！ごめんね！";
		}
		return result;
	}

	public int getSentenceId() {
		return sentenceId;
	}

	public void setSentenceId(int sentenceId) {
		this.sentenceId = sentenceId;
	}

	public String getResultSentence() {
		return resultSentence;
	}

	public void setResultSentence(String resultSentence) {
		this.resultSentence = resultSentence;
	}


}
