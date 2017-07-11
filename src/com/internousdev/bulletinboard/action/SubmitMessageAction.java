package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.ChatDAO;
import com.internousdev.bulletinboard.dto.MessageDTO;
import com.internousdev.bulletinboard.util.BotTalk;
import com.opensymphony.xwork2.ActionSupport;



public class SubmitMessageAction extends ActionSupport implements SessionAware{
	/** シリアルID */
	private static final long serialVersionUID = -7129551593360374656L;
	/** ユーザーID */
	private int userId = 0;
	/** 送信者名 */
	private String senderName;
	/** 送信者画像 */
	private String senderImg;
	/** 受取人ID */
	private int receiverId;
	/** 受取人名 */
	private String receiverName;
	/** グループID */
	private int groupId;
	/** グループ名 */
	private String groupName="（・ω・）" ;
	/** 送信内容 */
	private String text="";
	/** 添付画像 */
	private String url="";
	/** 投稿日時 */
	private String createdAt ;
	/** ポストリスト */
	public ArrayList<MessageDTO> chat = new ArrayList<MessageDTO>();
	/** 投稿件数 */
	private int msgCount=0;
	private Map<String,Object> session;

	/**
	 *ユーザーのポストリストの生成メソッド
	 */
	@Override
	public String execute() {
		String result = ERROR;
		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}

		if(session.containsKey("receiverId")){
			receiverId = (int) session.get("receiverId");
			receiverName = session.get("receiverName").toString();
			groupId = (int) session.get("groupId");
			groupName = session.get("groupName").toString();
		}

		if(userId == 0){
			return result;
		}


		//送信内容がある場合に送信内容送信
		if (!text.equals("")){
			ChatDAO chatDAO = new ChatDAO();
			if(chatDAO.insertMessage(userId, receiverId, groupId, text, url) != 0){
				//botと話す場合の処理
				if(receiverId < 0){
					BotTalk bot = new BotTalk(receiverId,userId,text);
					String response = bot.talkContents();
					if(response != null){
						bot.botSet(userId,response);
						result=SUCCESS;
					}
				}else{
					result=SUCCESS;
				}
			}
		//スタンプだった場合にスタンプ送信
		} else if(!url.equals("")) {
			text="スタンプを投稿しました";
			ChatDAO set = new ChatDAO();
			if(set.insertMessage(userId, receiverId, groupId, text, url) != 0){
				if(receiverId < 0){
					BotTalk bot = new BotTalk(receiverId,userId,text);
					String response = bot.talkContents();
					if(response != null){
						bot.botSet(userId,response);
						result=SUCCESS;
					}
				}else{
					result=SUCCESS;
				}
			}

		}else{
			result=SUCCESS;
		}
		return result;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public int getMsgCount() {
		return msgCount;
	}
	public void setMsgCount(int msgCount) {
		this.msgCount = msgCount;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
