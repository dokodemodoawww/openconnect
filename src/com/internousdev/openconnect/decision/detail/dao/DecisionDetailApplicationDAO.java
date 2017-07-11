package com.internousdev.openconnect.decision.detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.decision.detail.dto.DecisionDetailDTO;
import com.internousdev.util.DBConnector;



/**
 * 決裁手続き一覧から更新したい内容を、DBへ転送する為のクラス
 * @author SOSHI AZUMA
 */
public class DecisionDetailApplicationDAO {



	/**
	 * DBの起案番号と照合し前方一致する起案番号を全て取得する為のメソッド
	 */
	public List<DecisionDetailDTO> select(String decisionType, String idNum) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con = null;
		con = db.getConnection();

		String sql = "select * from decision where";

		if(decisionType.equals("実施")) {
			sql = sql + " j_imp_id like '" + idNum + "%'";
		}
		else if(decisionType.equals("契約")) {
			sql = sql + " k_imp_id like '" + idNum + "%'";
		}
		else {
			sql = sql + " jk_imp_id like '" + idNum + "%'";
		}

		List<DecisionDetailDTO> idNumList = new ArrayList<DecisionDetailDTO>();

		try {
			PreparedStatement ps = null;
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				DecisionDetailDTO dto = new DecisionDetailDTO();

				if(decisionType.equals("実施")) {
					dto.setIdNumAmount(rs.getString("j_imp_id"));
				}
				else if(decisionType.equals("契約")) {
					dto.setIdNumAmount(rs.getString("k_imp_id"));
				}
				else {
					dto.setIdNumAmount(rs.getString("jk_imp_id"));
				}

				idNumList.add( dto );
			  }

			rs.close();
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return idNumList;
	}



	/**
     * 実施決裁の申請情報更新メソッド  更新したい内容を、DBへ転送する為のメソッド
     */
	public int updateAJ( String jImpId, int decisionId ) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String applyDay = sdf.format(System.currentTimeMillis());
		int count = 0;


		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE decision SET decision_status = 3, j_imp_id = ?, j_apply_day = ? where decision_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, jImpId);
			ps.setString(2, applyDay);
			ps.setInt(3, decisionId);

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
     * 契約決裁の申請情報更新メソッド  更新したい内容を、DBへ転送する為のメソッド
     */
	public int updateAK( String kImpId, int decisionId ) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String applyDay = sdf.format(System.currentTimeMillis());
		int count = 0;


		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE decision SET decision_status = 3, k_imp_id = ?, k_apply_day = ? where decision_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, kImpId);
			ps.setString(2, applyDay);
			ps.setInt(3, decisionId);

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
     * 実施兼契約決裁の申請情報更新メソッド  更新したい内容を、DBへ転送する為のメソッド
     */
	public int updateAJK( String jkImpId, int decisionId ) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String applyDay = sdf.format(System.currentTimeMillis());
		int count = 0;


		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE decision SET decision_status = 3, jk_imp_id = ?, k_apply_day = ? where decision_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, jkImpId);
			ps.setString(2, applyDay);
			ps.setInt(3, decisionId);

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
     * 起案番号発行を伴わない申請時の情報更新メソッド  更新したい内容を、DBへ転送する為のメソッド
     */
	public int updateSimple( String decisionType, int decisionId ) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String applyDay = sdf.format(System.currentTimeMillis());
		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql;

		if(decisionType.equals("実施")) {
			sql = "UPDATE decision SET decision_status = 3, j_apply_day = ? where decision_id = ?";
		}
		else {
			sql = "UPDATE decision SET decision_status = 3, k_apply_day = ? where decision_id = ?";
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



}