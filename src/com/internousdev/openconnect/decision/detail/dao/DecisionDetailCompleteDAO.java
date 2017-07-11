/**
 *
 */
package com.internousdev.openconnect.decision.detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * リリース完了ボタン押下時に決裁のDB情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/23
 * @version 1.0
 */
public class DecisionDetailCompleteDAO {

	/**
     * リリース完了ボタン押下時メソッド  リリース完了による値の更新をする為のメソッド
     */
	public int releaseComplete( int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "update decision set decision_status = 7 where decision_id = ?";


		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, decisionId);

			count = ps.executeUpdate();


		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return count;

	}

}
