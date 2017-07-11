package com.internousdev.bulletinboard.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.util.db.mysql.MySqlConnector;



public class FriendSearchDAO {


        //userNameで検索されたusers情報をallListに格納
		public ArrayList<UserDTO> select(String userName) {
			Connection con = new MySqlConnector("openconnect").getConnection();

			String SearchName= "%"+ userName + "%";

			ArrayList<UserDTO> allList = new ArrayList<UserDTO>();

			/*1 自分のフォロワーをselect
			String sql1 ="select done from follow where do =?";
			/*2 自分のフォロワー以外のdoneをselect
			String sql2 ="select distinct done from follow where done not in (?)";
			/*3 ↑で取得したdoneで条件にし、users情報をselect + LIKEでuserName検索
			String sql3 ="select distinct users.*, follow.done from users inner join follow on users.user_id=follow.done where done in (?) && user_name  LIKE ?"; */


			String sql ="select * from users where user_name LIKE ? ";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, SearchName);
				ResultSet rs = ps.executeQuery();
				while (rs.next()){
					UserDTO dto = new UserDTO();
					dto.setUserId(rs.getInt("user_id"));
					dto.setUserName(rs.getString("user_name"));
					dto.setUserIcon(rs.getString("user_icon"));
					dto.setLv(rs.getInt("Lv"));
					allList.add(dto);
				}
			}

			 catch (SQLException e ) {
			   e.printStackTrace() ;
			} finally {
				try{
					con.close();
			}catch(SQLException e){
				e.printStackTrace();

		}
			}
			return allList;

			}


		public ArrayList<UserDTO> check(int userId) {
			Connection con = new MySqlConnector("openconnect").getConnection();

			ArrayList<UserDTO>checkList = new ArrayList<UserDTO>();


			String sql ="select done from follow where do=?";

			try{
				PreparedStatement ps = con.prepareStatement(sql) ;
				ps.setInt(1, userId);
				ResultSet rs = ps.executeQuery();
				while (rs.next()){
					UserDTO dto = new UserDTO();
					dto.setDone(rs.getInt("done"));

					checkList.add(dto);
				}
			}

			 catch (SQLException e ) {
			   e.printStackTrace() ;
			} finally {
				try{
					con.close();
			}catch(SQLException e){
				e.printStackTrace();

		}
			}
			return checkList;

			}

		}
