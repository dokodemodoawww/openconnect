/**
 *
 */
package com.internousdev.openconnect.attendance.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * @author internousdev
 *
 */
public class AdminAttendanceUpdateDAO {

	 public int update(int userId,String attendance,String reason,int atYear,int atMonth,int atDay) {


	        DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/", "openconnect","root","mysql");
	        Connection con = db.getConnection();
	        int result = 0;
	        String sql = "update attendance set attendance=?,reason=? where user_id=? AND at_year=? AND at_month=? AND at_day=?";
	        try {
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, attendance);
	            ps.setString(2, reason);
	            ps.setInt(3,userId);
	            ps.setInt(4,atYear);
	            ps.setInt(5,atMonth);
	            ps.setInt(6,atDay);


	            result = ps.executeUpdate();
	            ps.close();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return result;
	    }

	}


