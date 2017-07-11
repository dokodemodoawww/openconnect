package com.internousdev.openconnect.schedule.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;
import com.mysql.jdbc.Connection;

/**
 * スケジュール一覧のDB情報を更新するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */
public class ScheduleUpdateDAO {

	/**
	 * スケジュール一覧のDBを更新するメソッド。
	 * @author MASAHIRO KEDSUKA
	 * @param id
	 * @param startDay
	 * @param endDay
	 * @param title
	 * @param content
	 * @return count
	 */
	public int update(int id, String startDay, String endDay, String title){
		int count=0;

		DBConnector db=new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn= (Connection) db.getConnection();

		//終了日が空白対応
		if( endDay.equals("") ){
			endDay = "0000-00-00";
		}

		String sql = "UPDATE schedule SET start_day=?, end_day=?, title=? WHERE id=?";

		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,startDay);
			ps.setString(2,endDay);
			ps.setString(3,title);
			ps.setInt(4,id);


			count =ps.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}

}
