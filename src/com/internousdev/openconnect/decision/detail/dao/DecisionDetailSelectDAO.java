/**
 *
 */
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
 * 画面に検索結果を表示する為のクラス
 * @author TATUHUMI ITOU, SOSHI AZUMA
 * @since 2016/09/04
 * @version 1.0
 */
public class DecisionDetailSelectDAO {


	/**
	 * DAOに入力されたデータを元に検索を行いその結果をDTOに転送するメソッド
	 * 他プロジェクトを呼び出す専用
	 * @author TATUHUMI ITOU, SOSHI AZUMA
	 */
	public List<DecisionDetailDTO> selectAnotherD( String searchString, int userId, int userId1 ){

		Connection con = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();

		String sql = "select * from decision inner join projects on decision.project_id = projects.project_id "
				+"where decision_status != 7 and ( manager_id != ? and sub_manager_id != ? ) and project_name LIKE '%" + searchString + "%'";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		List<DecisionDetailDTO> decisionDetailList1 = new ArrayList<DecisionDetailDTO>();

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, userId1);

			ResultSet rs = ps.executeQuery();

			while( rs.next() ){
				DecisionDetailDTO dto = new DecisionDetailDTO();
				dto.setDecisionId(rs.getInt("decision_id"));
				dto.setProjectName(rs.getString("project_name"));
				dto.setDecisionType(rs.getString("decision_type"));
				dto.setDecisionStatus(rs.getInt("decision_status"));
				dto.setPermitStatus(rs.getInt("permit_status"));
				dto.setChangeStatus(rs.getInt("change_status"));
				dto.setRecourseStatus(rs.getInt("recourse_status"));
				dto.setJPermiterId1(rs.getInt("j_permiter_id1"));
				dto.setKPermiterId1(rs.getInt("k_permiter_id1"));
				dto.setKPermiterId3(rs.getInt("k_permiter_id3"));
				try { dto.setJApplyDay(sdf.format(rs.getDate("j_apply_day")).toString()); }catch(Exception e){}
				try { dto.setKApplyDay(sdf.format(rs.getDate("k_apply_day")).toString()); }catch(Exception e){}
				try { dto.setSApplyDay(sdf.format(rs.getDate("s_apply_day")).toString()); }catch(Exception e){}

				decisionDetailList1.add( dto );
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}

		return decisionDetailList1 ;
	}


	/**
	 * DAOに入力されたデータを元に検索を行いその結果をDTOに転送するメソッド
	 * ログイン中ユーザーの自プロジェクトを呼び出す専用
	 * @author TATUHUMI ITOU, SOSHI AZUMA
	 */
	public List<DecisionDetailDTO> selectMyD( int userId, int userId1 ){

		Connection con = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();

		String sql = "select * from decision inner join projects on decision.project_id = projects.project_id "
				+"where decision_status != 7 and ( manager_id = ? or sub_manager_id = ? )";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		List<DecisionDetailDTO> decisionDetailList2  = new ArrayList<DecisionDetailDTO>();


		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, userId1);

			ResultSet rs = ps.executeQuery();

			while( rs.next() ){
				DecisionDetailDTO dto = new DecisionDetailDTO();
				dto.setDecisionId(rs.getInt("decision_id"));
				dto.setProjectName(rs.getString("project_name"));
				dto.setDecisionType(rs.getString("decision_type"));
				dto.setDecisionStatus(rs.getInt("decision_status"));
				dto.setPermitStatus(rs.getInt("permit_status"));
				dto.setChangeStatus(rs.getInt("change_status"));
				dto.setRecourseStatus(rs.getInt("recourse_status"));
				dto.setJDrafterId(rs.getInt("j_drafter_id"));
				dto.setKDrafterId(rs.getInt("k_drafter_id"));
				dto.setJImpId(rs.getString("j_imp_id"));
				dto.setKImpId(rs.getString("k_imp_id"));
				dto.setJkImpId(rs.getString("jk_imp_id"));
				dto.setJDecId(rs.getString("j_dec_id"));
				dto.setKPermiterId3(rs.getInt("k_permiter_id3"));
				dto.setSPermiterId(rs.getInt("s_permiter_id"));
				//dto.setSApplyDay(rs.getString("s_apply_day"));
				try { dto.setJApplyDay(sdf.format(rs.getDate("j_apply_day")).toString()); }catch(Exception e){}
				try { dto.setSApplyDay(sdf.format(rs.getDate("s_apply_day")).toString()); }catch(Exception e){}

				decisionDetailList2.add( dto );
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}

		return decisionDetailList2;
	}


	/**
	 * DAOに入力されたデータを元に検索を行いその結果をDTOに転送するメソッド
	 * ログイン中ユーザーの決裁未着手の自プロジェクトを呼び出す専用
	 * @author SOSHI AZUMA
	 */
 	public List<DecisionDetailDTO> selectBeginP(int userId, int userId1){
		Connection con = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();

		String sql = "select * from projects left outer join decision on projects.project_id = decision.project_id "
				+"where decision_id is null and ( manager_id = ? or sub_manager_id = ? )";

		List<DecisionDetailDTO> decisionBeginList = new ArrayList<DecisionDetailDTO>();

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, userId1);

			ResultSet rs = ps.executeQuery();

			while( rs.next() ){
				DecisionDetailDTO dto = new DecisionDetailDTO();

				dto.setProjectId(rs.getInt("project_id"));
				dto.setProjectName(rs.getString("project_name"));
				dto.setManagerId(rs.getInt("manager_id"));
				dto.setSubManagerId(rs.getInt("sub_manager_id"));
				dto.setDecisionId(rs.getInt("decision_id"));

				decisionBeginList.add( dto );
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}

		return decisionBeginList ;
	}





 	/**
	 * DBの終了日を取り出し今日の日付と比較し、その結果をDTOに転送するメソッド
	 * @author SOSHI AZUMA
	 */
 	public DecisionDetailDTO selectCompareDay(int userId, int userId1){
		Connection con = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();

		String sql = "select end_day from decision inner join projects on decision.project_id = projects.project_id where ( end_day < now() ) and ( manager_id = ? or sub_manager_id = ? )";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		DecisionDetailDTO dto = new DecisionDetailDTO();

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, userId1);

			ResultSet rs = ps.executeQuery();

			while( rs.next() ){

				//end_day(終了日)を過ぎた場合に値が入る
				try { dto.setEndDay(sdf.format(rs.getDate("end_day")).toString()); }catch(Exception e){}


			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}

		return dto;
	}


}
