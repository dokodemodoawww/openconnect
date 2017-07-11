package com.internousdev.openconnect.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.internousdev.openconnect.schedule.dto.ScheduleDTO;
import com.internousdev.util.DBConnector;

public class ScheduleMemoDAO {

	public boolean insert(String comment){

		DBConnector db=new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con= (Connection) db.getConnection();

		String sql = "insert into schedule (memo_text) values (?)";
		int count = 0;

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, comment);
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
	public ArrayList<ScheduleDTO> select(){

		DBConnector db=new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con= (Connection) db.getConnection();

		String sql = "SELECT * FROM schedule ORDER BY register_day ASC";
		ArrayList<ScheduleDTO> memoList = new ArrayList<>();

		/*日付指定
		 * long date = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日('E')'HH:mm");
		 */

		try{
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while(rs.next()){
				ScheduleDTO dto = new ScheduleDTO();
				dto.setComment(rs.getString("memo_text"));
				dto.setId(rs.getInt("id"));
				memoList.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return memoList;
	}

}
