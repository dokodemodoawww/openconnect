package com.internousdev.openconnect.schedule.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;
import com.mysql.jdbc.Connection;


/**
 * スケジュール一覧から追加入力された情報をDBに追加するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */
public class ScheduleInsertDAO {

	/**
	 * スケジュール一覧より入力された情報をDBに追加するメソッド。
	 * @author MASAHIRO KEDSUKA
	 * @param startday
	 * @param endday
	 * @param title
	 * @param content
	 * @return count
	 */
	public int insert (String startDay, String endDay,String title, String search){

		int count=0;
		DBConnector db=new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn= (Connection) db.getConnection();
		String sql="INSERT INTO schedule(start_day, end_day,title, team_name) VALUES (?,?,?,?)";

		try{
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,startDay);
			ps.setString(2,endDay);
			ps.setString(3,title);
			ps.setString(4,search);
			count=ps.executeUpdate();

		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}
}
