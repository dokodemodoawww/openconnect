package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.util.db.mysql.MySqlConnector;

public class FooterInfoDAO {

	/**
	 * チャット履歴を読み込み未読の件数を返り値として渡すメソッド
	 * @param
	 * @return
	 */

	//グループ側
	public int groupInfoGet(int userId){
		int info=0;
		Connection con= new MySqlConnector("openconnect").getConnection();
		 String sql1 = "select group_id from members where user_id=? order by group_id asc";
		 String sql2 = "select message_id from messages where group_id=? and sender_id != ? order by message_id asc";
		 String sql3 = "select * from read_flg where message_id=? and user_id=?";

		 try{
			 PreparedStatement ps1 = con.prepareStatement(sql1);
			 ps1.setInt(1,userId);
			 ResultSet rs1= ps1.executeQuery();//参加してるグループIDを取得
			 while(rs1.next()){
				 PreparedStatement ps2 = con.prepareStatement(sql2);
				 ps2.setInt(1, rs1.getInt("group_id"));
				 ps2.setInt(2, userId);
				 ResultSet rs2 = ps2.executeQuery();//各グループでの自分以外の投稿のIDを取得
				 while(rs2.next()){
					 info++;
					 PreparedStatement ps3 = con.prepareStatement(sql3);
					 ps3.setInt(1,rs2.getInt("message_id"));
					 ps3.setInt(2, userId);
					 ResultSet rs3 = ps3.executeQuery();
					 while(rs3.next()){
						 info--;
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



		return info;
	}

	//トーク側
	public int talkInfoGet(int userId){
		int info=0;
		Connection con= new MySqlConnector("openconnect").getConnection();

		//相互フォローを検索
		String sqla ="select done from follow where do=?";
		String sqlb= "select * from follow where do=? and done = ?";
		try{
			PreparedStatement psa = con.prepareStatement(sqla);//フォロー一覧を取得
			psa.setInt(1,userId);
			ResultSet rsa = psa.executeQuery();
			while(rsa.next()){
				PreparedStatement psb = con.prepareStatement(sqlb);//その人にフォローされてるか確認
				psb.setInt(1,rsa.getInt("done"));
				psb.setInt(2, userId);
				ResultSet rsb = psb.executeQuery();
				while(rsb.next()){
		//検索ここまで
					 String sql1 = "select message_id from messages where sender_id=? and receiver_id = ? order by message_id asc";
					 String sql2 = "select * from read_flg where message_id=? and user_id=?";

					 PreparedStatement ps1 = con.prepareStatement(sql1);
					 ps1.setInt(1, rsa.getInt("done"));
					 ps1.setInt(2, userId);
					 ResultSet rs1 =ps1.executeQuery();//相手の投稿のIDを取得
					 while(rs1.next()){
						 info++;
						 PreparedStatement ps2 = con.prepareStatement(sql2);
						 ps2.setInt(1, rs1.getInt("message_id"));
						 ps2.setInt(2,userId);
						 ResultSet rs2 = ps2.executeQuery();
						 while(rs2.next()){
							 info--;
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
		return info;
	}
}
