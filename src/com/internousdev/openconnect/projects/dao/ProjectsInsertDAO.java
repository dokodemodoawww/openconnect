package com.internousdev.openconnect.projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.projects.dto.ProjectsListDTO;
import com.internousdev.util.DBConnector;

/**
 * 画面から追加された情報をＤＢに追加するクラス
 *
 * @author YUICHI KIRIU
 * @since 2016/09/07
 */
public class ProjectsInsertDAO {

	// プロジェクト名が二重に登録されていないかチェックするメソッド
		public ArrayList<ProjectsListDTO> select(String projectName) {

			DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
					"mysql");
			Connection conn = db.getConnection();
			//String SearchName= "%"+ projectName + "%";

			ArrayList<ProjectsListDTO> checkList = new ArrayList<ProjectsListDTO>();
			String sql = "select project_name from projects where project_name= ? ";

			try{
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, projectName);
				ResultSet rs = ps.executeQuery();
				while (rs.next()){
					ProjectsListDTO dto = new ProjectsListDTO();
					dto.setProjectName(rs.getString("project_name"));
					checkList.add(dto);
				}
			}

			 catch (SQLException e ) {
			   e.printStackTrace() ;
			} finally {
				try{
					conn.close();
			}catch(SQLException e){
				e.printStackTrace();

		}
			}
			return checkList;
		}



	/**
	 * 追加された情報をＤＢに追加するメソッド
	 *
	 * @author YUICHI KIRIU
	 * @param projectName
	 * @param managerId
	 * @param subManagerId
	 * @param startDate
	 * @return count
	 */

	public int insert(String projectName, int managerId, int subManagerId, int memberNumber, String startDate) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection conn = db.getConnection();
		String sql = "INSERT INTO projects(project_name,manager_id,sub_manager_id,member_number,start_date)VALUES(?, ?, ? ,?, ?)";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, projectName);
			ps.setInt(2, managerId);
			ps.setInt(3, subManagerId);
			ps.setInt(4, memberNumber);
			ps.setString(5, startDate);

			count = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;

	}


	public int managerIdFinder(String managerFamilyName, String managerGivenName){
		int managerId = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection conn = db.getConnection();
		String sql = "SELECT user_id FROM users WHERE family_name_kanji = ? and given_name_kanji = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, managerFamilyName);
			ps.setString(2, managerGivenName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
            	managerId = rs.getInt("user_id");
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return managerId;
	}

	public int subManagerIdFinder(String subManagerFamilyName, String subManagerGivenName){
		int subManagerId = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection conn = db.getConnection();
		String sql = "SELECT user_id FROM users WHERE family_name_kanji = ? and given_name_kanji = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, subManagerFamilyName);
			ps.setString(2, subManagerGivenName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

            	subManagerId = rs.getInt("user_id");

			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return subManagerId;
	}





}



