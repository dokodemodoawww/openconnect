package com.internousdev.openconnect.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.dao.LoginDAO;
import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * LoginAction アプリ一覧画面に遷移するクラス
 *
 * @author MAIKI OKANO
 * @since 2016/07/22
 * @version 1.1
 */
public class LoginAction extends ActionSupport implements SessionAware {

	/**
	 * シリアルバージョンUID
	 */
	private static final long serialVersionUID = 1422381634250534884L;

	/**
	 * セッションマップ
	 */
	private Map<String, Object> session;
	/**
	 * メールアドレス
	 */
	private String phoneEmail;
	/**
	 * パスワード
	 */
	private String password;

	/**
	 * 結果文字
	 */
	private String resultString = "";

	/**
	 * DAOに入力情報を渡し、結果を返す
	 *
	 * @author MAIKI OKANO
	 * @return result データベースの情報と照合できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result = ERROR;

		LoginDAO dao = new LoginDAO();
	    StudentsDTO dto = new StudentsDTO();
		dto = dao.select(phoneEmail,password);




		if(phoneEmail.equals(dto.getPhoneEmail())){

			if(password.equals(dto.getPassword())){

				if(dto.isLoginFlg() == false){

				if(dao.Update(dto.getPhoneEmail(), dto.getPassword()) > 0){

					dto = dao.select(dto.getPhoneEmail(), dto.getPassword());

			result = SUCCESS;
			resultString = "";
			session.put("userId", dto.getUserId());
			session.put("loginFlg",dto.isLoginFlg());
			session.put("userFlg",dto.getUserFlg());
		}else {
			resultString = "メールアドレスまたはパスワードが正しく入力されていません";
		}


	   }
      }
     }
		return result;
	}

	/**
	 * セッションを取得するためのメソッド
	 *
	 * @author MAIKI OKANO
	 * @return session 取得するセッション
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * セッションを格納するためのメソッド
	 *
	 * @author MAIKI OKANO
	 * @param session 格納するセッション
	 */
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * メールアドレスを取得するためのメソッド
	 *
	 * @author MAIKI OKANO0 0 * @return phoneEmail 取得するメールアドレス
	 */
	public String getPhoneEmail() {
		return phoneEmail;
	}

	/**
	 * メールアドレスを格納するためのメソッド
	 *
	 * @author MAIKI OKANO
	 * @param phoneEmail
	 *            格納するメールアドレス
	 */
	public void setPhoneEmail(String phoneEmail) {
		this.phoneEmail = phoneEmail;
	}

	/**
	 * パスワードを取得するためのメソッド
	 *
	 * @author MAIKI OKANO
	 * @return password 取得するパスワード
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * パスワードを格納するためのメソッド
	 *
	 * @author MAIKI OKANO
	 * @param password
	 *            格納するパスワード
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 取得メソッド 結果文字を取得
	 *
	 * @author YUICHI KIRIU
	 * @return resultString
	 */
	public String getResultString() {
		return resultString;
	}

	/**
	 * 設定メソッド 結果文字を設定
	 *
	 * @author YUICHI KIRIU
	 * @param resultString
	 */
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

}