/**
 *
 */
package com.internousdev.openconnect.attendance.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * @author Teppei Matsumoto
 * @since  2017/06/27
 * @version 1.0
 *
 */
public class AddAttendanceDAO {

	public int insert(int userId){

		DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con =db.getConnection();
		int ret = 0;
		String sql = "insert into attendance(user_id) select user_id from users";

		try{
	            PreparedStatement ps = con.prepareStatement(sql);


	            ret = ps.executeUpdate(sql);

	        }catch (SQLException e){
	            e.printStackTrace();
	        }finally{
	                try{
	                    con.close();
	                }catch (SQLException e){
	                    e.printStackTrace();
	                }
	            }
		return ret;
	}

	/**
	 * @param atYear
	 * @param atMonth
	 * @param atDay
	 * @param attendance
	 * @param atDate2
	 * @param atDate
	 * @return
	 */
	public int update(int atYear, int atMonth, int atDay, String attendance, String atDate, String atDate2) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = null;
		con = db.getConnection();
		int count = 0;
		String sql = "update attendance set at_year=?,at_month=?,at_day=?,attendance=? where DATE_FORMAT(at_date,'%Y-%m-%d') BETWEEN ? AND ?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, atYear);
			ps.setInt(2, atMonth);
			ps.setInt(3, atDay);
			ps.setString(4, attendance);
			ps.setString(5, atDate);
			ps.setString(6, atDate2);

			count = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return count;
	}

}
