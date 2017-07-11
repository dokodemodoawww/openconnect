package com.internousdev.openconnect.action;

import java.util.Map;

import com.internousdev.openconnect.dao.RegisterDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 入力された新規登録情報をDAOに渡して結果を操作するためのクラス
 *
 * @author YUKI MAEDA
 * @author MASAHIRO KEDSUKA
 * @author TATSUHIRO SAITO
 * @since 2016/10/05
 */
public class RegisterAction extends ActionSupport  {

	/**
	 * シリアルバージョンIDの生成
	 */
	private static final long serialVersionUID = 2395811527732231559L;

	public Map<String, Object> sessionMap;

	/**
	 * ユーザーID
	 */
	private int userId;

	/**
	 * ログインパスワード
	 */
	private String password;

	/**
	 * ログインパスワード確認
	 */
	private String passwordCheck;
	/**
	 * 姓（漢字）
	 */
	private String familyNameKanji;

	/**
	 * 名（漢字）
	 */
	private String givenNameKanji;

	/**
	 * 姓（ふりがな）
	 */
	private String familyNameKana;

	/**
	 * 名（ふりがな）
	 */
	private String givenNameKana;



	/**
	 * メールアドレス
	 */
	private String email;

	/**
	 * 受講年
	 */
	private int year;

	/**
	 * 受講開始月
	 */
	private String month;

	/**
	 * エラーメッセージ
	 */
	private String errorMsg;

	/**
	 * ユーザーフラグ
	 */
	private int user_flg ;
	/**
	 * SNS用ユーザーネーム
	 */
	private String userName;
	
	/** SNS内の処理で使用するID */
	private String snsId;


	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 *
	 * @author YUKI MAEDA
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result = ERROR;
		userName = familyNameKanji + givenNameKanji;
		snsId = userId + ":" + familyNameKanji + givenNameKanji;
		RegisterDAO dao = new RegisterDAO();
		if(!(password.equals(passwordCheck))){
			errorMsg = "パスワードが異なります";
		}else if (dao.select(email)) {
			errorMsg = "入力されたメールアドレスは別のアカウントで使用されています";
		}else if (dao.insert(
				userId, password, familyNameKanji, familyNameKana,
				givenNameKanji, givenNameKana, email, year, month,user_flg,userName,snsId) > 0) {
					result = SUCCESS;

		} else {
			errorMsg = "入力情報に誤りがあります";
		}
		return result;
	}

	/**
	 * ユーザーIDを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return userId 取得するユーザーID
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * ユーザーIDを格納するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @param userId 格納するユーザーID
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * パスワードを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return password 取得するパスワード
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * パスワードを格納するためのメソッド
	 *
	 * @param password 格納するパスワード
	 *
	 * @author YUKI MAEDA
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * パスワード(確認用)を取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return passwordcheck 取得するパスワード(確認用)
	 */
	public String getPasswordCheck() {
		return passwordCheck;
	}

	/**
	 * パスワード(確認用)を格納するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @param passwordcheck 格納するパスワード(確認用)
	 */
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}



	/**
	 * 取得メソッド を取得
	 * @author
	 * @return familyNameKanji
	 */
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param familyNameKanji
	 */
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return givenNameKanji
	 */
	public String getGivenNameKanji() {
		return givenNameKanji;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param givenNameKanji
	 */
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return familyNameKana
	 */
	public String getFamilyNameKana() {
		return familyNameKana;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param familyNameKana
	 */
	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return givenNamekana
	 */
	public String getGivenNameKana() {
		return givenNameKana;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param givenNamekana
	 */
	public void setGivenNameKana(String givenNameKana) {
		this.givenNameKana = givenNameKana;
	}




	/**
	 * 取得メソッド を取得
	 * @author
	 * @return year
	 */
	public int getYear() {
		return year;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param year
	 */
	public void setYear(int year) {
		this.year = year;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return month
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param month
	 */
	public void setMonth(String month) {
		this.month = month;
	}




	/**
	 * メールアドレスを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return email 取得するメールアドレス
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * メールアドレスを格納するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @param email 格納するメールアドレス
	 */
	public void setEmail(String email) {
		this.email = email;
	}


	/**
	 * エラーメッセージを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return errorMsg 取得するエラーメッセージ
	 */
	public String getErrorMsg() {
		return errorMsg;
	}

	/**
	 * エラーメッセージを格納するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @param errorMsg 格納するエラーメッセージ
	 */
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	/**
	 * SNS用ユーザーネームを取得します。
	 * @return SNS用ユーザーネーム
	 */
	public String getUserName() {
	    return userName;
	}

	/**
	 * SNS用ユーザーネームを設定します。
	 * @param userName SNS用ユーザーネーム
	 */
	public void setUserName(String userName) {
	    this.userName = userName;
	}
	
	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

}
