/**
 *
 */
package com.internousdev.openconnect.attendance.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException; //public class SQLException extends Exception implements Iterable<Throwable>APIのクラス
import java.sql.Statement;
import java.util.ArrayList;

import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.internousdev.util.DBConnector;

/**
 * Attendancetのデータ削除に関するクラス
 * @author Kawamura
 * @since 6/26
 * @version 1.0.0
 */
public class AdminAttendanceSelectDAO {

	ArrayList<AttendanceDTO> selectList = new ArrayList<AttendanceDTO>();

	/**
	 * 削除するデータを月で検索するメソッド
	 * @param atMonth
	 * @return selectList
	 */
	public ArrayList<AttendanceDTO> select(int atMonth){
	DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
	Connection con = db.getConnection();
	Statement statement = null;
	String sql = null;

	/* 検索結果格納DTO */
	ArrayList<AttendanceDTO> selectList = new ArrayList<AttendanceDTO>();

	/* sql文の定義 */
	if(atMonth != 0){
		sql = "select * from attendance where atMonth=?";
	}

	try{
		statement = con.createStatement();
		ResultSet rs = statement.executeQuery(sql);

		while (rs.next()) {
			AttendanceDTO dto = new AttendanceDTO();
			dto.setMonth(rs.getString("at_month"));
			selectList.add(dto);
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
	return selectList;
	}

}
