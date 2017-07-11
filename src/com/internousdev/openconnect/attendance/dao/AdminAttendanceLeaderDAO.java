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
 * @author Kawamura
 * @since 6/29
 * @version 1.0.0
 */
public class AdminAttendanceLeaderDAO {

	/* 勤怠履歴を格納する */
	public ArrayList<AttendanceDTO> searchList  = new ArrayList<AttendanceDTO>();
//	public ArrayList<AttendanceDTO> atTeamList = new ArrayList<AttendanceDTO>();
//
//	public ArrayList<AttendanceDTO> select2(int userId){
//
//
//			DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
//			Connection con = db.getConnection();
//
//			ArrayList<AttendanceDTO> atTeamList = new ArrayList<AttendanceDTO>();
//
//			String sql = "SELECT * FROM users WHERE user_id = ?";
//			try{PreparedStatement ps = con.prepareStatement(sql);
//				ps.setInt(1, userId);
//
//			ResultSet rs = ps.executeQuery();
//
//			while(rs.next()){
//				AttendanceDTO dto2 = new AttendanceDTO();
//				dto2.setTeamName(rs.getString("team_name"));
//
//                atTeamList.add(dto2);
//			}
//			rs.close();
//			ps.close();
//
//
//	} catch (SQLException e) {
//		e.printStackTrace();
//	} finally {
//		try {
//			con.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//	return atTeamList;
//}
	/**
	 *
	 * @param atYear
	 * @param atMonth
	 * @param atDay
	 * @param familyNameKanji
	 * @param givenNameKanji
	 * @param attendance
	 * @param teamName
	 * @return searchList
	 */
	public ArrayList<AttendanceDTO> select(int atYear,int atMonth,int atDay,String attendance,String teamName) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();
		Statement statement = null;

		/* 検索結果格納DTO */
		ArrayList<AttendanceDTO> searchList = new ArrayList<AttendanceDTO>();

		String sql = null;
		/* sql文生成に用いるWhere節文字列 */
		String whereState = "";

		/* 年が定義されたとき */
		if(atYear != 0){
			whereState += whereState.equals("") ? "": " AND "; //すでに条件文字列が存在するならANDを追加。
			whereState += "at_year="+atYear;
		}

		/* 月が定義されたとき */
		if(atMonth != 0){
			whereState += whereState.equals("") ? "": " AND "; //すでに条件文字列が存在するならANDを追加。
			whereState += "at_month="+atMonth;
		}

		/* 日が定義されたとき */
		if(atDay != 0){
			whereState += whereState.equals("") ? "": " AND "; //すでに条件文字列が存在するならANDを追加。
			whereState += "at_day="+atDay;
		}


		/* チーム名が定義されたとき */
		if(!((teamName).equals(""))){
			whereState += whereState.equals("") ? "": " AND "; //すでに条件文字列が存在するならANDを追加。
			whereState += "team_name='"+teamName+"'";
		}

		/* 勤怠状況定義時 */
		if(!((attendance).equals(""))){
			whereState += whereState.equals("") ? "": " AND "; //すでに条件文字列が存在するならANDを追加。
			whereState += "attendance"+attendance;
			}

			/* sql文定義 */
			if(!((whereState).equals(""))){
				/*条件完全未定義時、任意の勤怠状況データを得る。 */
				//			sql = "select * from attendance left join users on attendance.user_id=users.user_id;";
				//		} else {
				/* Where節 定義時 */
				sql = "select * from attendance left join users on attendance.user_id=users.user_id where " +whereState + "";
			}


	try {
		statement = con.createStatement();
		ResultSet rs = statement.executeQuery(sql); //SQL文の実行インターフェース。

		while (rs.next()) {
			AttendanceDTO dto = new AttendanceDTO();
			dto.setAtDate(rs.getString("at_date"));
			dto.setMonth(rs.getString("month"));
			dto.setFamilyNameKanji(rs.getString("family_name_kanji"));
			dto.setGivenNameKanji(rs.getString("given_name_kanji"));
			dto.setTeamName(rs.getString("team_name"));
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
