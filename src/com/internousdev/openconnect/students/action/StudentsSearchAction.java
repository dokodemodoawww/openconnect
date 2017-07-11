/**
 *
 */
package com.internousdev.openconnect.students.action;

import java.util.ArrayList;

import com.internousdev.openconnect.students.dao.StudentsSearchDAO;
import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.opensymphony.xwork2.ActionSupport;

//
/**
 * 顧客情報を表示するクラス
 *
 * @author Tatsuhiro Saito
 * @since 2017/06/12
 * @version 1.0
 */

public class StudentsSearchAction extends ActionSupport {



	/**
	 * シリアルID
	 */
	private static final long serialVersionUID = -6813758445932005344L;

	/**
	 * 顧客ID
	 */
	private int userId;
	/**
	 * 苗字(漢字）
	 */
	private String familynamekanji;
	/**
	 *苗字(かな)
	 */
	private String familyNameKana;

	/**
	 * 名前(漢字）
	 */
	private String givennamekanji;
	/**
	 *名前(かな)
	 */
	private String givenNameKana;
	/**
	 * 受講年
	 */
	private String year;

	/**
	 * 受講開始月
	 */
	private String month;
	/**
	 * チーム名
	 */
	private String team_name;
	/**
	 * チーム名
	 */
	private String user_name;



	/**
	 * 誕生日
	 */
	private String birthday;

	/**
	 * 電話番号
	 */
	private String phoneNumber;

	/**
	 * メールアドレス
	 */
	private String phoneEmail;

	/**
	 * 郵便番号
	 */
	private String postal;

	/**
	 * 住所
	 */
	private String address;

	/**
	 * パスワード
	 */
	private String password;

	/**
	 * 性別
	 */
	private String sex;

	/**
	 * 登録日
	 */
	private String registerDay;


	/**
	 * 商品リスト
	 */
	public ArrayList<StudentsDTO> studentsList = new ArrayList<StudentsDTO>();


	/**
	 * 実行メソッド
	 * 処理内容と順番
	 * 1：受講開始年月を入力することでusersテーブルへ登録された顧客情報を表示する。
	 */
	public String execute() {

		String result = ERROR;
		StudentsSearchDAO dao = new StudentsSearchDAO();
		studentsList = dao.select(year,month);

		if (studentsList.size() > 0) {

			result = SUCCESS;
		}
		return result;

	}

	//以下アクセサー

	/**
	 * searchListを取得します。
	 * @return searchList
	 */
	public ArrayList<StudentsDTO> getStudentsList() {
		return studentsList;
	}



	/**
	 * searchListを設定します。
	 * @param searchList searchList
	 */
	public void setSearchList(ArrayList<StudentsDTO> studentsList) {
		this.studentsList = studentsList;
	}
	/**
	 * 顧客IDを取得するメソッド
	 * @return　userId　顧客ID
	 */
	public int getUserId() {
		return userId;
	}


	/**
	 * 顧客IDを格納するメソッド
	 * @param userId　セットする　userId
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * 苗字(漢字)を取得するメソッド
	 * @return birthday　誕生日
	 */
	public String getFamilyNameKanji() {
		return familynamekanji;
	}

	/**
	 * 苗字(漢字)を格納するメソッド
	 * @param birthday　セットする birthday
	 */
	public void setFamilyNameKanji(String familynamekanji) {
		this.familynamekanji = familynamekanji;
	}


	/**
	 *苗字(かな)を取得するメソッド
	 * @return birthday　誕生日
	 */
	public String getFamilyNameKana() {
		return familyNameKana;
	}

