/**
 *
 */
package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */

//viewIdをsessionにputしなおすaction
public class FollowListSessionAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId;

	/**  */
	private int viewId;

	/**  */
	private int talkflg;

	private Map<String,Object> session;


	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}

		session.put("viewId", viewId);

		if(talkflg==1){session.put("talkflg",talkflg);}
		else{session.put("talkflg",0);}


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

	public int getTalkflg() {
		return talkflg;
	}

	public void setTalkflg(int talkflg) {
		this.talkflg = talkflg;
	}


}