package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * UpdateAppDAO UpdateAppActionがDBにアクセスするためのDAOクラス
 *
 * @author Arima Genki
 * @since 2015/06/18
 * @version 1.0
 */
public class UpdateAppDAO {

	Connection con = null;

	PreparedStatement ps = null;


	/**
	 * アプリを編集するメソッド
	 *
	 * @author Arima Genki
	 * @since 2015/06/18
	 * @param siteId サイトID
	 * @param siteName サイトの名前
	 * @param siteUrl サイトのURL
	 * @param genre サイトのジャンル
	 * @return result 更新に成功したらSUCCESS、失敗したらERROR
	 */
	public int update(int siteId, String siteName, String siteUrl, String genre){
		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();
		String sql = "update site set site_name=?, site_url=?, genre=? where site_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, siteName);
			ps.setString(2, siteUrl);
			ps.setString(3, genre);
			ps.setInt(4, siteId);
			count = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 try{
	                con.close();//DBとの接続終了
	            }catch(SQLException e){
	                e.printStackTrace();
	            }
	        }
		return count;
	}
}
