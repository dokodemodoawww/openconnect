package com.internousdev.openconnect.projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.projects.dto.ProjectsListDTO;
import com.internousdev.util.DBConnector;

public class ProjectsListDAO {
	/**
	 * 表示メソッド ログインした際にDBからサイト情報をリスト化して抽出し、DTOに格納する
	 *
	 * @author YUICHI KIRIU
	 * @return  projectList
	 * ProjectsList抽出に成功したらSUCCESS、失敗したらERROR
	 */
	public List<ProjectsListDTO> projectList = new ArrayList<ProjectsListDTO>();


	public List<ProjectsListDTO> select() {

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();


		try {
			String sql = "SELECT projects.project_id, projects.project_name,projects.manager_id,projects.sub_manager_id,projects.start_date,projects.end_date,projects.note FROM projects  INNER JOIN  users ON projects.manager_id  = users.user_id";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

            while (rs.next()) {
            	ProjectsListDTO dto = new ProjectsListDTO();

            	dto.setProjectId(rs.getInt("project_id"));
            	dto.setProjectName(rs.getString("project_name"));
            	dto.setStartDate(sdf.format(rs.getDate("start_date")).toString());
            	dto.setEndDate(sdf.format(rs.getDate("end_date")).toString());
            	dto.setNote(rs.getString("note"));
            	dto.setManagerId(rs.getInt("manager_id"));
            	dto.setSubManagerId(rs.getInt("sub_manager_id"));


				projectList.add(dto);
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
		return projectList;
	}

	/**
	 * 取得メソッド プロジェクト名リスト
	 * @author YUICHI KIRIU
	 * @return projectList
	 */
	public List<ProjectsListDTO> getProjectList() {
		return projectList;
	}

	/**
	 * 設定メソッド プロジェクト名リスト
	 * @author YUICHI KIRIU
	 * @param projectList
	 */
	public void setProjectList(List<ProjectsListDTO> projectList) {
		this.projectList = projectList;
	}

}