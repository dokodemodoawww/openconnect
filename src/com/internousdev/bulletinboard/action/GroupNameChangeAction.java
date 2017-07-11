/**
 * 
 */
package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.GroupNameDAO;
import com.opensymphony.xwork2.ActionSupport;

public class GroupNameChangeAction extends ActionSupport implements SessionAware{
	
	/** グループID */
	private int groupId;
	
	/** グループ名 */
	private String groupName="";
	
	/** セッション */
	private Map<String,Object> session;
	
	/** ユーザーのポストリストの生成メソッド */
	
	public String execute() {
		String result = ERROR;
		if (session.containsKey("groupId")) {
			groupId = (int) session.get("groupId");
		} else {
			return result;
		}


		GroupNameDAO set = new GroupNameDAO();
		if(0 < set.setGroupName(groupName, groupId)){
			session.put("groupName", groupName);
			result=SUCCESS;
		}

		return result;
	}

	public int getGroupId(){
		return groupId;
	}
	public void setGroupId(int groupId){
		this.groupId = groupId;
	}
	public String getGroupName(){
		return groupName;
	}
	public void setGroupName(String groupName){
		this.groupName = groupName;
	}
	public Map<String, Object> getSession(){
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}