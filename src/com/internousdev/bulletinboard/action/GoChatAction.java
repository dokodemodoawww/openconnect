
package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.ChatDAO;
import com.internousdev.bulletinboard.dao.ChangeIconDAO;
import com.internousdev.bulletinboard.dao.StampDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.internousdev.bulletinboard.dto.MessageDTO;
import com.internousdev.bulletinboard.dto.StampDTO;
import com.internousdev.bulletinboard.dto.StampTypeDTO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoChatAction extends ActionSupport implements SessionAware {
	/// ユーザー一覧またはグループ一覧から
	/// ユーザーID,受取人ID,受け取り人名,または
	/// ユーザーID,グループID,グループ名,を取得する。
	/** シリアルID */
	private static final long serialVersionUID = -7129551593360374656L;
	/** * ユーザーID */
	private int userId = 0;
	/** 受取人ID */
	private int receiverId = 0;
	/** 受取人名 */
	private String receiverName = "(・ω・）";
	/** グループID */
	private int groupId = 0;
	/** グループ名 */
	private String groupName = "（・ω・）";
	/** 送信者名 */
	private String senderName;
	/** 送信者画像 */
	private String senderImg;
	/** 送信内容 */
	private String text = "";
	/** 添付画像 */
	private String img = "";
	/** 投稿日時 */
	private String createdAt;
	/** ポストリスト */
	public ArrayList<MessageDTO> chat = new ArrayList<MessageDTO>();
	/** ポストリスト */
	public ArrayList<StampDTO> groupIconList = new ArrayList<StampDTO>();
	/** スタンプリスト */
	public ArrayList<StampTypeDTO> stList = new ArrayList<StampTypeDTO>();
	/** スタンプ種類 */
	public int count = 0;
	/** 投稿件数 */
	private int msgCount = 0;
	/** 通知リスト */
	public ArrayList<UserDTO> msgList = new ArrayList<UserDTO>();
	private Map<String, Object> session;

	/**
	 * チャット画面遷移時に、送信内容をセッションに追加するメソッド。
	 */
	@Override
	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if (userId == 0) {
			return result;
		}

		System.out.println("userId" + userId);
		System.out.println("receiverId" + receiverId);
		System.out.println("receiverName" + receiverName);
		System.out.println("groupId" + groupId);
		System.out.println("groupName" + groupName);
		if (receiverId == 0 && groupId == 0) {
			receiverId = (int) session.get("receiverId");
			receiverName = session.get("receiverName").toString();
			groupId = (int) session.get("groupId");
			groupName = session.get("groupName").toString();
		} else {
			session.put("receiverId", receiverId);
			session.put("receiverName", receiverName);
			session.put("groupId", groupId);
			session.put("groupName", groupName);
		}

		// 通知の確認
		UserDAO msgDao = new UserDAO();
		msgList = msgDao.msgSelect(userId);
		msgDao.msgDelete(userId);

		// チャット履歴取得
		ChatDAO get = new ChatDAO();
		chat = get.selectChat(userId, receiverId, groupId);

		setMsgCount(chat.size());
		result = SUCCESS;

		ChangeIconDAO ICdao = new ChangeIconDAO();
		groupIconList = ICdao.getGroupIcon();

		ArrayList<StampDTO> stampList = new ArrayList<StampDTO>();
		StampDAO stampdao = new StampDAO();
		stampList = stampdao.stampGet(userId);

		StampIndex stInd = new StampIndex();
		stList = stInd.StampOrder(stampList);
		count = stList.size();
		return result;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderImg() {
		return senderImg;
	}
	public void setSenderImg(String senderImg) {
		this.senderImg = senderImg;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public ArrayList<MessageDTO> getChat() {
		return chat;
	}
	public void setChat(ArrayList<MessageDTO> chat) {
		this.chat = chat;
	}
	public ArrayList<StampDTO> getGroupIconList() {
		return groupIconList;
	}
	public void setGroupIconList(ArrayList<StampDTO> groupIconList) {
		this.groupIconList = groupIconList;
	}
	public ArrayList<StampTypeDTO> getStList() {
		return stList;
	}
	public void setStList(ArrayList<StampTypeDTO> stList) {
		this.stList = stList;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getMsgCount() {
		return msgCount;
	}
	public void setMsgCount(int msgCount) {
		this.msgCount = msgCount;
	}
	public ArrayList<UserDTO> getMsgList() {
		return msgList;
	}
	public void setMsgList(ArrayList<UserDTO> msgList) {
		this.msgList = msgList;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
