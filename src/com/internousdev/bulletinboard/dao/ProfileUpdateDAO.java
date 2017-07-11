/**
 *
 */
package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

/**
 * @author internousdev
 *
 */
public class ProfileUpdateDAO {

	public ArrayList<UserDTO> update(int viewId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		ArrayList<UserDTO> profileList = new ArrayList<UserDTO>();

		String sql ="select * from users left join follow on users.user_id = follow.do where do=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,viewId);
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

				profileList.add(dto);
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
			return profileList;

	}

	public ArrayList<UserDTO> getFollow(int viewId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		ArrayList<UserDTO> profileList = new ArrayList<UserDTO>();

		String sql ="select * from users left join follow on users.user_id = follow.done where do=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,viewId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				UserDTO dto = new UserDTO();

				dto.setUserId(rs.getInt("user_id"));

				dto.setUserName(rs.getString("user_name"));

				dto.setUserIcon(rs.getString("user_icon"));

				dto.setPoint(rs.getInt("point"));

				dto.setLv(rs.getInt("lv"));

				dto.setProfile(rs.getString("profile"));

				profileList.add(dto);



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
			return profileList;

	}


	public ArrayList<UserDTO> getFollower(int viewId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		ArrayList<UserDTO> profileList = new ArrayList<UserDTO>();

		String sql ="select * from users left join follow on users.user_id = follow.do where done=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,viewId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				UserDTO dto = new UserDTO();

				dto.setUserId(rs.getInt("user_id"));

				dto.setUserName(rs.getString("user_name"));

				dto.setUserIcon(rs.getString("user_icon"));

				dto.setPoint(rs.getInt("point"));

				dto.setLv(rs.getInt("lv"));

				dto.setProfile(rs.getString("profile"));

				profileList.add(dto);


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
			return profileList;

	}

	public boolean checkId(int userId, int viewId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		boolean result = false;

		String sql ="select done from follow where do=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,userId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){

				if (rs.getInt("done") == viewId) {

					result = true;
					break;
				}
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
				return result;

		}
}


