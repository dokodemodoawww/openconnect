package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.BotDTO;
import com.internousdev.bulletinboard.util.BotExercise;
import com.internousdev.util.db.mysql.MySqlConnector;

/**
 * botに関するDAO
 * @author Misa Kikuchi
 * @since 2017/06/26
 * @version 1.0
 */
public class BotDAO {


/********************************************************
 *
 * 文章自動生成系のメソッド
 *
 *******************************************************/


	/**
	 * 単語がテーブルに存在するか調べるメソッド
	 * @param word 単語
	 * @return 単語のリスト
	 */
	public ArrayList<BotDTO> wordSearch(String word){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		Connection con = new MySqlConnector("bbbot").getConnection();
		String phase= "%"+ word + "%";

		String sql = "select word from word_analysis where word like ?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setString(1,phase);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  BotDTO dto = new BotDTO();
				  dto.setWord(rs.getString("word"));
				  wordList.add(dto);
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
		  return wordList;
	}


	/**
	 * 相手のタイムラインの投稿をリスト化するメソッド
	 * @param userId ユーザーID
	 * @return タイムラインの投稿内容のリスト
	 */
	public ArrayList<String> getText(int userId){
		 Connection con = new MySqlConnector("bbbot").getConnection();
		 ArrayList<String> textList = new ArrayList<String>();

		 String sql = "select text from posts where sender_id = ?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setInt(1,userId);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  String text = rs.getString("test");
				  textList.add(text);
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
		  return textList;
	}


	/**
	 * 文節がテーブルに存在するか調べるメソッド
	 * @param word 文節
	 * @return 文節のリスト
	 */
	public ArrayList<BotDTO> phaseSearch(String word){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select after_word from word_analysis where word=?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setString(1,word);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  BotDTO dto = new BotDTO();
				  dto.setWord(rs.getString("after_word"));
				  wordList.add(dto);
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
		  return wordList;
	}


/********************************************************
 *
 * 文章インサート系のメソッド
 *
 *******************************************************/


	/**
	 * ラベルに重複がないかを調べるメソッド
	 * @param label どんな文章を教えるかの説明
	 * @return 重複しなければtrue、重複したらfalse
	 */
	public boolean labelCheck(String label){
		Connection con = new MySqlConnector("bbbot").getConnection();
		String result = null;

		String sql = "select label from word_analysis_master where label=?";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setString(1,label);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  result = rs.getString("label");
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
		  if(result == null){
			  return true;
		  }else{
			  return false;
		  }
	}

	/**
	 * 学習マスターテーブルにインサートするメソッド
	 * @param label どんな文章を教えるかの説明
	 * @return 成否を判断する変数
	 */
	public int masterSet(String label){
		int inserted = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "insert into word_analysis_master(label) values(?)";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, label);
			inserted= ps.executeUpdate();
		}catch(SQLException e){
		    	e.printStackTrace();
		  }finally {
			try{
					con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return inserted;
	}

	/**
	 * ラベルから文章IDを検索する
	 * @param label どんな文章を教えるかの説明
	 * @return 文章ID
	 */
	public int sentenceIdSearch(String label){
		int sentenceId = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select sentence_id from word_analysis_master where label=?";
		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setString(1,label);
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
	 * リストをもとに、単語とその前後関係をテーブルに書き込むメソッド
	 * @return 成否を判断する変数
	 */
	public int wordSet(String sentence,int sentenceId){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		BotExercise bot = new BotExercise(sentence);
		wordList = bot.wordConbine();
		wordList = bot.wordRemover(wordList);
		wordList = bot.readingPointConbine(wordList);
		wordList = bot.bracketsConbine(wordList);
		//wordList = bot.aozoraRemover(wordList);
		int inserted = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "insert into word_analysis(sentence_id,word,parts,part_of_speech,dictionary,after_word,before_word) values(?,?,?,?,?,?,?)";

	    try{
	    	PreparedStatement ps = con.prepareStatement(sql);
	    	for(int i=0;i<wordList.size();i++){
	    		ps.setInt(1, sentenceId);
	    		ps.setString(2, wordList.get(i).getWord());
	    		ps.setString(3, wordList.get(i).getParts());
	    		ps.setString(4, wordList.get(i).getPartOfSpeech());
	    		ps.setBoolean(5, wordList.get(i).isDictionary());
	    		if(i==0){
	    			ps.setString(6, wordList.get(i+1).getWord());
	    			ps.setString(7, null);
	    		}else if((i+1)==wordList.size()){
	    			ps.setString(6, null);
	    			ps.setString(7, wordList.get(i-1).getWord());
	    		}else{
	    			ps.setString(6, wordList.get(i+1).getWord());
	    			ps.setString(7, wordList.get(i-1).getWord());
	    		}
	    		inserted = ps.executeUpdate();
	    	}


	    	ps.close();
	    }catch(SQLException e){
	    	e.printStackTrace();
	    }finally {
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	return inserted;
	}



/********************************************************
 *
 * 文章削除系のメソッド
 *
 *******************************************************/

	/**
	 * 学習テーブルから文章を削除するメソッド
	 * @param sentenceId 文章ID
	 * @return 成否を判断する変数
	 */
	public int sentenceDelete(int sentenceId){
		int deleted = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "delete from word_analysis where sentence_id=?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, sentenceId);
			deleted = ps.executeUpdate();
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

	/**
	 * 学習マスターテーブルから文章を削除するメソッド
	 * @param sentenceId 文章ID
	 * @return 成否を判断する変数
	 */
	public int masterDelete(int sentenceId){
		int deleted = 0;
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "delete from word_analysis_master where sentence_id=?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, sentenceId);
			deleted = ps.executeUpdate();
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

	/**
	 * 印象テーブルの情報をリスト化するメソッド（使ってない）
	 * @return 印象リスト
	 */
	public ArrayList<BotDTO> impressionSearch(){
		ArrayList<BotDTO> impressionList = new ArrayList<BotDTO>();
		Connection con = new MySqlConnector("bbbot").getConnection();

		String sql = "select * from word_impression";

		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				  BotDTO dto = new BotDTO();
				  dto.setWord(rs.getString("word"));
				  dto.setImpression(rs.getInt("impression"));
				  impressionList.add(dto);
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
		  return impressionList;
	}
}
