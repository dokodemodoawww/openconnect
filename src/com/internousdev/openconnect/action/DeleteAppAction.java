package com.internousdev.openconnect.action;

import java.sql.SQLException;

import com.internousdev.openconnect.dao.AppDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 管理者画面にてアプリケーションを削除する
 * @author MAIKI OKANO
 * @since 2016/07/20
 * @version 1.0
 */
public class DeleteAppAction extends ActionSupport {
	/**
	 * シリアルバージョンIDの生成
	 */
	private static final long serialVersionUID = 5892990975591315738L;
	/**
     * サイトID
     */
	private int siteId;
	/**
     * メッセージ
     */
	public String messageDel = null;

	/**
     * DAOにサイト情報を渡して結果を返す
     *
     * @author MAIKI OKANO
     * @return result データベースの情報を削除できたらSUCCESS、失敗したらERROR
     */
	public String execute() throws SQLException {
		String result = ERROR;
		AppDAO dao = new AppDAO();
		int count =0;
		count = dao.delete(siteId);

		if (count > 0) {
			messageDel = "削除が完了しました";
			result = SUCCESS;
		} else {
			messageDel = "入力された値が正しくありません";
		}
		return result;
	}

	 /**
     * 取得メソッド サイトIDを取得
     *
     * @author MAIKI OKANO
     * @return siteId 取得するサイトID
     */
	public int getSiteId() {
		return siteId;
	}

	/**
     * 格納メソッド サイトIDを格納
     *
     * @author MAIKI OKANO
     * @param siteId 格納するサイトID
     */
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}
	/**
     * 取得メソッド メッセージを取得
     *
     * @author MAIKI OKANO
     * @return messageDel 取得するメッセージ
     */
	public String getMessageDel() {
		return messageDel;
	}

	/**
     * 格納メソッド メッセージを格納
     *
     * @author MAIKI OKANO
     * @param messageDel 格納するメッセージ
     */
	public void setMessageDel(String messageDel) {
		this.messageDel = messageDel;
	}
}