package com.internousdev.bulletinboard.dto;

public class PostDTO {

	/** タイムラインID */
	private int postId;
	/** 送信者ID */
	private int senderId;
	/** 名前 */
	private String userName;
	/** 名前 */
	private String snsId;
	/** 写真 */
	private String userIcon;
	/** 送信内容 */
	private  String text;
//	/** 添付画像 */
//	private String img;
	/** 送信日時 */
	private String createdAt;
	/** いいね数 */
	private int likeCount;
	/** いいねされたか */
	private boolean isLiked;
	/** 返信先のタイムラインID */
	private int rePostId;
	/** 返信先のユーザーID */
	private int reUserId;
	/** 返信先のユーザー名 */
	private String reUserName;
	/** 返信先のSNS用ID */
	private String reSnsId;
	/** 返信先の画像 */
	private String reUserIcon;
	/** 返信先の投稿内容 */
	private String reText;
	/** 返信先の投稿日時 */
	private String reCreatedAt;



	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
//	public String getImg() {
//		return img;
//	}
//	public void setImg(String img) {
//		this.img = img;
//	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public boolean getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(boolean isLiked) {
		this.isLiked = isLiked;
	}
	public int getRePostId() {
		return rePostId;
	}
	public void setRePostId(int rePostId) {
		this.rePostId = rePostId;
	}
	public int getReUserId() {
		return reUserId;
	}
	public void setReUserId(int reUserId) {
		this.reUserId = reUserId;
	}
	public String getReUserName() {
		return reUserName;
	}
	public void setReUserName(String reUserName) {
		this.reUserName = reUserName;
	}
	public String getReSnsId() {
		return reSnsId;
	}
	public void setReSnsId(String reSnsId) {
		this.reSnsId = reSnsId;
	}
	public String getReUserIcon() {
		return reUserIcon;
	}
	public void setReUserIcon(String reUserIcon) {
		this.reUserIcon = reUserIcon;
	}
	public String getReText() {
		return reText;
	}
	public void setReText(String reText) {
		this.reText = reText;
	}
	public String getReCreatedAt() {
		return reCreatedAt;
	}
	public void setReCreatedAt(String reCreatedAt) {
		this.reCreatedAt = reCreatedAt;
	}
}
