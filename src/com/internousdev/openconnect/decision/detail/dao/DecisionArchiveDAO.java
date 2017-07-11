/**
 *
 */
package com.internousdev.openconnect.decision.detail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.decision.dto.DecisionDTO;
import com.internousdev.util.DBConnector;

/**
 * 完了済み決済画面に表示したい内容を、DBから取り出しDTOへ転送する為のクラス
 * @author ShouheiKato
 * @since 2017/06/30
 *
 */
public class DecisionArchiveDAO {

	/**
	 * 検索結果情報をリスト化して抽出し、DTOに格納する
	 */
	public ArrayList<DecisionDTO> archiveList =new ArrayList<DecisionDTO>();

	/**
	 * 表示メソッド  表示したい内容を、DBから取り出しDTOへ転送する為のメソッド
	 */
	public ArrayList<DecisionDTO> archive(int decisionId, String projectName, String decisionType) {

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();

		String sql ="select projects.project_name, decision.decision_id, decision.decision_type from projects left outer join decision on projects.project_id = decision.decision_id";

		try {

			PreparedStatement ps = null;
			ps = con.prepareStatement(sql);
			ps.setInt(1, decisionId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				DecisionDTO dto = new DecisionDTO();
				dto.setDecisionId(rs.getInt("decision_id"));
				dto.setProjectName(rs.getString("project_name"));
				dto.setDecisionType(rs.getString("decision_type"));

				archiveList.add(dto);
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

		return archiveList;
	}


}
