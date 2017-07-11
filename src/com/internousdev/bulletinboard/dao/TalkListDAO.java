package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.MessageDTO;
import com.internousdev.util.db.mysql.MySqlConnector;


public class TalkListDAO {

	/**
	 * グループ一覧をリスト化するメソッド
	 * @param userId
	 * @return
	 */
	  public ArrayList<MessageDTO> talkGet(int userId){
		  Connection con = new MySqlConnector("openconnect").getConnection();
		  ArrayList<MessageDTO> talkList = new ArrayList<MessageDTO>();


		  //相互フォローしている人のIDを検索
		  int id=0;
		  String sql ="select * from follow where do=?";
		  String sql2 ="select * from follow where do=? and done=?";
		  try{
			  PreparedStatement ps = con.prepareStatement(sql);
			  ps.setInt(1,userId);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next()){
				  id=rs.getInt("done");
				  PreparedStatement ps2 = con.prepareStatement(sql2);
				  ps2.setInt(1,id);
				  ps2.setInt(2,userId);
				  ResultSet rs2 =ps2.executeQuery();
				  while(rs2.next()){
			//検索ここまで
					  String sql3 = "select * from follow join users on follow.done=users.user_id where do=? and done=?";//相互フォロワーのユーザー情報取得
					  String sql4 = "select * from messages where  (sender_id=? or receiver_id=?) and(sender_id=? or receiver_id=?) order by message_id desc limit 1";//ある一人とのチャット履歴最新1件を取得
					  String sql5 = "select * from messages where receiver_id=? and sender_id=? order by message_id desc";//ある一人とのチャット履歴全てを取得
					  String sql6 = "select * from read_flg where message_id=? and user_id=?";//投稿を自分が読んだ履歴を取得

					    	PreparedStatement ps3 = con.prepareStatement(sql3);
					    	ps3.setInt(1,userId);
					    	ps3.setInt(2,id);

					    	ResultSet rs3 = ps3.executeQuery();
					    	while(rs3.next()){
					    		MessageDTO dto = new MessageDTO();
					    		dto.setReceiverId(rs3.getInt("done"));
					    		dto.setGroupIcon(rs3.getString("user_icon"));
					    		dto.setGroupName(rs3.getString("user_name"));
					    		talkList.add(dto);

					    		PreparedStatement ps4 = con.prepareStatement(sql4);
						    	ps4.setInt(1,userId);
						    	ps4.setInt(2,userId);
						    	ps4.setInt(3,dto.getReceiverId());
						    	ps4.setInt(4,dto.getReceiverId());
						    	ResultSet rs4 = ps4.executeQuery();
						    	while(rs4.next()){
						    		dto.setText(rs4.getString("text"));
						    		dto.setCreatedAt(rs4.getString("created_at"));
						    	}

						    	PreparedStatement ps5 = con.prepareStatement(sql5);
						    	ps5.setInt(1,userId);
						    	ps5.setInt(2,dto.getReceiverId());
						    	ResultSet rs5 = ps5.executeQuery();
						    	while(rs5.next()){
						    		dto.setNotRead(dto.getNotRead()+1);
						    		PreparedStatement ps6 = con.prepareStatement(sql6);
						    		ps6.setInt(1,rs5.getInt("message_id"));
						    		ps6.setInt(2, userId);
						    		ResultSet rs6=ps6.executeQuery();
						    		while(rs6.next()){
						    			dto.setNotRead(dto.getNotRead()-1);
						    		}
						    	}

					    	}

				  }
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

		     return talkList;
		  }



	}