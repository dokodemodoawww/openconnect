package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.db.mysql.MySqlConnector;

public class BtnDAO {
	public int pointPlus(int senderId,int postId){

		LvDAO Lv =new LvDAO();

		Connection con = new MySqlConnector("openconnect").getConnection();
		int inserted=0;
		int inserted2=0;

		String sql = "update users set point = point+100 where user_id = ?";
		String sql2 ="update posts set like_count = like_count+1 where post_id = ?";

		try{
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1,senderId);
			inserted = ps.executeUpdate();

			PreparedStatement ps2= con.prepareStatement(sql2);
			ps2.setInt(1,postId);
			inserted2 = ps2.executeUpdate();

			ps2.close();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		//経験値が1000以上だった場合にレベルUP
		Lv.Lv_up(senderId);
		return inserted;

	}


}