/**
 *
 */
package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.GroupMemberDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * グループメンバー確認画面を表示します。フィールドにgroupIdとgroupNameが必要です
 * @author Takahiro Adachi
 * @since 1.0
 */
public class GoGroupMemberAction extends ActionSupport implements SessionAware {
	
	/** ユーザーID */
	private int userId;
	
	/** グループid */
	private int groupId;
	
	/** メンバー一覧 */
	private ArrayList<UserDTO> memberList;	
	
	/** セッション */
	private Map<String,Object> session;		

	@Override
	public String execute() {
		String result = ERROR;
		GroupMemberDAO dao = new GroupMemberDAO();

		groupId = (int)session.get("groupId");
		memberList = dao.select(groupId);
		if(!memberList.isEmpty()){
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
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public ArrayList<UserDTO> getMemberList() {
		return memberList;
	}
	public void setMemberList(ArrayList<UserDTO> memberList) {
		this.memberList = memberList;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
