package com.internousdev.openconnect.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

public class ScheduleMemoDeleteDAO {

	public boolean delete(int id){

		DBConnector db=new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con= (Connection) db.getConnection();

		String sql = "delete from schedule where id = ?";
		int count = 0;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			count = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}

		try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println(count);
		if(count <= 0){
			return false;
		}
		return true;

	}
}
