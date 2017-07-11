/**
 *
 */
package com.internousdev.openconnect.attendance_test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.internousdev.util.DBConnector;
/**
 * 勤怠の検索に関するDAO
 * @author Kawamura
 * @since6/19
 * @version1.0.0
 */
public class AttendanceDao {

	/**
	 * 勤怠履歴を格納する
	 */
	public ArrayList<AttendanceDTO> searchList = new ArrayList<AttendanceDTO>();

	/**
	 * 諸条件コンテキストを引数にとり、勤怠状況をデータベースより取得するメソッド。
	 * 諸コンテキストには、未定義を許容する。
	 * int型について、未定義時は値0。String型について、未定義時には空文字列。
	 *
	 * @param atYear
	 * @param atMonth
	 * @param atDay
	 * @param attendance
	 * @param teamName
	 * @return searchList
	 */
	public ArrayList<AttendanceDTO> select(int atYear, int atMonth, int atDay, String attendance, String teamName) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();
		Statement statement = null;


		/* 検索結果格納DTO */
		ArrayList<AttendanceDTO> searchList = new ArrayList<AttendanceDTO>();

		String sql = null;
		/* sql文生成に用いるWhere節文字列 */
		String whereState = "";

		/* 日付が定義されたとき */
		if(atYear != 0 && atMonth != 0 && atDay != 0){
			whereState += "at_year="+atYear +" AND at_month="+atMonth+" AND at_day="+atDay;
		}
		/* 勤怠状況定義時 */
		if( !((attendance).equals(""))){
			whereState += whereState.equals("") ? "": " AND "; // すでに条件文字列が存在するならANDを追加。
			whereState += "attendance='"+attendance+"'";
		}
		/* チーム名 */
		if(!((teamName).equals(""))){
			whereState += whereState.equals("") ? "": " AND "; // すでに条件文字列が存在するならANDを追加。
			whereState += "team_name='"+teamName+"'";
		}

		/* sql文定義 */
		if (whereState.equals("")){
			/* 条件完全未定義時、任意の勤怠状況データを得る。 */
			sql = "select * from attendance left join users on attendance.user_id=users.user_id;";
		} else {
			/* Where節 定義時 */
			sql = "select * from attendance left join users on attendance.user_id=users.user_id where " +whereState +";";
		}

		/* Do Search */
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
				/* Close Resources */
				con.close();
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return searchList;
	}

}
