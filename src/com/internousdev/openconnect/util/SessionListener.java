/**
 *
 */
package com.internousdev.openconnect.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.internousdev.openconnect.dao.LogoutDAO;

/**
 * セッションタイムアウトを監視し、usersテーブルのlogin_flgをfalseに変更するためのリスナークラス
 * @author TEPPEI MATSUMOTO
 * @since 2017/06/15
 * @version 1.0
 */
public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent event) {
	}

	/**
	 * 自動ログアウトメソッド
	 * セ

	 */
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {

		Object obj = event.getSession().getAttribute("userId");
		int userId = 0;

		if(obj != null) {
			userId = (int)obj;
			LogoutDAO dao = new LogoutDAO();
			dao.update(userId, false);
		}
}
}
