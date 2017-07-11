/**
 *
 */
package com.internousdev.openconnect.decision.edit.dao;

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
 * @author TATUHUMI ITOU
 * @since 2016/09/04
 * @version 1.0
 */
public class DecisionEditSelectDAO {

	List<DecisionDetailDTO> decisionDetailList  = new ArrayList<DecisionDetailDTO>();
	/**
	 * 実行メソッド DAOに入力されたデータを渡して、結果を返す
	 * @author TATUHUMI ITOU
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public List<DecisionDetailDTO> select( int decisionDetailId ){
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection con = db.getConnection();

		try{
			String sql = "select*from decision_detail inner join projects on decision_detail.project_id = projects.project_id where decision_detail_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,decisionDetailId);
			ResultSet rs = ps.executeQuery();

	 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

			while( rs.next() ){

				DecisionDetailDTO dto = new DecisionDetailDTO();
				 dto.setDecisionId(rs.getInt("decision_id"));
					dto.setProjectName(rs.getString("project_name"));
					dto.setDecisionId(rs.getInt("decision_id"));
					dto.setDecisionType(rs.getString("decision_type"));
					dto.setDecisionStatus1(rs.getInt("decision_status1"));
					dto.setProjectId(rs.getInt("project_id"));
					try {dto.setDay(sdf.format(rs.getDate("day")).toString());}catch(Exception e){}
					dto.setUserId(rs.getInt("user_id"));

					dto.setSummary(rs.getString("summary"));
					dto.setCause(rs.getString("cause"));
					try {dto.setStartDay(sdf.format(rs.getDate("start_day")).toString());}catch(Exception e){}
					try {dto.setEndDay(sdf.format(rs.getDate("end_day")).toString());}catch(Exception e){}
					dto.setPlan(rs.getString("plan"));
					dto.setPersons(rs.getInt("persons"));
					dto.setPassword(rs.getString("password"));
				decisionDetailList .add( dto );
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

		return decisionDetailList ;
	}

}
