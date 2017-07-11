package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.FooterInfoDAO;
import com.internousdev.bulletinboard.dao.GroupDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.internousdev.bulletinboard.dto.MessageDTO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.bulletinboard.util.GroupComparator;
import com.opensymphony.xwork2.ActionSupport;

public class GoGroupAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId=0;
	/** グループリスト */
	public ArrayList<MessageDTO> groupList = new ArrayList<MessageDTO>();
	/** 通知リスト */
	private ArrayList<UserDTO> msgList = new ArrayList<UserDTO>();

	private int talkInfo=0;
	private int groupInfo=0;

	/** セッション */
	private Map<String,Object> session;

	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}
	
		//通知の確認
		UserDAO msgDao = new UserDAO();
		msgList = msgDao.msgSelect(userId);
		msgDao.msgDelete(userId);
	
	
		GroupDAO dao = new GroupDAO();
		groupList = dao.groupGet(userId);
		if(groupList != null){
			Collections.sort(groupList, new GroupComparator());
			result = SUCCESS;
		}
	
		FooterInfoDAO infodao = new FooterInfoDAO();
		setGroupInfo(infodao.groupInfoGet(userId));
		setTalkInfo(infodao.talkInfoGet(userId));
	
		return result;
	}

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public ArrayList<MessageDTO> getGroupList() {
		return groupList;
	}

	public void setGroupList(ArrayList<MessageDTO> groupList) {
		this.groupList = groupList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<UserDTO> getMsgList() {
		return msgList;
	}

	public void setMsgList(ArrayList<UserDTO> msgList) {
		this.msgList = msgList;
	}

	public int getTalkInfo() {
		return talkInfo;
	}

	public void setTalkInfo(int talkInfo) {
		this.talkInfo = talkInfo;
	}

	public int getGroupInfo() {
		return groupInfo;
	}

	public void setGroupInfo(int groupInfo) {
		this.groupInfo = groupInfo;
	}
}
