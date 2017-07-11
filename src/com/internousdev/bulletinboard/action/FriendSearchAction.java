package com.internousdev.bulletinboard.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.FriendSearchDAO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.opensymphony.xwork2.ActionSupport;

public class FriendSearchAction extends ActionSupport implements SessionAware{

	/** ユーザーID */
	private int userId;

	/**  */
	private int checkValue;

	/** フォローされる側のID */
	private int done;

	/** ユーザー名 */
	private String userName;

	/** ユーザーアイコン */
	private String userIcon;

	/** LV */
	private int Lv;

	/** グループID */
	private int groupId;

	/** 条件に一致したlist */
	private ArrayList<UserDTO> usersList = new ArrayList<UserDTO>();

	/** 全部検索されたlist */
	private ArrayList<UserDTO> allList = new ArrayList<UserDTO>();

	/** 自分がフォローしているIDのlist */
	private ArrayList<UserDTO> checkList = new ArrayList<UserDTO>();

	/** セッション */
	private Map<String,Object> session;




public String execute() {

	String result = ERROR;
	//boolean checkIdFlag=false;

	if(session.containsKey("userId")){
		userId = (int) session.get("userId");
	}
	if(userId == 0){
		return result;
	}

	//グループからの検索の場合の処理
	if (session.containsKey("groupId")) {
		session.put("groupId", groupId);
	}


	FriendSearchDAO dao = new FriendSearchDAO();
	usersList = dao.select(userName);
	if(groupId != 0){
		return SUCCESS;
	}
	checkList = dao.check(userId);


	//2つのリストを照合
	//UserDTO dto = new UserDTO();


	/*for(UserDTO userId : allList.get(i).getUserId){
		for(UserDTO done : checkList){
			if(userId == done){
				checkIdFlag=false;
			}else{
				usersList.add(dto);
				break;
			}
		}
	}
	*/

	if(usersList.size() != 0) {
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

	public int getLv() {
		return Lv;
	}

	public void setLv(int lv) {
		Lv = lv;
	}

	public ArrayList<UserDTO> getUsersList() {
		return usersList;
	}

	public void setUsersList(ArrayList<UserDTO> usersList) {
		this.usersList = usersList;
	}

	public int getDone() {
		return done;
	}

	public void setDone(int done) {
		this.done = done;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getCheckValue() {
		return checkValue;
	}

	public void setCheckValue(int checkValue) {
		this.checkValue = checkValue;
	}

	public ArrayList<UserDTO> getAllList() {
		return allList;
	}

	public void setAllList(ArrayList<UserDTO> allList) {
		this.allList = allList;
	}

	public ArrayList<UserDTO> getCheckList() {
		return checkList;
	}

	public void setCheckList(ArrayList<UserDTO> checkList) {
		this.checkList = checkList;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}


}