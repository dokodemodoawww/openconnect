package com.internousdev.openconnect.books.action;

import java.util.Map;

import com.internousdev.openconnect.books.dao.BooksDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 画面で受け取ったIDを元にしてDBの状態フラグを更新し、表示画面から削除する為のクラス
 * @author TATSUYA HOSHI, SOSHI AZUMA
 */
public class BooksDeleteAction extends ActionSupport {

	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = -1382871800294980617L;
	/**
	 * 管理者権限メソッド
	 */
	public Map<String, Object> session;
	/**
	 * ブックID
	 */
	private int bookId;
	/**
	 * エラーメッセージ
	 */
	private String resultString = "削除に失敗しました！";
	/**
	 * DAOに命令し、結果を返す
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute(){

		String result = ERROR;

		BooksDAO dao = new BooksDAO();

		int count = 0;
		count = dao.delete(bookId);

		if(count > 0){
			result = SUCCESS;
			resultString = "削除に成功しました！";
		}
		return result;
	}

	/**
	* エラーメッセージ取得メソッド
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}

	/**
	* エラーメッセージ設定メソッド
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	/**
	 * ブックID取得メソッド
	 * @return bookId
	 */
	public int getBookId() {
		return bookId;
	}

	/**
	 * ブックID設定メソッド
	 * @param bookId
	 */
	public void setBookId(int bookId) {
		this.bookId = bookId;
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



}
