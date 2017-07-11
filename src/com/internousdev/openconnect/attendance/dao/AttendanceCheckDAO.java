/**
 *
 */
package com.internousdev.openconnect.attendance.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.internousdev.util.DBConnector;

/**
 * 勤怠更新をする前にデータを検索するクラス
 * @author Kawamura
 * @since 7/3
 * @version 1.0.0
 */
public class AttendanceCheckDAO {

	/* 勤怠履歴を格納する */
	public ArrayList<AttendanceDTO> searchList  = new ArrayList<AttendanceDTO>();

	public ArrayList<AttendanceDTO> select(int userId, int atYear,int atMonth,int atDay) {
	DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
	Connection con = db.getConnection();
	Statement statement = null;

	String sql = "select * from attendance where user_id="+userId+" and at_year="+atYear+" and at_month="+atMonth+" and at_day="+atDay+";";

	try {
		statement = con.createStatement();
		ResultSet rs = statement.executeQuery(sql); //SQL文の実行インターフェース。

		while (rs.next()) {
			AttendanceDTO dto = new AttendanceDTO();
			dto.setAtYear(rs.getInt("at_year"));
			dto.setAtMonth(rs.getInt("at_month"));
			dto.setAtDay(rs.getInt("at_day"));
			dto.setAtDate(rs.getString("at_date"));
			dto.setUserId(rs.getInt("user_id"));
			dto.setAttendance(rs.getString("attendance"));
			dto.setReason(rs.getString("reason"));
			searchList.add(dto);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			/* Close Resouces */
			con.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return searchList;
	}
}
