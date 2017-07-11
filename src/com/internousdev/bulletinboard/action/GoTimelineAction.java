package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.FooterInfoDAO;
import com.internousdev.bulletinboard.dao.TimelineDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.internousdev.bulletinboard.dto.PostDTO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.bulletinboard.util.PostComparator;
import com.opensymphony.xwork2.ActionSupport;

/**
 * タイムラインを表示するためのクラス
 * @author internousdev
 * @since 2017/06/07
 * @version 1.0
 */
public class GoTimelineAction extends ActionSupport implements SessionAware{
	/** ユーザーID */
	private int userId = 0;
	/** 通知リスト */
	private ArrayList<UserDTO> msgList = new ArrayList<UserDTO>();
	/** 名前 */
	private String userName;
	private int talkInfo=0;
	private int groupInfo=0;
	/** タイムライン */
	private ArrayList<PostDTO> timeline = new ArrayList<PostDTO>();
	/** セッション */
	private Map<String,Object> session;

	public String execute() {
		String result = ERROR;

		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}

		TimelineDAO dao = new TimelineDAO(userId);
		timeline = dao.selectTimeline();
		if(timeline.size() != 0){
			Collections.sort(timeline, new PostComparator());
			//通知を追加
			UserDAO msgDao = new UserDAO();
			msgList = msgDao.msgSelect(userId);
			msgDao.msgDelete(userId);
		}

		FooterInfoDAO infodao = new FooterInfoDAO();
		setGroupInfo(infodao.groupInfoGet(userId));
		setTalkInfo(infodao.talkInfoGet(userId));

		result = SUCCESS;
		return result;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public ArrayList<PostDTO> getTimeline() {
		return timeline;
	}
	public void setTimeline(ArrayList<PostDTO> timeline) {
		this.timeline = timeline;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}