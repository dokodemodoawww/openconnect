package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.bulletinboard.dto.LoginDTO;
import com.internousdev.util.db.mysql.MySqlConnector;






    /**
     * ログインに関するクラス
     * @author Miyauchi Akitomo
     * @since 2017/5/11
     * @version 1.0
     */
public class LoginDAO {

	/**
	 * phone_emailとpasswordによりusersテーブルからユーザー情報を取得するメソッド
	 * @param phone_email メールアドレス
	 * @param password パスワード
	 * @return dto ユーザー情報（phone_email,password,user_id,login_flg,user_flg）
	 * @author Miyauchi Akitomo
     * @since 2017/5/11
     * @version 1.0
	 */
	public LoginDTO select(String phone_email, String password){

		Connection con = new MySqlConnector("openconnect").getConnection();
		LoginDTO dto = new LoginDTO();

		String sql = "select phone_email, password, user_id, login_flg, family_name, given_name, user_flg"
				+" from users where phone_email=? and password=?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, phone_email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				dto.setPhoneEmail(rs.getString("phone_email"));
				dto.setPassword(rs.getString("password"));
				dto.setUserId(rs.getInt("user_id"));
				dto.setLoginFlg(rs.getBoolean("login_flg"));
				dto.setUserFlg(rs.getInt("user_flg"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return dto;
	}



	/**
	 * ログインフラグをtrueに更新するメソッド
	 * @param phoneEmail メールアドレス
	 * @param password パスワード
	 * @return int ログインがtrue＞1, false＞0
	 * @author Miyauchi Akitomo
     * @since 2017/5/11
     * @version 1.0
	 */
	public int update(String phoneEmail, String password){
		int count=0;
		Connection con = new MySqlConnector("openconnect").getConnection();
		String sql = "update users set login_flg = true where phone_email = ? and password = ?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, phoneEmail);
			ps.setString(2, password);
			count = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}

}


