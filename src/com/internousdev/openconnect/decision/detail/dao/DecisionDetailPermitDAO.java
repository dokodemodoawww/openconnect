/**
 *
 */
package com.internousdev.openconnect.decision.detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;
/**
 * 画面で追加した一覧情報をDBへ転送する為のクラス
 * @author SOSHI AZUMA
 * @since 2017/06/16
 * @version 1.0
 */
public class DecisionDetailPermitDAO {


	/**
     * 実施決裁の先生承認時メソッド  承認による値の更新と実施_承認者ID(3人目:先生)の登録をする為のメソッド
     */
	public int updatePJ( String jDecId, int userId, int decisionId ) {


		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn = db.getConnection();
		String sql = "update decision set decision_type = '契約', decision_status = 0, permit_status = 0, j_dec_id = ?, j_permiter_id3 = ? where decision_id = ?";

		try{
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, jDecId);
			ps.setInt(2, userId);
			ps.setInt(3, decisionId);

			count = ps.executeUpdate();


		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}


	/**
     * 契約決裁の先生承認時メソッド  承認による値の更新と契約_承認者ID(3人目:先生)の登録をする為のメソッド
     */
	public int updatePK( String kDecId, int userId, int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn = db.getConnection();
		String sql = "update decision set decision_status = 5, permit_status = 0, k_dec_id = ?, k_permiter_id3 = ? where decision_id = ?";

		try{
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, kDecId);
			ps.setInt(2, userId);
			ps.setInt(3, decisionId);

			count = ps.executeUpdate();


		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}


	/**
     * 実施兼契約決裁の先生承認時メソッド  承認による値の更新と実施兼契約_承認者ID(3人目:先生)の登録をする為のメソッド
     */
	public int updatePJK( String jkDecId, int userId, int decisionId ) {


		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn = db.getConnection();
		String sql = "update decision set decision_status = 5, permit_status = 0, jk_dec_id = ?, k_permiter_id3 = ? where decision_id = ?";

		try{
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, jkDecId);
			ps.setInt(2, userId);
			ps.setInt(3, decisionId);

			count = ps.executeUpdate();


		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}



	/**
     * リーダー承認時メソッド  承認による値の更新と承認者ID(リーダー)の登録をする為のメソッド
     */
	public int updateP( String decisionType, int permitStatus, int userId, int decisionId ) {


		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "";

		if(decisionType.equals("実施")) {
			if(permitStatus == 0) {
			sql = "update decision set permit_status = 1, j_permiter_id1 = ? where decision_id = ?";
			}
			else if(permitStatus == 1) {
			sql = "update decision set permit_status = 2, j_permiter_id2 = ? where decision_id = ?";
			}
		}
		else {
			if(permitStatus == 0) {
			sql = "update decision set permit_status = 1, k_permiter_id1 = ? where decision_id = ?";
			}
			else if(permitStatus == 1) {
			sql = "update decision set permit_status = 2, k_permiter_id2 = ? where decision_id = ?";
			}
		}

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, decisionId);

			count = ps.executeUpdate();


		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}



	/**
     * [変更]実施決裁の先生承認時メソッド  承認による値の更新と承認者ID(先生)の登録をする為のメソッド
     */
	public int updateChangePJ( int userId, int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "update decision set decision_type = '契約', decision_status = 11, permit_status = 0, j_permiter_id3 = ? where decision_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, decisionId);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}



	/**
     * [変更]契約・実施兼契約決裁の先生承認時メソッド  承認による値の更新と承認者ID(先生)の登録をする為のメソッド
     */
	public int updateChangePK( int userId, int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "update decision set permit_status = 0, decision_status = 5, k_permiter_id3 = ? where decision_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, decisionId);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}



	/**
     * [遡求]実施・契約・実施兼契約決裁の先生承認時メソッド  承認による値の更新と承認者ID(先生)の登録をする為のメソッド
     */
	public int updateRecoursePK( int userId, int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql = "update decision set permit_status = 0, decision_status = 5, s_permiter_id = ? where decision_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, decisionId);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}



}
