package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.ProfileDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SendProfileAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId=0;

	/** アイコン画像 */
	private String userIcon="";

	/** ユーザー名 */
	private String userName;

	/** BIO */
	private String profile="";

	/** デリートフラグ */
	private int deleteFlg=1;

	/** セッション */
	private Map<String,Object> session;

	private ArrayList<UserDTO> profileData = new ArrayList<UserDTO>();

	private ArrayList<UserDTO> profileList = new ArrayList<UserDTO>();


	public String execute(){
		String result = ERROR;
		ProfileDAO dao=new ProfileDAO();
		if(session.containsKey("userId")){
			userId = (int) session.get("userId");
			}

		if(userId==0){
			return result;
		}
			int updated=dao.profileSend(userId,profile,userIcon);

				if(updated>0){
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

	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(int deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<UserDTO> getProfileData() {
		return profileData;
	}

	public void setProfileData(ArrayList<UserDTO> profileData) {
		this.profileData = profileData;
	}

	public ArrayList<UserDTO> getProfileList() {
		return profileList;
	}

	public void setProfileList(ArrayList<UserDTO> profileList) {
		this.profileList = profileList;
	}

}
