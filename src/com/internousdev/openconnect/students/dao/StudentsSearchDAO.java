
package com.internousdev.openconnect.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.internousdev.util.DBConnector;

/**
 * 受講生情報に関するクラス
 * @author Tatsuhiro Saito
 * @since 2017/06/12
 * @version 1.0
 *
 */
public class StudentsSearchDAO {

	/**
	* 顧客情報を取得しリストに格納する
	* @param userId ユーザーID
	* @return studentsList 受講生情報
	* @author Tatsuhiro Saito
	* @since 2017/06/15
	* @version 1.0
	*/
	public ArrayList<StudentsDTO> select(String year, String month) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();

		ArrayList<StudentsDTO> studentsList = new ArrayList<StudentsDTO>();

			String sql=null;


			sql="select * from users  where year=? and month=? order by user_flg ";



		try {
			PreparedStatement ps = con.prepareStatement(sql);

				ps.setString(1, year);
				ps.setString(2, month);






			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentsDTO dto = new StudentsDTO();
				dto.setUserId(rs.getInt("user_id"));

				dto.setFamilyNameKanji(rs.getString("family_name_kanji"));


				dto.setGivenNameKanji(rs.getString("given_name_kanji"));
				dto.setFamilyNameKana(rs.getString("family_name_kana"));


				dto.setGivenNameKana(rs.getString("given_name_kana"));

				dto.setBirthday(rs.getString("birthday"));
				dto.setYear(rs.getString("year"));
				dto.setMonth(rs.getString("month"));


				dto.setPhoneNumber(rs.getString("phone_number"));

				dto.setPhoneEmail(rs.getString("phone_email"));

				dto.setMobileNumber(rs.getString("mobile_number"));

				dto.setMobileEmail(rs.getString("mobile_email"));

				dto.setPostal(rs.getString("postal"));

				dto.setAddress(rs.getString("address"));

				dto.setPassword(rs.getString("password"));

				dto.setSex(rs.getString("sex"));

				dto.setRegisterDay(rs.getString("register_day"));
				dto.setUpdateDay(rs.getString("update_day"));
				dto.setLoginFlg(rs.getBoolean("login_flg"));
				dto.setUserFlg(rs.getInt("user_flg"));
				dto.setTeamName(rs.getString("team_name"));
				dto.setUserName(rs.getString("user_name"));




				studentsList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return studentsList;
	}



}
