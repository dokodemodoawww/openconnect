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
public class GoTeamEditDAO {

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
	public ArrayList<TeamDTO> teamList = new ArrayList<TeamDTO>();

	public ArrayList<TeamDTO> select2(){
		DBConnector db2 = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn2 = db2.getConnection();
		String sql = "SELECT DISTINCT project_name FROM projects ORDER BY project_name ASC";

		try {
			PreparedStatement ps2 = conn2.prepareStatement(sql);
			ResultSet rs2 = ps2.executeQuery();

			while(rs2.next()) {
				TeamDTO dto2 = new TeamDTO();
				dto2.setTeamName(rs2.getString("project_name"));
				teamList.add(dto2);

			}


		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
			conn2.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return teamList;
	}

}
