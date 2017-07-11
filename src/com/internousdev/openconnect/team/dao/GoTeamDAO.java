/**
 *
 */
package com.internousdev.openconnect.team.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.team.dto.TeamDTO;
import com.internousdev.util.DBConnector;

/**
 * @author TEPPEI MATSUMOTO
 * チーム情報を表示するためのメソッド
 * @author Teppei Matsumoto
 * @since 2017/06/14
 * @version 1.0
 */
public class GoTeamDAO {

	public ArrayList<TeamDTO> teamUserList = new ArrayList<TeamDTO>();

	public ArrayList<TeamDTO> select(int userId){

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();

		ArrayList<TeamDTO> teamUserList = new ArrayList<TeamDTO>();

		String sql = "select * from users where user_id = ?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				TeamDTO dto = new TeamDTO();
				dto.setTeamName(rs.getString("team_name"));
				dto.setUserFlg(rs.getInt("user_flg"));
				dto.setFamilyNameKanji(rs.getString("family_name_kanji"));
				dto.setGivenNameKanji(rs.getString("given_name_kanji"));
				teamUserList.add(dto);
			}
			rs.close();
			ps.close();

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
			con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return teamUserList;
	}

}
