package com.internousdev.openconnect.decision.edit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;
/**
 * 表示したい内容を、DBから取り出しDTOへ転送する為のクラス
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class DecisionEditPasswordDAO {

	/**
	 * 決裁手続きリスト
	 */
	/**
	 * 表示メソッド  表示したい内容を、DBから取り出しDTOへ転送する為のメソッド
	 * @author TATUHUMI ITOU
	 * @return  projectList 抽出に成功したらSUCCESS、失敗したらERROR
	 */

	public int select(String password,int decisionDetailId) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con = db.getConnection();
			int count = 0;
			String sql = "UPDATE decision_detail SET password=? WHERE decision_detail_id=?";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,password);
				ps.setInt(2,decisionDetailId);
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
