/**
 *
 */
package com.internousdev.openconnect.attendance.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.UnaryOperator;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.attendance.dao.GoAdminAttendanceLeaderDAO;
import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
public class GoAdminAttendanceLeaderAction extends ActionSupport implements SessionAware{



private static final long serialVersionUID = 1181846755041839614L;

/**
 * セッション
 */
private Map<String,Object> session;

/**
 * チームリスト
 */
private ArrayList<AttendanceDTO> atTeamList = new ArrayList<AttendanceDTO>();

/**
 * ユーザID
 */
private int userId;

/**
 * チーム名
 */

private String teamName;


public String execute() {
	String result = ERROR;

	if(session.get("userId") != null){
		int userId = (int) session.get("userId");

		GoAdminAttendanceLeaderDAO dao = new GoAdminAttendanceLeaderDAO();
	atTeamList = dao.select(userId);

	if(atTeamList.size() > 0){
		result=SUCCESS;
	}
	}
return result;
}




/**
* 取得メソッド を取得
* @return session
*/
public Map<String, Object> getSession() {
	return session;
}

/**
* 設定メソッド を設定
* @param session
*/
public void setSession(Map<String, Object> session) {
	this.session = session;
}


/**
* 取得メソッド を取得
* @return atTeamList
*/
public ArrayList<AttendanceDTO> getAtTeamList() {
	return atTeamList;
}




/**
* 設定メソッド を設定
* @param atTeamList
*/
public void setAtTeamList(ArrayList<AttendanceDTO> atTeamList) {
	this.atTeamList = atTeamList;
}




/**
* 取得メソッド を取得
* @return userId
*/
public int getUserId() {
	return userId;
}

/**
* 設定メソッド を設定
* @param userId
*/
public void setUserId(int userId) {
	this.userId = userId;
}

/**
* 取得メソッド を取得
* @return teamName
*/
public String getTeamName() {
	return teamName;
}

/**
* 設定メソッド を設定
* @param teamName
*/
public void setTeamName(String teamName) {
	this.teamName = teamName;
}

public List<String> getAllTeamNames(){
	ArrayList<String> teamNames = new ArrayList<String>();
	for (AttendanceDTO dto: this.getAtTeamList()){
		teamNames.add(dto.getTeamName());
	}
	return teamNames;
}

public String getFormattedAllTeamNames(){
	List<String> teamNameList = this.getAllTeamNames();
	UnaryOperator<String> func = (String s) -> { return "'" +s +"'"; };
	String formatted="";

	for ( String name: teamNameList){
		if (!formatted.equals("")){
			formatted += ",";
		} else {
			formatted = "{";
		}
		formatted += func.apply(name);
	}
	System.out.println(formatted);
	return formatted + "}";
}

}