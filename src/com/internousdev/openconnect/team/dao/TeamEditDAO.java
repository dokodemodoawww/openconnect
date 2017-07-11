/**
 *
 */
package com.internousdev.openconnect.team.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * チーム情報の編集の際に使用するクラス
 * @author Teppei Matsumoto
 *@since 2017/06/14
 *@version 1.0
 */
public class TeamEditDAO {
	/**
	 * データベースのチーム情報を更新するメソッド
	 * @param userId ユーザーID
	 * @param teamName
	 * @param userFlg
	 * @return count
	 */
	public int update(String teamName,int userFlg,int userId) throws SQLException{
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = null;
		con = db.getConnection();
		int count = 0;
		String sql = "update users set team_name=?,user_flg=? where user_id=?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, teamName);
			ps.setInt(2, userFlg);
			ps.setInt(3, userId);
			count = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return count;
	}

}
