package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

	/**
	 * AddAppDAO
	 * サイトテーブルに接続する為のクラス
	 * @author MAIKI OKANO
	 * @since 2016/07/25
	 * @version 1.0
	 */
public class AppDAO {

	/**
	 * 挿入メソッド 指定された情報をDBに接続して挿入するメソッド
	 *
	 * @param siteId サイトID
	 * @param siteName サイトの名前
	 * @param siteUrl サイトのURL
	 * @param genre サイトのジャンル
	 * @return count 挿入できたらnull以外、失敗したらnull
	 */
	public int insert(int id, String name, String url, String genre) {
		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();
		String sql = "insert into sites(site_id, site_name, site_url, genre) values(?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, url);
			ps.setString(4, genre);
			count = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	/**
	 * 削除メソッド 指定された情報をDBから削除するメソッド
	 * @param siteId サイトID
	 * @return count 削除に成功したらSUCCESS、失敗したらERROR
	 */
	public int delete(int id){
		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();
		String sql = "delete from site where site_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
}
