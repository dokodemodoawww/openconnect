package com.internousdev.openconnect.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.dao.UpdateAppDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 管理者画面にてアプリケーションを追加する
 * @author GENKI ARIMA
 * @author MAIKI OKANO
 * @since 2015/06/15
 * @since 2016/07/20
 * @version 1.1
 */
public class UpdateAppAction extends ActionSupport implements SessionAware {
	/**
	 * シリアルバージョンIDの生成
	 */
	private static final long serialVersionUID = 811223625143510825L;
	/**
     * サイトID
     */
	private int siteId;
	/**
     * サイトの名前
     */
	private String siteName;
	/**
     * サイトURL
     */
	private String siteUrl;
	/**
     * サイトのジャンル
     */
	private String genre;
	/**
     * セッション
     */
	private Map<String, Object> sessionMap;
	/**
     * メッセージ
     */
	public String messageUp;
	/**
     * 戻り値
     */
	private String result = ERROR;

	/**
	 * 入力された値をDBに登録されている商品に反映し、resultを返すメソッド
	 * @author GENKI ARIMA
	 * @author MAIKI OKANO
	 * @since 2015/06/15
	 * @since 2015/07/21
	 * @return result データベースの情報を更新できたらSUCCESS、失敗したらERROR
	 */
	public String execute() throws SQLException {
		String result = ERROR;
		UpdateAppDAO updateAppDao = new UpdateAppDAO();

		if (updateAppDao.update(siteId, siteName, siteUrl, genre) > 0) {
			try {
				messageUp = "変更が完了しました";
				result = SUCCESS;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			messageUp = "正しい値を入力してください";
		}
		return result;
	}

	/**
     * サイトIDを取得する
     * @author MAIKI OKANO
     * @return siteId 取得するサイトID
     */
	public int getSiteId() {
		return siteId;
	}
	/**
     * サイトIDを格納する
     * @author MAIKI OKANO
     * @param siteId 格納するサイトID
     */
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}
	 /**
     * サイトの名前を取得する
     * @author MAIKI OKANO
     * @return siteName 取得するサイトの名前
     */
	public String getSiteName() {
		return siteName;
	}
	/**
     * サイト名を格納する
     * @author MAIKI OKANO
     * @param siteName 格納するサイトの名前
     */
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	/**
     * サイトURLを取得する
     * @author MAIKI OKANO
     * @return siteUrl 取得するサイトのURL
     */
	public String getSiteUrl() {
		return siteUrl;
	}
	/**
     * サイトURLを格納する
     *
     * @author MAIKI OKANO
     * @param siteUrl サイトのURL
     */
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	/**
     * サイトジャンルを取得する
     * @author MAIKI OKANO
     * @return genre 取得するサイトのジャンル
     */
	public String getGenre() {
		return genre;
	}
	/**
     * サイトジャンルを格納する
     * @author MAIKI OKANO
     * @param genre 格納するサイトのジャンル
     */
	public void setGenre(String genre) {
		this.genre = genre;
	}
	/**
     * セッション情報を取得する
     * @author MAIKI OKANO
     * @return sessionMap 取得するセッションマップ
     */
	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}
	/**
     * セッション情報を格納する
     * @author MAIKI OKANO
     * @param sessionMap 格納するセッションマップ
     */
	@Override
	public void setSession(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}
	/**
     * メッセージを取得する
     * @author MAIKI OKANO
     * @return messageUp 取得するメッセージ
     */
	public String getMessageUp() {
		return messageUp;
	}
	/**
     * メッセージを格納する
     * @author MAIKI OKANO
     * @return messageUp 格納するメッセージ
     */
	public void setMessageUp(String messageUp) {
		this.messageUp = messageUp;
	}
	/**
	 * 結果を取得する
	 *  @author TAMAMI KAKISHITA
	 * */
	public String getResult() {
		return result;
	}
	/**
	 * 結果を格納する
	 *  @author TAMAMI KAKISHITA
	 * */
	public void setResult(String result) {
		this.result = result;
	}
}