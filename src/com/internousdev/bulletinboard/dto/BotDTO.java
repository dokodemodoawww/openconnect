package com.internousdev.bulletinboard.dto;

public class BotDTO {

	/** 文章ID */
	private int sentenceId;
	
	/** 反応する単語 */
	private String word;
	
	/** 反応 */
	private String response;
	
	/** 品詞 */
	private String partOfSpeech;
	
	/** 単語 */
	private String parts;
	
	/** 辞書にあるか */
	private boolean dictionary;
	
	/** 印象 */
	private int impression;
	
	/** どんな文章を覚えさせたかの説明 */
	private String label;
	
	/** 覚えさせた日 */
	private String createdAt;



	public String getPartOfSpeech() {
		return partOfSpeech;
	}

	public void setPartOfSpeech(String partOfSpeech) {
		this.partOfSpeech = partOfSpeech;
	}
	
	public String getWord() {
		return word;
	}
	
	public void setWord(String word) {
		this.word = word;
	}
	
	public String getResponse() {
		return response;
	}
	
	public void setResponse(String response) {
		this.response = response;
	}

	public String getParts() {
		return parts;
	}
	
	public void setParts(String parts) {
		this.parts = parts;
	}
	
	public boolean isDictionary() {
		return dictionary;
	}
	
	public void setDictionary(boolean dictionary) {
		this.dictionary = dictionary;
	}

	public int getImpression() {
		return impression;
	}

	public void setImpression(int impression) {
		this.impression = impression;
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

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

}
