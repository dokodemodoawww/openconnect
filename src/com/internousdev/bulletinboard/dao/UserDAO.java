package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

public class UserDAO {

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


	/**
	 * 通知をインサートする
	 * @param userId
	 * @param msg
	 * @return
	 */
	  public int msgSet(int userId, String msg){
		  int inserted = 0;
		  Connection con = new MySqlConnector("openconnect").getConnection();

		  String sql = "insert into message(user_id,msg) values(?,?)";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setInt(1, userId);
			  ps.setString(2, msg);
			  inserted= ps.executeUpdate();

		  }catch(SQLException e){
		    	e.printStackTrace();
		    }finally {
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
					}
			}
		     return inserted;
		  }

	  /**
	   * 通知を格納する
	   * @param userId
	   * @return
	   */
	  public ArrayList<UserDTO> msgSelect(int userId){
		  ArrayList<UserDTO> msgList = new ArrayList<UserDTO>();
		  Connection con = new MySqlConnector("openconnect").getConnection();

		  String sql = "select * from message where user_id=?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setInt(1, userId);
			  ResultSet rs = ps.executeQuery();
			    while(rs.next()){
			    	UserDTO dto = new UserDTO();
			    		dto.setUserId(userId);
			    		dto.setMsg(rs.getString("msg"));
			    		msgList.add(dto);
			    }

		  }catch(SQLException e){
		    	e.printStackTrace();
		    }finally {
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
					}
			}
		     return msgList;
	  }

	  /**
	   * 通知を削除する
	   * @param userId
	   * @return
	   */
	  public int msgDelete(int userId){
		  int deleted = 0;
		  Connection con = new MySqlConnector("openconnect").getConnection();

		  String sql = "delete from message where user_id=?";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, userId);
				deleted = ps.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			return deleted;
		}


}
