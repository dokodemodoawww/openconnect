/**
 *
 */
package com.internousdev.openconnect.decision.detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * 差し戻しボタン押下時に決裁のDB情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/21
 * @version 1.0
 */
public class DecisionDetailRemandDAO {

	/**
     * 差し戻しボタン押下時メソッド  差し戻しによる値の更新をする為のメソッド
     */
	public int remand( int decisionStatus, int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "";


		if(decisionStatus == 4) {
			//変更時差し戻し
			sql = "update decision set decision_status = 8 where decision_id = ?";
		}
		else if(decisionStatus == 6) {
			//遡求時差し戻し
			sql = "update decision set decision_status = 10 where decision_id = ?";
		}
		else {
			sql = "update decision set decision_status = 1 where decision_id = ?";
		}

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
