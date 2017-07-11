package com.internousdev.openconnect.project.progress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;
/**
 * 画面で受け取った更新情報を、DBへ転送する為のクラス
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectProgressUpdateDAO {
	  /**
     * 更新メソッド  画面で受け取った更新情報を、DBへ転送し、更新する為のメソッド
     * @author TATUHUMI ITOU
     * @param projectId
     * @param projectDay
     * @param projectPlan
     * @param projectResult
     * @param other
	 * @return count
     */
	public int update(int progresstId,String projectDay,String projectPlan,String projectResult,String other) throws SQLException{
		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE project_progress SET project_day=?, project_plan=?, project_result=?, other=? where progress_id=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);


			ps.setString(1,projectDay);
			ps.setString(2,projectPlan);
			ps.setString(3,projectResult);
			ps.setString(4,other);
			ps.setInt(5,progresstId);
			count =ps.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}
}

