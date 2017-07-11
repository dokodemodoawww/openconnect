/**
 *
 */
package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.ProfileDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */

//viewIdをsessionにputしなおすaction
public class ProfileSessionAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId;

	/**  */
	private int viewId;

	/** ユーザー名 */
	private String userName;

	/** セッション */
	private Map<String,Object> session;


	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}

		if(userName != null){
			ProfileDAO dao = new ProfileDAO();
			viewId = dao.getViewId(userName.substring(1));
		}
		session.put("viewId", viewId);

		result=SUCCESS;
		return result;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getViewId() {
		return viewId;
	}

	public void setViewId(int viewId) {
		this.viewId = viewId;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}