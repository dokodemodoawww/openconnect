/**
 *
 */
package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.BotDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

/**
 * botメンテナンスページの「文章を閲覧する」に関するDAO
 * @author Misa Kikuchi
 *
 */
public class BotSearchDAO {
	/**
	 * 学習マスターをリスト化するメソッド
	 * @return 文章マスターリスト
	 */
	public ArrayList<BotDTO> mastersearch(){
		ArrayList<BotDTO> masterList = new ArrayList<BotDTO>();
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select * from word_analysis_master";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  BotDTO dto = new BotDTO();
				  dto.setSentenceId(rs.getInt("sentence_id"));
				  dto.setLabel(rs.getString("label"));
				  dto.setCreatedAt(rs.getString("created_at"));
				  masterList.add(dto);
				  }
			  }catch(SQLException e){
		    	e.printStackTrace();
		    	}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		  return masterList;
	}

	/**
	 * 文章IDから文章を取得しリスト化するメソッド
	 * @param sentenceId 文章ID
	 * @return 文章リスト
	 */
	public ArrayList<BotDTO> sentenceSearch(int sentenceId){
		ArrayList<BotDTO> masterList = new ArrayList<BotDTO>();
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select * from word_analysis where sentence_id = ?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setInt(1, sentenceId);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  BotDTO dto = new BotDTO();
				  dto.setWord(rs.getString("word"));
				  dto.setParts(rs.getString("parts"));
				  dto.setPartOfSpeech(rs.getString("part_of_speech"));
				  dto.setDictionary(rs.getBoolean("dictionary"));
				  masterList.add(dto);
				  }
			  }catch(SQLException e){
		    	e.printStackTrace();
		    	}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		  return masterList;
	}

	/**
	 * 教えた日から文章IDを取得するメソッド
	 * @param sentenceId 文章ID
	 * @return 文章リスト
	 */
	public int sentenceSearchByAt(String sentences){
		int sentenceId = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select * from word_analysis_master where created_at=?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setString(1, sentences);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  sentenceId = rs.getInt("sentence_id");
				  }
			  }catch(SQLException e){
		    	e.printStackTrace();
		    	}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		  return sentenceId;
	}

	/**
	 * ラベルから文章IDを取得するメソッド
	 * @param sentenceId 文章ID
	 * @return 文章リスト
	 */
	public int sentenceSearchByLabel(String sentences){
		int sentenceId = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select * from word_analysis_master where label = ?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setString(1, sentences);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  sentenceId = rs.getInt("sentence_id");
				  }
			  }catch(SQLException e){
		    	e.printStackTrace();
		    	}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		  return sentenceId;
	}

	/**
	 * 文章IDからラベルを取得する
	 * @param sentenceId
	 * @return
	 */
	public String labelCheck(int sentenceId){
		String label = null;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select label from word_analysis_master where sentence_id = ?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setInt(1, sentenceId);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  label = rs.getString("label");
				  }
			  }catch(SQLException e){
		    	e.printStackTrace();
		    	}finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		  return label;
	}
}
