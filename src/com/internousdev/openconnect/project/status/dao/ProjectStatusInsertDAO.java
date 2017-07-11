/**
 *
 */
package com.internousdev.openconnect.project.status.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * DBにリリース状況の情報を追加する為のクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectStatusInsertDAO {

	/**
	 * 実行メソッド DBにリリース状況の情報を追加
	 * @author KOHEI NITABARU
	 * @param projectId
	 * @return count
	 */
	public int insert( int projectId ){

		int count = 0;

		Connection con = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();


		String sql = "insert into project_status( project_id )values( ? )";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,projectId);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}

}
