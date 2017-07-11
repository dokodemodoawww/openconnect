package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;


/**
 * ログアウトに関するクラス
 * @author Hikaru Nakakita
 * @since 2017/06/14
 * @version 1.0
 *
 */
public class LogoutDAO {


	public int update(int userId, boolean loginFlg){
		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();

		String sql = "update users set login_flg=? where user_id=?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setBoolean(1, false);
			ps.setInt(2, userId);
			count = ps.executeUpdate();
			return count;
		}catch(SQLException e){
			e.printStackTrace();
		}
		try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
 		return count;
	}


}
