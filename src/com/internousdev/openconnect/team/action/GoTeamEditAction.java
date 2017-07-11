/**
 *
 */
package com.internousdev.openconnect.team.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.team.dao.GoTeamEditDAO;
import com.internousdev.openconnect.team.dto.TeamDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * チーム情報を表示するためのクラス
 * @author Teppei Matsumoto
 *@since 2017/06/14
 *@version 1.0
 */
public class GoTeamEditAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 1181846755045278214L;

	/**
	 * セッション
	 */
	private Map<String,Object> session;

	/**
	 * ユーザーリスト
	 */
	private ArrayList<TeamDTO> teamUserList = new ArrayList<TeamDTO>();

	/**
	 * チームリスト2
	 */
	private ArrayList<TeamDTO> teamList = new ArrayList<TeamDTO>();

	/**
	 * ユーザーID
	 */
	private int userId;

	/**
	 * 漢字姓
	 */
	private String famiryNameKanji;

	/**
	 * 漢字名
	 */
	private String givenNameKanji;

	/**
	 * チーム名
	 */
	private String teamName;

	/**
	 * ユーザーフラグ
	 */
	private int userFlg;

	public String execute(){
		String result = ERROR;

		if(session.get("userId")!=null){
			int userId = (int) session.get("userId");
			GoTeamEditDAO dao = new GoTeamEditDAO();
			GoTeamEditDAO dao2 = new GoTeamEditDAO();
			teamList=dao2.select2();
			teamUserList = dao.select(userId);

			if(teamUserList.size() >0){
				result=SUCCESS;
			}
		}
		return result;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return session
	*/
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param session
	*/
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return teamUserList
	*/
	public ArrayList<TeamDTO> getTeamUserList() {
		return teamUserList;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param teamUserList
	*/
	public void setTeamUserList(ArrayList<TeamDTO> teamUserList) {
		this.teamUserList = teamUserList;
	}
	/**
	 * teamListを取得します。
	 * @return teamList
	 */
	public ArrayList<TeamDTO> getTeamList() {
	    return teamList;
	}

	/**
	 * teamListを設定します。
	 * @param teamList teamList
	 */
	public void setTeamList(ArrayList<TeamDTO> teamList) {
	    this.teamList = teamList;
	}
	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return userId
	*/
	public int getUserId() {
		return userId;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param userId
	*/
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return famiryNameKanji
	*/
	public String getFamiryNameKanji() {
		return famiryNameKanji;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param famiryNameKanji
	*/
	public void setFamiryNameKanji(String famiryNameKanji) {
		this.famiryNameKanji = famiryNameKanji;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return givenNameKanji
	*/
	public String getGivenNameKanji() {
		return givenNameKanji;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param givenNameKanji
	*/
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return teamName
	*/
	public String getTeamName() {
		return teamName;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param teamName
	*/
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	/**
	* 取得メソッド を取得
	* @author TEPPEI MATSUMOTO
	* @return userFlg
	*/
	public int getUserFlg() {
		return userFlg;
	}

	/**
	* 設定メソッド を設定
	* @author TEPPEI MATSUMOTO
	* @param userFlg
	*/
	public void setUserFlg(int userFlg) {
		this.userFlg = userFlg;
	}


}
