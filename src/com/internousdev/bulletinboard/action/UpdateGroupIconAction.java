package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.ChangeIconDAO;
import com.opensymphony.xwork2.ActionSupport;



public class UpdateGroupIconAction extends ActionSupport implements SessionAware{
	
	/** シリアルID */
	private static final long serialVersionUID = -7129551593360374656L;

	/** ユーザーID */
	private int userId=0;

	/** グループID */
	private int groupId;

	/** 画像URL */
	private String url;

	/** セッション */
	private Map<String,Object> session;

	/** グループ名 */
	private String groupName="（・ω・）" ;



	/** ユーザーのポストリストの生成メソッド */
	
	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}

		if(session.containsKey("groupId")){
			groupId = (int) session.get("groupId");
			groupName=(String) session.get("groupName");
		}



		if(userId==0){return result;}


			ChangeIconDAO set = new ChangeIconDAO();
			if(0<set.setGroupIcon(groupId,url)){
				result=SUCCESS;
			}

		return result;
	}
	
	





	public int getUserId() {
		return userId;
	}

	public int getGroupId() {
		return groupId;
	}

	public String getUrl() {
		return url;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

}
