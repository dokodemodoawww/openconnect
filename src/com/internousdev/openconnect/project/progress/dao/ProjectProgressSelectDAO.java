package com.internousdev.openconnect.project.progress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.project.progress.dto.ProjectProgressDTO;
import com.internousdev.util.DBConnector;

/**
 * 似たようなキーワードをDBから検索する為のクラス
 *
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectProgressSelectDAO {

	/**
	 * 検索リスト
	 */
	public List<ProjectProgressDTO> searchList = new ArrayList<ProjectProgressDTO>();

	/**
	 * 抽出メソッド 似たようなキーワードの検索結果情報をリスト化して抽出し、DTOに格納する
	 *
	 * @author TATUHUMI ITOU
	 * @param search
	 * @return  searchList 抽出に成功したらSUCCESS、失敗したらERROR
	 */
	public List<ProjectProgressDTO> select(String search) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		try {
			String sql = "select*from project_progress inner join projects on project_progress.project_id = projects.project_id WHERE project_name LIKE '%" + search + "%'";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

	   		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

			while (rs.next()) {
				ProjectProgressDTO dto = new ProjectProgressDTO();
				dto.setProgressId(rs.getInt("progress_id"));
				dto.setProjectId(rs.getInt("project_id"));

				try { dto.setProjectDay(sdf.format(rs.getDate("project_day")).toString()); }catch(Exception e){}
				dto.setProjectPlan(rs.getString("project_plan"));
				dto.setProjectResult(rs.getString("project_result"));
				dto.setOther(rs.getString("other"));
				dto.setProjectName(rs.getString("project_name"));
				dto.setManagerId(rs.getInt("manager_id"));
				dto.setSubManagerId(rs.getInt("sub_manager_id"));
				try { dto.setStartDate(sdf.format(rs.getDate("start_date")).toString()); }catch(Exception e){}
            	try { dto.setEndDate(sdf.format(rs.getDate("end_date")).toString()); }catch(Exception e){}
				dto.setNote(rs.getString("note"));
				searchList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return searchList;
	}

	/**
	* 取得メソッド
	* @author KOHEI NITABARU
	* @return searchList
	*/
	public List<ProjectProgressDTO> getSearchList() {
		return searchList;
	}

	/**
	* 設定メソッド
	* @author KOHEI NITABARU
	* @param searchList
	*/
	public void setSearchList(List<ProjectProgressDTO> searchList) {
		this.searchList = searchList;
	}

}