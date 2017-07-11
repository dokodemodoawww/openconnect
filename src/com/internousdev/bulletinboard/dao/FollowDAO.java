/**
 *
 */
package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.db.mysql.MySqlConnector;

/**
 * @author internousdev
 *
 */
public class FollowDAO {
	public boolean follow(int userId, int followId) {
		boolean ret = false;
		Connection con = new MySqlConnector("openconnect").getConnection();
		String sql = "REPLACE INTO follow (do, done) VALUES (?, ?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, followId);
			if(ps.executeUpdate() > 0){
				ret = true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return ret;
	}

	//messagesテーブルに通知を送るメソッド
	public boolean insertString(int userId, int viewId){

		int result=0;
		boolean insertFlag=false;

		Connection con = new MySqlConnector("openconnect").getConnection();

	  String sql = "insert into messages (receiver_id, sender_id, text) values (?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, viewId);
			ps.setInt(2, userId);
			ps.setString(3, "フォローしました");

		    result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			if (result > 0) {
				insertFlag = true;
		}
		return insertFlag;
		}
	}