	/**
	 * 苗字(かな)を格納するメソッド
	 * @param birthday　セットする birthday
	 */
	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}
	/**
	 * 名前(漢字)を取得するメソッド
	 * @return birthday　誕生日
	 */
	public String getGivenNameKanji() {
		return givennamekanji;
	}

	/**
	 * 名前(漢字)を格納するメソッド
	 * @param birthday　セットする birthday
	 */
	public void setGivenNameKanji(String givennamekanji) {
		this.givennamekanji = givennamekanji;
	}


	/**
	 *名前(かな)を取得するメソッド
	 * @return birthday　誕生日
	 */
	public String getgGivenNameKana() {
		return givenNameKana;
	}

	/**
	 * 名前(かな)を格納するメソッド
	 * @param birthday　セットする birthday
	 */
	public void setGivenNameKana(String givenNameKana) {
		this.givenNameKana = givenNameKana;
	}

	/**
	 * 誕生日を取得するメソッド
	 * @return birthday　誕生日
	 */
	public String getBirthday() {
		return birthday;
	}

	/**
	 * 誕生日を格納するメソッド
	 * @param birthday　セットする birthday
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * 取得メソッド を取得
	 * @author
	 * @return year
	 */
	public String getYear() {
		return year;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param year
	 */
	public void setYear(String year) {
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
		 * 電話番号を取得するメソッド
		 * @return phoneNumber　電話番号
		 */
		public String getPhoneNumber() {
			return phoneNumber;
		}

		/**
		 * 電話番号を格納するメソッド
		 * @param phoneNumber　セットする phoneNumber
		 */
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

		/**
		 * メールアドレスを取得するメソッド
		 * @return phoneEmail　メールアドレス
		 */
		public String getPhoneEmail() {
			return phoneEmail;
		}

		/**
		 * メールを格納するメソッド
		 * @param phoneEmail　セットする phoneEmail
		 */
		public void setPhoneEmail(String phoneEmail) {
			this.phoneEmail = phoneEmail;
		}

		/**
		 * 郵便番号を取得するメソッド
		 * @return　postal 郵便番号
		 */
		public String getPostal() {
			return postal;
		}


		/**
		 * 郵便番号を格納するメソッド
		 * @param postal　セットする postal
		 */
		public void setPostal(String postal) {
			this.postal = postal;
		}
		/**
		 * 住所を取得するメソッド
		 * @return　address 住所
		 */
		public String getAddress() {
			return address;
		}

		/**
		 * 住所を格納するメソッド
		 * @param address セットする address
		 */
		public void setAddress(String address) {
			this.address = address;
		}

		/**
		 * パスワードを取得するメソッド
		 * @return　password パスワード
		 */
		public String getPassword() {
			return password;
		}
		/**
		 * パスワードを格納するメソッド
		 * @param password　セットする password
		 */
		public void setPassword(String password) {
			this.password = password;
		}
		/**
		 * 性別を取得するメソッド
		 * @return sex　性別
		 */
		public String getSex() {
			return sex;
		}

		/**
		 * 性別を格納するメソッド
		 * @param sex　セットする sex
		 */
		public void setSex(String sex) {
			this.sex = sex;
		}
		/**
		 * 登録日を取得するメソッド
		 * @return registerDay　登録日
		 */
		public String getRegisterDay() {
			return registerDay;
		}

		/**
		 * 登録日を格納するメソッド
		 * @param registerDay　セットする registerDay
		 */
		public void setRegisterDay(String registerDay) {
			this.registerDay = registerDay;
		}
		/**
		 * チーム名を取得するメソッド
		 * @return registerDay　登録日
		 */
		public String getTeamName() {
			return team_name;
		}

		/**
		 * チーム名を格納するメソッド
		 * @param registerDay　セットする registerDay
		 */
		public void setTeamName(String team_name) {
			this.team_name = team_name;
		}
		/**
		 * チーム名を取得するメソッド
		 * @return registerDay　登録日
		 */
		public String getUserName() {
			return user_name;
		}

		/**
		 * チーム名を格納するメソッド
		 * @param registerDay　セットする registerDay
		 */
		public void setUserName(String user_name) {
			this.user_name = user_name;
		}



}
