package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.TimelineDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.opensymphony.xwork2.ActionSupport;

public class DeletePostAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId;

	/** タイムラインID */
	private int postId;

	/** セッション */
	private Map<String,Object> session;

	public String execute() {
		String result = ERROR;
		TimelineDAO dao = new TimelineDAO(userId);
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}
		dao.deleteLike(postId);
		if(dao.deletePost(postId) != 0){
			UserDAO msgDao = new UserDAO();
			msgDao.msgSet(userId, "ツイートを削除しました");
			result = SUCCESS;
		}
	return result;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
