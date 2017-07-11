package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.util.db.mysql.MySqlConnector;

public class LvDAO {
	public int Lv_up(int userId){

		Connection con = new MySqlConnector("openconnect").getConnection();
		int inserted= 0;
		int ex=0;

		String sql ="select point from users where user_id=?";
		String sql2 ="update users set Lv = Lv+1,point =point-1000 where user_id = ?";


		try{
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1,userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ex = rs.getInt("point");
			}
			ps.close();
			if(ex>=1000){
				PreparedStatement ps2= con.prepareStatement(sql2);
				ps2.setInt(1,userId);
				inserted=ps2.executeUpdate();

				ps2.close();
			}
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
}