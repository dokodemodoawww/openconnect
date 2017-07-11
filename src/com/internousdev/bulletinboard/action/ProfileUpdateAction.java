package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.ChangeIconDAO;
import com.internousdev.bulletinboard.dao.FollowListDAO;
import com.internousdev.bulletinboard.dao.FollowerDAO;
import com.internousdev.bulletinboard.dao.FooterInfoDAO;
import com.internousdev.bulletinboard.dao.ProfileDAO;
import com.internousdev.bulletinboard.dao.ProfileUpdateDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProfileUpdateAction extends ActionSupport implements SessionAware{



	/** セッション */
	private Map<String,Object> session;

	/** ユーザーID */
	private int userId;

	/** ユーザー名 */
	private String userName;

	/** ユーザーアイコン */
	private String userIcon;

	/** フォローする側のアイコン */
	private int Do;

	/** フォローされる側のアイコン */
	private int done;

	/** フォロー番号 */
	private int followNum;

	/** フォロワー番号 */
	private int followerNum;

	/** EXP */
	private int point;

	/** LV */
	private int lv;

	/**  */
	private int viewId;

	/** BIO */
	private String profile;

	/**  */
	private int checkValue;


	private int talkInfo=0;
	private int groupInfo=0;

	/** プロフィールリスト */
	private ArrayList<UserDTO> myData = new ArrayList<UserDTO>();

	/** フォローリスト */
	private ArrayList<UserDTO> followList = new ArrayList<UserDTO>();

	/** フォロワーリスト */
	private ArrayList<UserDTO> followerList = new ArrayList<UserDTO>();

	/** ポストリスト　*/
	public ArrayList<UserDTO> userIconList = new ArrayList<UserDTO>();


	public String execute(){

		String result = ERROR;
		boolean checkIdFlag = false;

		if(session.containsKey("userId")){

			userId = (int) session.get("userId");
			}
		if(session.containsKey("viewId")){
			viewId=(int) session.get("viewId");
		}

			if(userId == 0){
				return result;
			};

			ProfileUpdateDAO pudao = new ProfileUpdateDAO();
			if (pudao.checkId(userId,viewId)) {
			 checkIdFlag = true;
			 checkValue = 1; //すでにフォロー済みの場合
			}else{
			 checkValue = 0;//未フォローの場合
			}

			ProfileDAO dao = new ProfileDAO();
			setMyData(dao.select(viewId));

			FollowListDAO fdao = new FollowListDAO();

			followList = fdao.getFollow(viewId);
			setFollowNum((followList.size()));

			FollowerDAO frdao = new FollowerDAO();

			followerList = frdao.getFollower(viewId);
			setFollowerNum((followerList.size()));


		result=SUCCESS;

		FooterInfoDAO infodao = new FooterInfoDAO();
		setGroupInfo(infodao.groupInfoGet(userId));
		setTalkInfo(infodao.talkInfoGet(userId));

		ChangeIconDAO udao = new ChangeIconDAO();
		userIconList = udao.getUserIcon();

			return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<UserDTO> getfollowList() {
		return followList;
	}

	public void setfollowList(ArrayList<UserDTO> followList) {
		this.followList = followList;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public int getFollowerNum() {
		return followerNum;
	}

	public void setFollowerNum(int followerNum) {
		this.followerNum = followerNum;
	}

	public int getFollowNum() {
		return followNum;
	}

	public void setFollowNum(int followNum) {
		this.followNum = followNum;
	}

	public int getDo() {
		return Do;
	}

	public void setDo(int Do) {
		this.Do = Do;
	}

	public int getDone() {
		return done;
	}

	public void setDone(int done) {
		this.done = done;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public ArrayList<UserDTO> getMyData() {
		return myData;
	}

	public void setMyData(ArrayList<UserDTO> myData) {
		this.myData = myData;
	}

	public ArrayList<UserDTO> getFollowList() {
		return followList;
	}

	public void setFollowList(ArrayList<UserDTO> followList) {
		this.followList = followList;
	}

	public ArrayList<UserDTO> getFollowerList() {
		return followerList;
	}

	public void setFollowerList(ArrayList<UserDTO> followerList) {
		this.followerList = followerList;
	}

	public int getViewId() {
		return viewId;
	}

	public void setViewId(int viewId) {
		this.viewId = viewId;
	}

	public int getCheckValue() {
		return checkValue;
	}

	public void setCheckValue(int checkValue) {
		this.checkValue = checkValue;
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

	public ArrayList<UserDTO> getUserIconList() {
		return userIconList;
	}

	public void setUserIconList(ArrayList<UserDTO> userIconList) {
		this.userIconList = userIconList;
	}

}
