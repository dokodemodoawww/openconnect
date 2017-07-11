
package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.GroupDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GroupAddAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId=0;

	/** タイムラインのリスト */
	private ArrayList<UserDTO> followList = new ArrayList<UserDTO>();

	/** セッション */
	private Map<String,Object> session;

	/** グループ名 */
	private String groupName;



	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}

		GroupDAO dao = new GroupDAO();

		if(dao.groupmasterAdd(groupName)!=0){
			if(dao.createGroup(userId, groupName)!= 0){

				UserDAO msgDao = new UserDAO();
				msgDao.msgSet(userId, "グループを作成しました");
					result = SUCCESS;
			}else{
				//グループマスター情報はインサートできたけど、グループ情報をインサートできなかったときの処理
				dao.groudmasterDelete(groupName);
			}
		}
	return result;
	}

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Map<String, Object> getSession() {
		return session;
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

	public ArrayList<UserDTO> getFollowList() {
		return followList;
	}

	public void setFollowList(ArrayList<UserDTO> followList) {
		this.followList = followList;
	}


}
