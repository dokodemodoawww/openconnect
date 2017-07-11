/**
 *
 */
package com.internousdev.bulletinboard.action;

import java.util.ArrayList;

import com.internousdev.bulletinboard.dao.BotSearchDAO;
import com.internousdev.bulletinboard.dto.BotDTO;
import com.internousdev.bulletinboard.util.SentenceCheck;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 文章を閲覧するためのクラス
 * @author Misa Kikluchi
 *
 */
public class BotSearchAction extends ActionSupport{

	/** 文章を規定するもの */
	private String sentences;

	/** 文章ID */
	private int sentenceId;

	/** ラベル */
	private String label;

	/** 学習マスターリスト */
	ArrayList<BotDTO> masterList = new ArrayList<BotDTO>();



	public String execute() {
		String result = ERROR;
		BotSearchDAO dao = new BotSearchDAO();

		//文章を見るをクリックしたときの処理
		if(sentences!=null){
			SentenceCheck check = new SentenceCheck(sentences);
			//値が文章IDのとき
			if(check.isNum()){
				masterList = dao.sentenceSearch(Integer.parseInt(sentences));
				label = dao.labelCheck(Integer.parseInt(sentences));
				result = SUCCESS;

				//値が覚えさせた日のとき
			}else if(check.checkDate()){
				sentenceId = dao.sentenceSearchByAt(sentences);
				masterList = dao.sentenceSearch(sentenceId);
				label = dao.labelCheck(sentenceId);
				result = SUCCESS;

				//値が覚えさせた文章の説明のとき
			}else{
				sentenceId = dao.sentenceSearchByLabel(sentences);
				masterList = dao.sentenceSearch(sentenceId);
				label = dao.labelCheck(sentenceId);
				result = SUCCESS;
			}

		}else{
			//言葉を閲覧するをクリックしたときの処理
			masterList = dao.mastersearch();
		}
		if(masterList.size()!=0){
			result = SUCCESS;
		}
		return result;
	}


	public String getSentences() {
		return sentences;
	}

	public void setSentences(String sentences) {
		this.sentences = sentences;
	}

	public int getSentenceId() {
		return sentenceId;
	}

	public void setSentenceId(int sentenceId) {
		this.sentenceId = sentenceId;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public ArrayList<BotDTO> getMasterList() {
		return masterList;
	}

	public void setMasterList(ArrayList<BotDTO> masterList) {
		this.masterList = masterList;
	}
}
