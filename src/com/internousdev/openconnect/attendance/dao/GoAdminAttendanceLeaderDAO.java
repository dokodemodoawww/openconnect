/**
 *
 */
package com.internousdev.openconnect.attendance.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.internousdev.util.DBConnector;

/**
 * @author internousdev
 *
 */
public class GoAdminAttendanceLeaderDAO {


	public ArrayList<AttendanceDTO> atTeamList = new ArrayList<AttendanceDTO>();

	public ArrayList<AttendanceDTO> select(int userId){


			DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
			Connection con = db.getConnection();

			ArrayList<AttendanceDTO> atTeamList = new ArrayList<AttendanceDTO>();

			String sql = "SELECT * FROM users WHERE user_id = ?";
			try{PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				AttendanceDTO dto = new AttendanceDTO();
				dto.setTeamName(rs.getString("team_name"));

                atTeamList.add(dto);
			}
			rs.close();
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
	return atTeamList;
}
}


