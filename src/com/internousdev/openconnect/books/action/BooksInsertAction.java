/**
 *
 */
package com.internousdev.openconnect.books.action;


import java.util.Map;

import com.internousdev.openconnect.books.dao.BooksDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 画面で新規に追加したID、タイトルを、DBに追加する為のクラス
 * @author TATSUYA HOSHI, SOHI AZUMA
 */
public class BooksInsertAction extends ActionSupport {

	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;

	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -7586577377473680450L;

	/**
	 * タイトル
	 */
	private String title;

	/**
	 * サブタイトル
	 */
	private String subTitle;

	/**
	 * 著者
	 */
	private String author;

	/**
	 * 出版社
	 */
	private String publisher;

	/**
	 * 出版日
	 */
	private String pubDay;

	/**
	 * イニシャル
	 */
	private String initial;

	/**
	 * メッセージ
	 */
	private String resultString;


	/**
	 * DAOに入力されたデータを渡して、結果を返す
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute(){

		String result = ERROR;
		BooksDAO dao = new BooksDAO();
		int count = 0 ;
		count = dao.insert(title, subTitle, author, publisher, pubDay, initial);

		if (count > 0) {
			result = SUCCESS;
			resultString = "追加に成功しました！";
		}else {
			resultString = "追加に失敗しました！";
		}
		return result;
	}


	/**
	 * タイトル取得メソッド
	 * @return title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * タイトル設定メソッド
	 * @param title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	* サブタイトルを取得するメソッド
	* @return subTitle
	*/
	public String getSubTitle() {
		return subTitle;
	}


	/**
	* サブタイトルを格納するメソッド
	* @param subTitle セットする subTitle
	*/
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}


	/**
	* 取得メソッド を取得
	* @return author
	*/
	public String getAuthor() {
		return author;
	}


	/**
	* 設定メソッド を設定
	* @param author
	*/
	public void setAuthor(String author) {
		this.author = author;
	}


	/**
	* 取得メソッド を取得
	* @return publisher
	*/
	public String getPublisher() {
		return publisher;
	}


	/**
	* 設定メソッド を設定
	* @param publisher
	*/
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	/**
	* 取得メソッド を取得
	* @return pubDay
	*/
	public String getPubDay() {
		return pubDay;
	}

	/**
	* 設定メソッド を設定
	* @param pubDay
	*/
	public void setPubDay(String pubDay) {
		this.pubDay = pubDay;
	}

	/**
	 * エラーメッセージ取得メソッド
	 * @return resultString
	 */
	public String getResultString() {
		return resultString;
	}

	/**
	* を取得するメソッド
	* @return initial
	*/
	public String getInitial() {
		return initial;
	}


	/**
	* を格納するメソッド
	* @param initial セットする initial
	*/
	public void setInitial(String initial) {
		this.initial = initial;
	}


	/**
	 * エラーメッセージ設定メソッド
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	/**
	 * シリアルバージョン取得メソッド
	 * @return serialversion
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
