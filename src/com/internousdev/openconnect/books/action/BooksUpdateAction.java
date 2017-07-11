/**
 *
 */
package com.internousdev.openconnect.books.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.internousdev.openconnect.books.dao.BooksDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 画面で受け取った更新情報を、DBへ転送する為のクラス
 * @author TATSUYA HOSHI, KOUHEI NITABARU, SOSHI AZUMA
 */
public class BooksUpdateAction extends ActionSupport {
	/**
	 * 	シリアルID
	 */
	private static final long serialVersionUID = -3541224046836562290L;
	/**
	 * ID 書籍一覧
	 */
	private List<Integer> bookIdList = new ArrayList<Integer>();

	/**
	 * タイトルリスト
	 */
	private List<String> titleList = new ArrayList<String>();

	/**
	 * サブタイトルリスト
	 */
	private List<String> subTitleList = new ArrayList<String>();

	/**
	 * 著者リスト
	 */
	private List<String> authorList = new ArrayList<String>();

	/**
	 * 出版社リスト
	 */
	private List<String> publisherList = new ArrayList<String>();

	/**
	 * 出版社リスト
	 */
	private List<String> pubDayList = new ArrayList<String>();

	/**
	 * 状態フラグリスト
	 */
	private List<String> statusFlgList = new ArrayList<String>();

	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;

	/**
	 * メッセージ
	 */
	private String resultString;


	/**
	 * ユーザー情報を更新できたか否か判定するメソッド
	 * @result ERROR ヴァリデーションによるエラーメッセージ
	 * @return result データベースのuser,passwordを更新できたか否か
	 * @throws SQLException
	 */
	public String execute() throws SQLException{

		String result = ERROR;
		BooksDAO dao = new BooksDAO();
		int count = 0 ;

		for(int i=0; i<bookIdList.size(); ++i){
			count = dao.update(titleList.get(i), subTitleList.get(i), authorList.get(i), publisherList.get(i), pubDayList.get(i), statusFlgList.get(i), bookIdList.get(i));}
		if(count > 0){
			result = SUCCESS ;
			resultString = "編集に成功しました！";
		}
		return result;
	}

	/**
	 * ブックIDリスト取得メソッド
	 * @return bookIdList
	 */
	public List<Integer> getBookIdList() {
		return bookIdList;
	}

	/**
	 * ブックIDリスト設定メソッド
	 * @param bookIdList
	 */
	public void setBookIdList(List<Integer> bookIdList) {
		this.bookIdList = bookIdList;
	}

	/**
	 * タイトルリスト取得メソッド
	 * @return titleList
	 */
	public List<String> getTitleList() {
		return titleList;
	}

	/**
	 * タイトルリスト設定メソッド
	 * @param titleList
	 */
	public void setTitleList(List<String> titleList) {
		this.titleList = titleList;
	}

	/**
	* サブタイトルリストを取得するメソッド
	* @return subTitleList
	*/
	public List<String> getSubTitleList() {
		return subTitleList;
	}

	/**
	* サブタイトルリストを格納するメソッド
	* @param subTitleList セットする subTitleList
	*/
	public void setSubTitleList(List<String> subTitleList) {
		this.subTitleList = subTitleList;
	}

	/**
	* 取得メソッド を取得
	* @return authorList
	*/
	public List<String> getAuthorList() {
		return authorList;
	}

	/**
	* 設定メソッド を設定
	* @param authorList
	*/
	public void setAuthorList(List<String> authorList) {
		this.authorList = authorList;
	}

	/**
	* 取得メソッド を取得
	* @return publisherList
	*/
	public List<String> getPublisherList() {
		return publisherList;
	}

	/**
	* 設定メソッド を設定
	* @param publisherList
	*/
	public void setPublisherList(List<String> publisherList) {
		this.publisherList = publisherList;
	}

	/**
	* 取得メソッド を取得
	* @return statusFlgList
	*/
	public List<String> getStatusFlgList() {
		return statusFlgList;
	}

	/**
	* 設定メソッド を設定
	* @param statusFlgList
	*/
	public void setStatusFlgList(List<String> statusFlgList) {
		this.statusFlgList = statusFlgList;
	}

	/**
	 * シリアルバージョン取得メソッド
	 * @return serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * セッション取得メソッド
	 * @return session
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * セッション設定メソッド
	 * @param session
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * メッセージ取得メソッド
	 * @return resultString
	 */
	public String getResultString() {
		return resultString;
	}

	/**
	 * メッセージ設定メソッド
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	/**
	* 取得メソッド を取得
	* @return publishDayList
	*/
	public List<String> getPubDayList() {
		return pubDayList;
	}

	/**
	* 設定メソッド を設定
	* @param publishDayList
	*/
	public void setPubDayList(List<String> pubDayList) {
		this.pubDayList = pubDayList;
	}



}
