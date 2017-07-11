package com.internousdev.bulletinboard.dto;

public class LikeDTO {


	/**
	 * いいね情報に関するDTOクラス
	 *
	 * @author JUN KIKUCHI
	 * @since 2017/05/08
	 * @version 1.0
	 *
	 */

	/** ユーザーID */
	private int userId;

	/** タイムラインID */
	private int postId;


	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
}
