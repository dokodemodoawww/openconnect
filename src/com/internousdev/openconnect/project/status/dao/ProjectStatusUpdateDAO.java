package com.internousdev.openconnect.project.status.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * DBのリリース状況の情報を更新するクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectStatusUpdateDAO {

	/**
	 * 実行メソッド DBのリリース状況の情報を更新
	 * @author KOHEI NITABARU
	 * @param aEnvStart
	 * @param aEnvEnd
	 * @param bEnvStart
	 * @param bEnvEnd
	 * @param rEnvStart
	 * @param rEnvEnd
	 * @param note
	 * @param statusId
	 * @return count
	 */

	public int update( String aEnvStart, String aEnvEnd, String bEnvStart, String bEnvEnd, String rEnvStart, String rEnvEnd, String note, int statusId ){
		int count=0;

		Connection conn=new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();
		String sql="update project_status set a_envstart=?, a_envend=?, b_envstart=?, b_envend=?, r_envstart=?, r_envend=?, aws_status=?, note=? where status_id=?";

		if( aEnvStart.equals("") ) aEnvStart = "0000-00-00";
		if( aEnvEnd.equals("") ) aEnvEnd = "0000-00-00";
		if( bEnvStart.equals("") ) bEnvStart = "0000-00-00";
		if( bEnvEnd.equals("") ) bEnvEnd = "0000-00-00";
		if( rEnvStart.equals("") ) rEnvStart = "0000-00-00";
		if( rEnvEnd.equals("") ) rEnvEnd = "0000-00-00";

		String awsStatus = "";

		if( !aEnvEnd.equals("0000-00-00") ) awsStatus = "A環境リリース済";
		if( !bEnvEnd.equals("0000-00-00") ) awsStatus = "B環境リリース済";
		if( !rEnvEnd.equals("0000-00-00") ) awsStatus = "リリース済";

		try{
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, aEnvStart);
			ps.setString(2, aEnvEnd);
			ps.setString(3, bEnvStart);
			ps.setString(4, bEnvEnd);
			ps.setString(5, rEnvStart);
			ps.setString(6, rEnvEnd);
			ps.setString(7, awsStatus);
			ps.setString(8, note);
			ps.setInt(9, statusId);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;
	}
}
