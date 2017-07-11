package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.LogoutDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * ログアウトするためのクラス
 * @author Miyauchi Akitomo
 *@since 2017/05/18
 *@version 1.0
 */
public class LogoutAction extends ActionSupport implements SessionAware{


	/** シリアルID */
	private static final long serialVersionUID = 8755573724861558565L;
	
	/** セッション情報（ユーザーID） */
	private Map<String, Object> session;

	/** ログインフラグ */
	private boolean loginFlg;
	
	/** ユーザーID */
	private int userId;
	
	/** アクションフラグ */
	private String actionFlg;

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


	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public boolean isLoginFlg() {
		return loginFlg;
	}

	public void setLoginFlg(boolean loginFlg) {
		this.loginFlg = loginFlg;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getActionFlg() {
		return actionFlg;
	}

	public void setActionFlg(String actionFlg) {
		this.actionFlg = actionFlg;
	}


}
