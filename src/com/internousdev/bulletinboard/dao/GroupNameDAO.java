/**
 *
 */
package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.db.mysql.MySqlConnector;


public class GroupNameDAO {
	public int setGroupName(String groupName, int groupId){
		int updated=0;

		Connection con = new MySqlConnector("openconnect").getConnection();
		String sql="update groups set group_name=? where group_id=?";

		/////////

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, groupName);
			ps.setInt(2, groupId);
			updated=ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return updated;
	}
}

