/**
 *
 */
package com.internousdev.openconnect.decision.detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.internousdev.util.DBConnector;

/**
 * 遡求申請ボタン押下時に決裁のDB情報を更新するクラス
 * @author SOSHI AZUMA
 * @since 2017/06/24
 * @version 1.0
 */
public class DecisionDetailRecourseDAO {


	/**
	 * 遡求申請ボタン押下時メソッド  遡求申請による値の更新をする為のメソッド
	 */
	public int recourse( int decisionId ) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String applyDay = sdf.format(System.currentTimeMillis());
		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "update decision set decision_status = 6, permit_status = 2, s_apply_day = ? where decision_id = ?";


		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, applyDay);
			ps.setInt(2, decisionId);

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
