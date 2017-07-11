package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

public class FollowerDAO {

	public ArrayList<UserDTO> getFollower(int userId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		ArrayList<UserDTO> followerList = new ArrayList<UserDTO>();

		String sql ="select * from users left join follow on users.user_id = follow.do where done=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1,userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				UserDTO dto = new UserDTO();
				dto.setUserId(rs.getInt("user_id"));
				dto.setUserName(rs.getString("user_name"));
				dto.setSnsId(rs.getString("sns_id"));
				dto.setUserIcon(rs.getString("user_icon"));
				dto.setPoint(rs.getInt("point"));
				dto.setLv(rs.getInt("lv"));
				dto.setProfile(rs.getString("profile"));

				followerList.add(dto);
			}

		}catch(SQLException e){
			e.printStackTrace();

		}finally{
			try{
				con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		return followerList;
	}
}
