package com.internousdev.bulletinboard.dto;

public class MessageDTO {
	/**
	 * 投稿情報に関するDTOクラス
	 * @author JUN KIKUCHI
	 * @since 2017/05/08
	 * @version 1.0
	 */

	/** 投稿ID */
	private int messageId;
	/** 送信者ID */
	private int senderId;
	/** 送信者名 */
	private String senderName;
	/** 送信者画像 */
	private String senderImg;
	/** 受取人ID */
	private int receiverId;
	/** グループID */
	private int groupId;
	/** グループ名 */
	private String groupName;
	/** 送信内容 */
	private String text;
	/** 添付画像 */
	private String img;
	/** 投稿日時 */
	private String createdAt ;
	/** グループイメージ */
	private String groupIcon;
	private int notRead=0;
	private int readFlg=0;


	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
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
	public String getGroupIcon() {
		return groupIcon;
	}
	public void setGroupIcon(String groupIcon) {
		this.groupIcon = groupIcon;
	}
	public int getNotRead() {
		return notRead;
	}
	public void setNotRead(int notRead) {
		this.notRead = notRead;
	}
	public int getReadFlg() {
		return readFlg;
	}
	public void setReadFlg(int readFlg) {
		this.readFlg = readFlg;
	}
}
