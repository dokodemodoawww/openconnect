package com.internousdev.openconnect.projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * 情報を更新するクラス
 * @author YUICHI KIRIU
 * @since 2016/09/08
 */
public class ProjectsUpdateDAO {

	/**
	 * 情報を更新するメソッド
	 *  @author YUICHI KIRIU
	 *  @param projectName
	 *  @param managerId
	 *  @param subManagerId
	 *  @param  startDate
	 *  @param endDate
	 *  @param note
	 *  @param projectId
	 *  @return   count
	 */

	public int select(String projectName,int managerId,int subManagerId,int memberNumber,String startDate, String endDate,String note, int projectId){
		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE projects SET project_name=?, manager_id=?,sub_manager_id=?,member_number=?, start_date=? , end_date=? , note=? where  project_id=?";
		//終了日が空白対応
		if( endDate.equals("") ){
			endDate = "0000-00-00";
		}

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,projectName);
			ps.setInt(2,managerId);
			ps.setInt(3,subManagerId);
			ps.setInt(4,memberNumber);
			ps.setString(5,startDate);
			ps.setString(6,endDate);
			ps.setString(7,note);
			ps.setInt(8,projectId);
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

