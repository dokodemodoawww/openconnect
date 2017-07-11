/**
 *
 */
package com.internousdev.bulletinboard.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author internousdev
 *
 */
public class SentenceCheck {

	private String sentences;

	public SentenceCheck(String sentences){
		this.sentences = sentences;
	}
	/**
	 * きた値がIDかどうかを識別する
	 * @param number
	 * @return
	 */
	public boolean isNum(){
	    try {
	        Integer.parseInt(sentences);
	        return true;
	    } catch (NumberFormatException e) {
	        return false;
	    }
	}

	/**
	 * きた値が日付かどうかを識別する
	 * @return
	 */
    public boolean checkDate() {
		try {
		    SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		    sdFormat.parse(sentences);
		    return true;
		} catch (ParseException e) {
		    e.printStackTrace();
		    return false;
		}


	}

}
