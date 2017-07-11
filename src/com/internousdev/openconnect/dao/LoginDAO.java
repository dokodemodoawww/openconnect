package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.internousdev.util.DBConnector;

/**
 * LoginDAO
 * ユーザーテーブルに接続する為のクラス
 * @author MAIKI OKANO
 * @since 2016/07/25
 * @version 1.0
 */


public class LoginDAO {
	/**
	 * 取得メソッド
	 * DBに格納されているユーザー情報を取得するメソッド
	 * @param phoneEmail メールアドレス
	 * @param password パスワード
	 * @return
	 * @return dto
	 */
	public  StudentsDTO select(String phoneEmail,String password){

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");

		Connection con = db.getConnection();
		StudentsDTO dto = new StudentsDTO();
		String sql ="select * from users where phone_email = ? and password = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);

          ps.setString(1,phoneEmail);
          ps.setString(2,password);
          ResultSet rs = ps.executeQuery();

          if(rs.next()){
				dto.setUserId(rs.getInt("user_id"));
				dto.setPhoneEmail(rs.getString("phone_email"));
				dto.setPassword(rs.getString("password"));
				dto.setLoginFlg(rs.getBoolean("login_flg"));
				dto.setUserFlg(rs.getInt("user_flg"));
          }

		}catch(SQLException e){
			e.printStackTrace();
		}try{
			con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}return dto;
		}


	public int Update(String phoneEmail, String password){
		int count =0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = (Connection)db.getConnection();
		String sql = "update users set login_flg = true where phone_email = ? and password = ?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1,phoneEmail);
			ps.setString(2,password);
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
