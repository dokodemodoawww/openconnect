/**
 *
 */
package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.bulletinboard.dto.ColorDTO;
import com.internousdev.util.DBConnector;

/**
 * @author internousdev
 *
 */
public class ColorChangeDAO {

	public ColorDTO getColor(int userId){
		ColorDTO dto=new ColorDTO();
		DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con=db.getConnection();
		String sql = "select h_color,b_color,f_color from users where user_id=?";

		try{
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1,userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
			dto.sethColor(rs.getString("h_color"));
			dto.setbColor(rs.getString("b_color"));
			dto.setfColor(rs.getString("f_color"));
			}
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
		return dto;

	}

		public boolean ColorChange(int userId,String hColor,String bColor,String fColor){
			DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
			Connection con2=db.getConnection();
			String sql2 = "update users set h_color =?,b_color =?,f_color =? where user_id =?";


			int count = 0;

		try{
			PreparedStatement ps = con2.prepareStatement(sql2);
			ps.setString(1, hColor);
			ps.setString(2, bColor);
			ps.setString(3, fColor);
			ps.setInt(4, userId);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con2.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(count > 0){
			return true;
		} else {
			return false;
		}
		}
}