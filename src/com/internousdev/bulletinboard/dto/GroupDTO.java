/**
 *
 */
package com.internousdev.bulletinboard.dto;

import java.util.Date;

import com.internousdev.bulletinboard.util.SafeDateFormat;

/**
 * グループの情報を格納・取得するクラス
 * @author Takahiro Adachi
 * @since 1.0
 */
public class GroupDTO {
	/** グループID */
	private int groupId;
	/** グループ名 */
	private String groupName;
	/** グループアイコン */
	private String groupIcon;
	/** 最後のメッセージの内容 */
	private String lastMsg;
	/** 最後のメッセージが送信された日時 */
	private Date lastMsgAt;
	/** 最後のメッセージが送信された日付 */
	private String lastMsgDate;
	/** 最後のメッセージが送信された時間 */
	private String lastMsgTime;

	private void culcLastMsgDate() {
		SafeDateFormat.applyPattern("MM/dd(E)");
		if(!(this.lastMsgAt == null)){
			this.lastMsgDate = SafeDateFormat.format(lastMsgAt);
		}
	}
	private void culcLastMsgTime() {
		SafeDateFormat.applyPattern("HH:mm");
		if(!(this.lastMsgAt == null)){
			this.lastMsgTime = SafeDateFormat.format(lastMsgAt);
		}
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
	public String getGroupIcon() {
		return groupIcon;
	}
	public void setGroupIcon(String groupIcon) {
		this.groupIcon = groupIcon;
	}
	public String getLastMsg() {
		return lastMsg;
	}
	public void setLastMsg(String lastMsg) {
		this.lastMsg = lastMsg;
	}
	public Date getLastMsgAt() {
		return lastMsgAt;
	}
	public void setLastMsgAt(Date lastMsgAt) {
		this.lastMsgAt = lastMsgAt;
		culcLastMsgDate();
		culcLastMsgTime();
	}
	/* 日付や時刻をそれ単体で格納する操作は用意していない（不要なはず） */
	public String getLastMsgDate() {
		return lastMsgDate;
	}
	public String getLastMsgTime() {
		return lastMsgTime;
	}
}
