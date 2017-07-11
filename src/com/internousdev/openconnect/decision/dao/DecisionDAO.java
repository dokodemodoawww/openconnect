/**
 *
 */
package com.internousdev.openconnect.decision.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.internousdev.util.DBConnector;

/**
 *
 * @author KOTA MIYAZATO
 *
 */

/**
 * @author internousdev
 *
 */
public class DecisionDAO {

	public ArrayList<DecisionDTO> decisionList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> KNameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> jPermiter1nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> jPermiter2nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> jPermiter3nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> kPermiter1nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> kPermiter2nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> kPermiter3nameList = new ArrayList<DecisionDTO>();
	public ArrayList<DecisionDTO> select(int decisionId, int type){

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		ArrayList<DecisionDTO> decisionList = new ArrayList<DecisionDTO>();

		String sql = "select * from decision where decision_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, decisionId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				DecisionDTO dto = new DecisionDTO();


		        dto.setDecisionId(rs.getInt("decision_id")); // 	実施起案者ユーザーID

				dto.setJDrafterId(rs.getInt("j_drafter_id")); // 	実施起案者ユーザーID

				dto.setJDrafterId(rs.getInt("k_drafter_id")); // 	契約/実施兼契約起案者ユーザーID

				dto.setDecisionType(rs.getString("decision_type")); // 決裁種類

				dto.setDecisionName(rs.getString("decision_name")); // 案件名

				dto.setJImpId(rs.getString("j_imp_id")); // 実施起案番号

				dto.setJDecId(rs.getString("j_dec_id")); // 実施決裁番号

				dto.setSummary(rs.getString("summary")); // 概要

				dto.setCause(rs.getString("cause")); // 理由・目的

				dto.setStartDay(rs.getString("start_day")); // 開始日

				dto.setEndDay(rs.getString("end_day")); // 終了日

				dto.setAmountAll(rs.getFloat("amount_all")); // 合計金額

				dto.setBenefit(rs.getFloat("benefit")); // 損益費用

				dto.setBildCost(rs.getFloat("bild_cost")); // 建設費用

				dto.setProve(rs.getInt("prove")); // 開発端末料

				dto.setRe(rs.getFloat("re")); // リリース環境使用量

				dto.setLine(rs.getInt("line")); // 回線使用料

				dto.setRoom(rs.getFloat("room")); // 施設使用料

				dto.setHuman(rs.getInt("human")); // 開発要員

				dto.setEtc(rs.getFloat("etc")); // 雑費

				dto.setPersons(rs.getInt("persons")); // 人数

				dto.setTotalProve(rs.getInt("total_prove")); // 合計開発端末料

				dto.setTotalRe(rs.getFloat("total_re")); // 合計リリース環境使用料

				dto.setTotalLine(rs.getInt("total_line")); // 合計回線使用料

				dto.setTotalRoom(rs.getFloat("total_room")); // 合計施設使用料

				dto.setTotalHuman(rs.getInt("human")); // 合計開発要員

				dto.setTotalEtc(rs.getFloat("etc")); // 合計雑費

				dto.setJPermiterId1(rs.getInt("j_permiter_id1")); // 	承認者ユーザーID1（リーダー）

				dto.setJPermiterId2(rs.getInt("j_permiter_id2")); // 	承認者ユーザーID2（リーダー）

				dto.setJPermiterId3(rs.getInt("j_permiter_id3")); // 	承認者ユーザーID3（先生）

				dto.setType(type);

				decisionList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return decisionList;

	}

