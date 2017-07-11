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
 * [変更申請]決裁手続き一覧から更新したい内容を、DBへ転送する為のクラス
 * @author SOSHI AZUMA
 * @since 2017/06/28
 * @version 1.0
 */
public class DecisionDetailChangeDAO {

	/**
     * [変更申請]起案番号発行を伴わない申請時の情報更新メソッド  更新したい内容を、DBへ転送する為のメソッド
     */
	public int change( String decisionType, int decisionId ) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String applyDay = sdf.format(System.currentTimeMillis());
		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql;

		if(decisionType.equals("実施")) {
			//リーダーの承認ダブりif文に引っかかるので承認者をnullにする
			sql = "UPDATE decision SET decision_status = 4, decision_type = '実施', j_permiter_id1 = null, j_permiter_id2 = null, j_permiter_id3 = null"
					+ ", k_permiter_id1 = null, k_permiter_id2 = null, k_permiter_id3 = null, j_apply_day = ? where decision_id = ?";
		}
		else {
			sql = "UPDATE decision SET decision_status = 4, k_permiter_id1 = null, k_permiter_id2 = null, k_permiter_id3 = null, k_apply_day = ? where decision_id = ?";
		}

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, applyDay);
			ps.setInt(2, decisionId);

			count =ps.executeUpdate();

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



	/**
     * [変更申請]起案番号発行を伴わない申請時の情報更新メソッド(差し戻し後用)  更新したい内容を、DBへ転送する為のメソッド
     */
	public int changeRtime( int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE decision SET decision_status = 4 where decision_id = ?";


		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, decisionId);

			count =ps.executeUpdate();

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
