package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.util.db.mysql.MySqlConnector;



public class ProfileDAO {


	public ArrayList<UserDTO> select(int userId){
		Connection con = new MySqlConnector("openconnect").getConnection();
		UserDTO dto = new UserDTO();
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();

		String sql = "select * from users where user_id=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,userId);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				dto.setUserId(rs.getInt("user_id"));
				dto.setUserIcon(rs.getString("user_icon"));
				dto.setUserName(rs.getString("user_name"));
				dto.setSnsId(rs.getString("sns_id"));
				dto.setPoint(rs.getInt("point"));
				dto.setLv(rs.getInt("lv"));
				dto.setProfile(rs.getString("profile"));
				userList.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
		try{

			con.close();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
		}return userList;
	}


	public ArrayList<UserDTO> getFollow(int userId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		ArrayList<UserDTO> profileList = new ArrayList<UserDTO>();

		String sql ="select * from users left join follow on users.user_id = follow.done where do=?";

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


	public ArrayList<UserDTO> getFollower(int userId){
		Connection con = new MySqlConnector("openconnect").getConnection();

		ArrayList<UserDTO> profileList = new ArrayList<UserDTO>();

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


	public int profileSend(int user_id,String profile,String user_icon){
		Connection con = new MySqlConnector("openconnect").getConnection();
		int inserted=0;
		int c=1;

	String sql="";
	int k;



		if(profile.equals("") && user_icon.equals("")){
			sql="";
			k=-1;
		}

		if(profile.equals("")){
			sql="update users set user_icon=? where user_id=?";
			k=0;
		}else if(user_icon.equals("")){
			sql="update users set profile=? where user_id=?";
			k=1;
		}else {
			sql="update users set profile=?,user_icon=? where user_id=?";
			k=2;
		}

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			if(k==0){
				ps.setString(c++,user_icon);
				ps.setInt(c, user_id);
			}
			if(k==1){
				ps.setString(c++,profile);
				ps.setInt(c, user_id);
			}
			if(k==2){
			ps.setString(c++,profile);
			ps.setString(c++,user_icon);
			ps.setInt(c, user_id);
			}


			inserted= ps.executeUpdate();
			ps.close();

			}catch(SQLException e){
				e.printStackTrace();

			}finally{
			try{
				con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
			}
			return inserted;

	}

	public int insert(int userId,String userIcon,String profile){
		Connection con = new MySqlConnector("openconnect").getConnection();
		int inserted=0;
		String sql= "insert into img(user_id,user_icon,profile)"
				+ "values(?,?,?)";

		try{
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1,userId);
			ps.setString(2,userIcon);
			ps.setString(3,profile);
			inserted=ps.executeUpdate();


			ps.close();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return inserted;
	}

	/**
	 * ユーザー名からユーザーIDを取得するメソッド
	 * @param snsId
	 * @return
	 */
	public int getViewId(String snsId){
		int viewId = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = " select user_id from users where sns_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, snsId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				viewId = rs.getInt("user_id");
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
		return viewId;
	}

}