	public ArrayList<DecisionDTO> selectByIds(int jDrafterId) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> nameList = new ArrayList<DecisionDTO>();
		String sql = "select * from users where user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,jDrafterId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nameList;
	}

	public ArrayList<DecisionDTO> selectByK(int kDrafterId) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> nameList = new ArrayList<DecisionDTO>();
		String sql = "select * from users where user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,kDrafterId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return KNameList;
	}


	/**
	 * 決裁手続きの情報アップデート
	 *
	 */

	public int update(String decisionName,String summary,String cause,String startDay,String endDay,int persons,int totalProve,float totalRe,int totalLine,float totalRoom,int totalHuman,float totalEtc,float benefit,float bildCost,float amountAll,int jDrafterId,int kDrafterId,int decisionId) {
		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "update decision set decision_name=?, summary=?, cause=?, start_day=?, end_day=?, persons=?, total_prove=?,total_re=?, total_line=?, total_room=?, total_human=?, total_etc=?, benefit=?, bild_cost=?, amount_all=?, j_drafter_id=? , k_drafter_id=?,where decision_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, decisionName);
			ps.setString(2, summary);
			ps.setString(3, cause);
			ps.setString(4, startDay);
			ps.setString(5, endDay);
			ps.setInt(6, persons);
			ps.setInt(7, totalProve);
			ps.setFloat(8, totalRe);
			ps.setInt(9, totalLine);
			ps.setFloat(10, totalRoom);
			ps.setInt(11, totalHuman);
			ps.setFloat(12, totalEtc);
			ps.setFloat(13, benefit);
			ps.setFloat(14, bildCost);
			ps.setFloat(15, amountAll);
			ps.setInt(16, jDrafterId);
			ps.setInt(17, kDrafterId);
			ps.setInt(18, decisionId);

            count = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(con!=null){
				try{
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		}
		return count;
		}




	/**
	 * 資料を追加するメソッド
	 * @param documentId 資料ID
	 * @param documentPath
	 * @return 成否を格納する変数
	 */
	 public int insert(String documentPath,String documentName,int decisionId){
			DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
			Connection con=db.getConnection();
			int inserted=0;
			String sql= "insert into document(document_path,document_name,decision_id)"
					+ "values(?,?,?)";

			try{
				PreparedStatement ps= con.prepareStatement(sql);
				ps.setString(1,documentPath);
				ps.setString(2,documentName);
				ps.setInt(3,decisionId);
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



	 /**
	  * 資料を削除するメソッド
	 * @param imageName
	 * @return
	 */
	public int delete(String documentName){
			DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
			Connection con = db.getConnection();
			int deleted = 0;
			String sql = "delete from document where document_name=?";

			try{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,documentName);
				deleted = ps.executeUpdate();

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
			return deleted;

		}








	public ArrayList<DecisionDTO> selectByJPermiterId1(int jPermiterId1) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> jPermiter1nameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,jPermiterId1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				jPermiter1nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jPermiter1nameList;
	}

	public ArrayList<DecisionDTO> selectByJPermiterId2(int jPermiterId2) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> jPermiter2nameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,jPermiterId2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				jPermiter2nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jPermiter2nameList;
	}

	public ArrayList<DecisionDTO> selectByJPermiterId3(int jPermiterId3) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> jPermiter3nameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,jPermiterId3);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				jPermiter3nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jPermiter3nameList;
	}

	public ArrayList<DecisionDTO> selectByKPermiterId1(int kPermiterId1) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> kPermiter1nameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,kPermiterId1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				kPermiter1nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return kPermiter1nameList;
	}

	public ArrayList<DecisionDTO> selectByKPermiterId2(int kPermiterId2) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> kPermiter2nameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,kPermiterId2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				kPermiter2nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return kPermiter2nameList;
	}

	public ArrayList<DecisionDTO> selectByKPermiterId3(int kPermiterId3) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> kPermiter3nameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,kPermiterId3);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				kPermiter3nameList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return kPermiter3nameList;
	}




	/**
     * 変更編集・遡求編集ボタン押下時メソッド  編集開始による値(変更有無・遡求有無ステータス)の更新をする為のメソッド
     * @author SOSHI AZUMA
     */
	public int updateChangeRecourse(int type, int decisionId ) {

		int count = 0;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();
		String sql ="";

			if(type == 4 || type == 5 || type == 6) {//変更編集ボタンが押された場合
					sql = "update decision set change_status = 1, decision_status = 11 where decision_id = ?";
			}
			if(type == 7) {//遡求編集ボタンが押された場合
					sql = "update decision set recourse_status = 1, decision_status = 12 where decision_id = ?";
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











