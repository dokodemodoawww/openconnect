package com.internousdev.openconnect.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.dao.LogoutDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * LogoutAction セッションを切断するクラス
 *
 * @author MAIKI OKANO
 * @since 2016/07/22
 * @version 1.0
 */
public class LogoutAction extends ActionSupport implements SessionAware {
    private static final long serialVersionUID = 6220484178360034399L;

    /**
     * セッション
     */
    public Map<String, Object> session;
	/**
	 * ユーザーID
	 */
	private int userId;;
	/**
	 * ログインフラグ
	 */
	private boolean loginFlg;
	/**
	 * ユーザーフラグ
	 */
	private int userFlg;




	/**
	 * ログアウトするための実行メソッド
	 * @return ログアウトできたならSUCCESS、できなければERROR
	 */
	public String execute(){
		String result = ERROR;
		if(session.get("userId") != null){
			LogoutDAO dao = new LogoutDAO();
			dao.update((int)session.get("userId"), false);
			session.clear();
			if(session.isEmpty()){
				result = SUCCESS;
			}
		}
		return result;
	}

	/**
	 * 取得メソッド
	 * userIdを取得
	 * @author Jun kikuchi
	 * @return userId ユーザーＩＤ
	 */
	public Map<String, Object> getSession() {
		return session;
	}


	/**
	 * 格納メソッド
	 * userIdを格納
	 * @author Jun kikuchi
	 * @param userId ユーザーＩＤ
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	/**
	 * 取得メソッド
	 * userIdを取得
	 * @author Jun kikuchi
	 * @return userId ユーザーＩＤ
	 */
	public int getUserId() {
		return userId;
	}


	/**
	 * 格納メソッド
	 * userIdを格納
	 * @author Jun kikuchi
	 * @param userId ユーザーＩＤ
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}


	/**
	 * 取得メソッド
	 * userIdを取得
	 * @author Jun kikuchi
	 * @return userId ユーザーＩＤ
	 */
	public boolean isLoginFlg() {
		return loginFlg;
	}


	/**
	 * 格納メソッド
	 * userIdを格納
	 * @author Jun kikuchi
	 * @param userId ユーザーＩＤ
	 */
	public void setLoginFlg(boolean loginFlg) {
		this.loginFlg = loginFlg;
	}


	/**
	 * 取得メソッド
	 * userIdを取得
	 * @author Hikaru Nakakita
	 * @return userId ユーザーＩＤ
	 */
	public int getUserFlg() {
		return userFlg;
	}


	/**
	 * 格納メソッド
	 * userIdを格納
	 * @author Hikaru Nakakita
	 * @param userId ユーザーＩＤ
	 */
	public void setUserFlg(int userFlg) {
		this.userFlg = userFlg;
	}



}
