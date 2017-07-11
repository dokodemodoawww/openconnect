/**
 * 
 */
package com.internousdev.openconnect.addsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * URL情報追加に関するクラス
 * @author AkitomoMiayuchi
 * @since 2017/06/26
 * @version 1.0
 *
 */

public class AddsiteDAO {


	/**
	 * URLを追加するメソッド
	 * @param siteId サイトID
	 * @param siteName サイト名
	 * @param siteUrl サイトURL
	 * @param picture イメージパス
	 * @param year  年
	 * @return inserted 成否を格納する変数＜保留＞
	 */
	public int insert(String siteName,String siteUrl,String picture, int year){
		DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con=db.getConnection();
		int inserted=0;
		String sql= "insert into site(site_name,site_url,picture,year)"
				+ "values(?,?,?,?)";

		try{
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1,siteName);
			ps.setString(2,siteUrl);
			ps.setString(3,picture);
			ps.setInt(4,year);

			inserted=ps.executeUpdate();

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
		return inserted;
	}
}

