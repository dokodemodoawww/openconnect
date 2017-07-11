package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.TimelineDAO;
import com.internousdev.bulletinboard.dao.UserDAO;
import com.internousdev.bulletinboard.dto.PostDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SubmitPostAction extends ActionSupport implements SessionAware{
	/** ユーザーID */
	private int userId;
	/** 送信内容 */
	private String text;
	/** 返信先のタイムラインID */
	private int rePostId;
	/** 返信先のsnsId */
	private String reSnsId;
	/** 返信内容 */
	private String reText;
	/** セッション */
	private Map<String,Object> session;
	/** タイムラインのリスト */
	private ArrayList<PostDTO> followerList = new ArrayList<PostDTO>();

	public String execute(){
		String result = ERROR;

		if (session.containsKey("userId")) {
			userId = (int) session.get("userId");
		}
		if(userId==0){return result;}

		TimelineDAO dao = new TimelineDAO(userId);
		PostDTO dto = new PostDTO();
		UserDAO msgDao = new UserDAO();

		//返信の場合は「＠名前 内容」という形に変える
		if(rePostId != 0){
			text = ("@" + reSnsId + " " + reText);
		}

		//同じ情報を連投してた場合の処理
		dto = dao.selectLastPost();
		if(dto.getText() != null){
			if(dto.getText().equals(text)){
				msgDao.msgSet(userId, "同じ内容は連投できません");
				return result;
			}
		}

		//タイムライン投稿情報にインサートする
		if(dao.insertPost(text, rePostId) != 0){

			//ポイントを20加算
			if(dao.pointPlus(userId) != 0){
			//通知をインサート
			msgDao.msgSet(userId, "投稿が完了しました");
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getRePostId() {
		return rePostId;
	}

	public void setRePostId(int rePostId) {
		this.rePostId = rePostId;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<PostDTO> getFollowerList() {
		return followerList;
	}

	public void setFollowerList(ArrayList<PostDTO> followerList) {
		this.followerList = followerList;
	}

	public String getReSnsId() {
		return reSnsId;
	}

	public void setReSnsId(String reSnsId) {
		this.reSnsId = reSnsId;
	}

	public String getReText() {
		return reText;
	}

	public void setReText(String reText) {
		this.reText = reText;
	}

}
