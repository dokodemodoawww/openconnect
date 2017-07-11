package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.GroupDAO;
import com.internousdev.bulletinboard.dao.GroupMemberDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GroupMemberAddAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId=0;

	/** セッション */
	private Map<String,Object> session;

	/** グループID */
	private int groupId;

	/** グループ名 */
	private String groupName;
	
	/** メンバーリスト */
	private ArrayList<Integer> addMemberList = new ArrayList<Integer>();

	/** メンバーリスト */
	private ArrayList<UserDTO> memberList = new ArrayList<UserDTO>();


	public String execute() {
		String result = ERROR;
		GroupDAO dao = new GroupDAO();
		UserDAO msgDao = new UserDAO();
		GroupMemberDAO checkDao = new GroupMemberDAO();

		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}

		if(groupId == 0){
			groupId = (int) session.get("groupId");
		}


		//メンバーが既に加入していないか確認
		memberList = checkDao.select(groupId);
		for(int i=0;i<addMemberList.size();i++){
			for(int n=0;n<memberList.size();n++){
				if(addMemberList.get(i)==memberList.get(n).getUserId()){
					msgDao.msgSet(userId, memberList.get(n).getUserName() + "さんはすでに加入しています");
					return result;
				}
			}
		}

		if(dao.memberAdd(groupId, addMemberList) != 0){
			if(dao.memberPost(groupId, addMemberList, userId) != 0){
				result = SUCCESS;
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

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public ArrayList<Integer> getAddMemberList() {
		return addMemberList;
	}

	public void setAddMemberList(ArrayList<Integer> addMemberList) {
		this.addMemberList = addMemberList;
	}

	public ArrayList<UserDTO> getMemberList() {
		return memberList;
	}

	public void setMemberList(ArrayList<UserDTO> memberList) {
		this.memberList = memberList;
	}

}