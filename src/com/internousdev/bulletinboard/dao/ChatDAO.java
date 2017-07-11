package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.MessageDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

/**
 * チャット取得、格納に関するクラス
 * @author Ryo Maeda
 * @since 2017/06/05
 * @version 1.0
 *
 */
public class ChatDAO {
	/*
	 * チャット読み込み用のコンストラクタ(ユーザーId,相手のId,グループId）
	 */
	public ChatDAO(){
	}
	  public ArrayList<MessageDTO> selectChat(int senderId, int receiverId, int groupId){
		    Connection con = new MySqlConnector("openconnect").getConnection();
		    ArrayList<MessageDTO> chat = new ArrayList<MessageDTO>();

		    int k=0;
		    String sql;
		    String sql2="select * from read_flg where message_id=? and user_id=?";
		    String sql3="insert into read_flg values(?,?)";

		    if(groupId !=0){
		    	 sql = "select * from users join messages on users.user_id=messages.sender_id where group_id=? order by created_at asc";
		    	 k=1;
		    }
		    else if(receiverId != 0){
		    	sql = "select * from users join messages on users.user_id=messages.sender_id where (sender_id=? or receiver_id=?) and (sender_id=? or receiver_id=?) order by created_at asc";
		    	k=2;
		    }
		    else{sql="";}

		    try{
		    	PreparedStatement ps = con.prepareStatement(sql);

		    	if(k==1){
		    		ps.setInt(1,groupId);
		    	}
		    	if(k==2){
		    		ps.setInt(1,senderId);
		    		ps.setInt(2,senderId);
		    		ps.setInt(3,receiverId);
		    		ps.setInt(4,receiverId);

		    	}
		    	ResultSet rs = ps.executeQuery();
		    	while(rs.next()){
		    		MessageDTO dto = new MessageDTO();
		    		dto.setMessageId(rs.getInt("message_id")); //投稿ID
		    		dto.setReceiverId(rs.getInt("receiver_id")); //受取人ID
		    		dto.setSenderId(rs.getInt("sender_id")); //送信者ID
		    		dto.setSenderName(rs.getString("user_name"));//送信者名
		    		dto.setSenderImg(rs.getString("user_icon"));//送信者画像
		    		dto.setGroupId(rs.getInt("group_id"));
		    		dto.setText(rs.getString("text")); //送信内容
		    		dto.setImg(rs.getString("img")); //添付画像
		    		if((dto.getImg())==null){
		    			dto.setImg("");
		    		}
		    		dto.setCreatedAt(rs.getString("created_at")); //投稿日時

		    		PreparedStatement ps2 = con.prepareStatement(sql2);
		    		ps2.setInt(1,dto.getMessageId());
		    		ps2.setInt(2,senderId);
		    		ResultSet rs2= ps2.executeQuery();
		    		while (rs2.next()){
		    			dto.setReadFlg(1);//既読情報
		    		}
		    		if(dto.getReadFlg()==0){//既読がついてない場合に既読をつける
		    			PreparedStatement ps3 = con.prepareStatement(sql3);
		    			ps3.setInt(1,dto.getMessageId());
		    			ps3.setInt(2,senderId);
		    			ps3.executeUpdate();
		    		}


		    		chat.add(dto);

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
		     return chat;
		  }


	  public int insertMessage(int senderId, int receiverId, int groupId, String postContents, String img){
		    Connection con = new MySqlConnector("openconnect").getConnection();

		    int inserted=0;
		    int k=0;
		    String sql="";

		    if(groupId !=0){
		    	 sql = "insert into messages (sender_id,group_id,text,img) values (?,?,?,?)";
		    	 k=1;
		    }
		    else if(receiverId != 0){
		    	sql = "insert into messages (sender_id,receiver_id,text,img) values (?,?,?,?) ";
		    	k=2;
		    }

		    try{
		    	PreparedStatement ps = con.prepareStatement(sql);

		    	if(k==1){
		    		ps.setInt(1,senderId);
		    		ps.setInt(2,groupId);
		    		ps.setString(3,postContents);
		    		ps.setString(4,img);
		    	}
		    	if(k==2){
		    		ps.setInt(1,senderId);
		    		ps.setInt(2,receiverId);
		    		ps.setString(3,postContents);
		    		ps.setString(4,img);
		    	}
		    	inserted= ps.executeUpdate();

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

}
