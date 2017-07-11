package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.FollowListDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class FollowListAction extends ActionSupport implements SessionAware{

	/** セッション */
	private Map<String,Object> session;

	/** ユーザーid */
	private int userId;

	/** ユーザー名 */
	private String userName;

	/** ユーザー画像 */
	private String userIcon;

	/** フォローID */
	private int followId;

	/** フォローするほうのID */
	private int Do;

	/** フォローされるほうのID */
	private int done;

	/** プロフィール情報リスト */
	private ArrayList<UserDTO> myData = new ArrayList<UserDTO>();

	/** フォローリスト */
	private ArrayList<UserDTO> followList = new ArrayList<UserDTO>();

	public String execute(){
		String result =ERROR;

		if(session.containsKey(userId)){
			userId = (int) session.get(userId);
		}
		userId = 1;
	if(userId == 0){
		return result;
	}

	FollowListDAO dao = new FollowListDAO();

	followList = dao.getFollow(userId);

		result = SUCCESS;


	return result;

}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getFollowId() {
		return followId;
	}

	public void setFollowId(int followId) {
		this.followId = followId;
	}

	public int getDo() {
		return Do;
	}

	public void setDo(int Do) {
		this.Do = Do;
	}

	public int getDone() {
		return done;
	}

	public void setDone(int done) {
		this.done = done;
	}

	public ArrayList<UserDTO> getMyData() {
		return myData;
	}
	public void setMyData(ArrayList<UserDTO> myData) {
		this.myData = myData;
	}

	public ArrayList<UserDTO> getFollowList() {
		return followList;
	}


	public void setFollowList(ArrayList<UserDTO> followList) {
		this.followList = followList;
	}
}