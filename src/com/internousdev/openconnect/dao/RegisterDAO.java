package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.internousdev.util.DBConnector;

/**
 * 新規登録情報を格納するためのDAO
 *
 * @author YUKI MAEDA
 * @author TATSUHIRO SAITO
 * @since 2016/07/11
 */
public class RegisterDAO {

	/**
	 * 挿入メソッド 指定された情報をDBに接続して挿入するメソッド
	 *
	 * @author YUKI MAEDA
	 * @author TATSUHIRO SAITO
	 * @param userID
	 *            ユーザーID
	 * @param password
	 *            パスワード
	 * @param name
	 *            名前
	 * @param nameF
	 *            名前(ふりがな)
	 * @param email
	 *            メールアドレス
	 *
	 * @return result 挿入に成功したら1以上、失敗したら0
	 */
	public int insert(int userId, String password,  String familyNameKanji, String familyNameKana,
			String givenNameKanji, String givenNameKana, String email,  int year, String month,int user_flg, String userName,String snsId) {
		int result = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

//		String sql = "insert into user(user_id, password, name, name_f, postal, address,"
//				+ "tel_number, email, sex, birthday, register_day, update_day," + "userdel_flg, login_flg, user_flg)"
//				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		String sql = "insert into users(user_id, password, family_name_kanji, given_name_kanji,"
+" family_name_kana, given_name_kana,phone_email,"
+"  year, month,register_day,login_flg,user_flg,user_name,sns_id)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String registerDay = sdf.format(System.currentTimeMillis());


		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, password);
			ps.setString(3, familyNameKanji);
			ps.setString(4, givenNameKanji);
			ps.setString(5, familyNameKana);
			ps.setString(6, givenNameKana);
			ps.setString(7, email);
			ps.setInt(8, year);
			ps.setString(9, month);
			ps.setString(10,registerDay);
			ps.setBoolean(11, false);
			ps.setInt(12, 1);
			ps.setString(13, userName);
			ps.setString(14, snsId);
			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		 }finally {
	            try{
	                con.close();
	            }catch(SQLException e){
	                e.printStackTrace();
	            }
	        }
		return result;
	}

	/**
	 *
	 * 指定されたユーザーメールアドレスが存在するかＤＢに接続して調べるメソッド
	 *@author TATSUHIRO SAITO
	 * @author YUKI MAEDA
	 * @param email
	 *            ユーザーID
	 * @return 存在したらtrue、存在しなければfalse
	 */
	public boolean select(String email) {
		boolean result = false;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();

		String sql = "select * from users where phone_email=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
