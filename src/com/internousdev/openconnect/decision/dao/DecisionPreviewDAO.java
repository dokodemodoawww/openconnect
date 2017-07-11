/**
 *
 */
package com.internousdev.openconnect.decision.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.internousdev.util.DBConnector;

/**
 * @author Hideyuki Nozawa
 * @since 2017/06/19
 * @version 1.0
 *
 */
public class DecisionPreviewDAO {

	public ArrayList<DecisionDTO> decisionPreviewList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> JNameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> KNameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> jPermiter1nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> jPermiter2nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> jPermiter3nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> kPermiter1nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> kPermiter2nameList = new ArrayList<DecisionDTO>();

	public ArrayList<DecisionDTO> kPermiter3nameList = new ArrayList<DecisionDTO>();



	public ArrayList<DecisionDTO> select(int decisionId,int type){

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");

		ArrayList<DecisionDTO> decisionPreviewList = new ArrayList<DecisionDTO>();

		String sql = "select * from decision where decision_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, decisionId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				DecisionDTO dto = new DecisionDTO();

				dto.setJDrafterId(rs.getInt("j_drafter_id")); // 	実施起案者ユーザーID

				dto.setKDrafterId(rs.getInt("k_drafter_id"));// 契約/実施兼契約起案者ID

				dto.setDecisionId(rs.getInt("decision_id")); //  決裁ID

				dto.setDecisionType(rs.getString("decision_type")); // 決裁種類

				dto.setDecisionName(rs.getString("decision_name")); // 案件名

				dto.setJImpId(rs.getString("j_imp_id")); // 実施起案番号

				dto.setJDecId(rs.getString("j_dec_id")); // 実施決裁番号

				dto.setKImpId(rs.getString("k_imp_id")); // 契約起案番号

				dto.setKDecId(rs.getString("k_dec_id")); // 契約決裁番号

				dto.setJkImpId(rs.getString("jk_imp_id")); // 実施兼契約起案番号

				dto.setJkDecId(rs.getString("jk_dec_id")); // 実施兼契約決裁番号

				dto.setSummary(rs.getString("summary")); // 概要

				dto.setCause(rs.getString("cause")); // 理由・目的

				try { dto.setJApplyDay(sdf.format(rs.getDate("j_apply_day")).toString()); }catch(Exception e){} //実施申請日（サイト上部日付）

				try { dto.setJSlashApplyDay(sdf2.format(rs.getDate("j_apply_day")).toString()); }catch(Exception e){} //実施承認者日付

				try { dto.setKApplyDay(sdf.format(rs.getDate("k_apply_day")).toString()); }catch(Exception e){} //契約申請日（サイト上部日付）

				try { dto.setKSlashApplyDay(sdf2.format(rs.getDate("k_apply_day")).toString()); }catch(Exception e){} //契約承認者日付

				dto.setSApplyDay(rs.getString("s_apply_day")); //遡求申請日（期限が終了してもプロジェクトを終えられなかった時に申請する）

				try { dto.setStartDay(sdf.format(rs.getDate("start_day")).toString()); }catch(Exception e){} // 開始日

				try { dto.setEndDay(sdf.format(rs.getDate("end_day")).toString()); }catch(Exception e){}  // 終了日

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

				dto.setJPermiterId1(rs.getInt("j_permiter_id1")); // 	実施承認者ユーザーID1（リーダー）

				dto.setJPermiterId2(rs.getInt("j_permiter_id2")); // 	実施承認者ユーザーID2（リーダー）

				dto.setJPermiterId3(rs.getInt("j_permiter_id3")); // 	実施承認者ユーザーID3（先生）

				dto.setKPermiterId1(rs.getInt("k_permiter_id1")); // 	契約/実施兼契約承認者ユーザーID1（リーダー）

				dto.setKPermiterId2(rs.getInt("k_permiter_id2")); // 	契約/実施兼契約承認者ユーザーID2（リーダー）

				dto.setKPermiterId3(rs.getInt("k_permiter_id3")); // 	契約/実施兼契約承認者ユーザーID3（先生）

				dto.setType(type);

				decisionPreviewList.add(dto);
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
		return decisionPreviewList;

	}

	public ArrayList<DecisionDTO> selectByJDrafterIds(int jDrafterId) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> jNameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,jDrafterId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				jNameList.add(dto);
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
		return jNameList;
	}

	public ArrayList<DecisionDTO> selectByKDrafterIds(int kDrafterId) {
		DecisionDTO dto = new DecisionDTO();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/",
				"openconnect", "root", "mysql");
		Connection con = db.getConnection();
		ArrayList<DecisionDTO> kNameList = new ArrayList<DecisionDTO>();
		String sql = "(select * from users where user_id=?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,kDrafterId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setFamilyNameKanji(rs.getString("family_name_kanji")); // 姓（漢字）
				dto.setGivenNameKanji(rs.getString("given_name_kanji")); // 名（漢字）
				kNameList.add(dto);
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
		return kNameList;
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

}
