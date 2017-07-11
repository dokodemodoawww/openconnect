package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * ユーザー情報テーブルを編集するクラス
 *
 * @author MITSUHASHI RYOTA
 * @since 2016/10/04
 * @version 1.0
 */
public class UsersDAO {

	/**
	 * ログアウト時にログインフラグを0に変更するクラス
	 *
	 * @author MITSUHASHI RYOTA
	 * @since 2016/10/04
	 * @version 1.0
	 */
	public void logoutAction(int id) {
		DBConnector dc = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = dc.getConnection();
		String sql = "update users set login_flg=? where user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
