package com.internousdev.bulletinboard.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.db.mysql.MySqlConnector;


public class AddImageDAO {

		/**
		 * 記事を追加するメソッド
		 * @param imgId イメージID
		 * @param imgPath
		 * @return 成否を格納する変数
		 */
		 public int insert(int userId, String userImg){
				Connection con = new MySqlConnector("openconnect").getConnection();
				int inserted = 0;
				String sql= "insert into img(user_id,user_icon) values(?,?,?)";

				try{
					PreparedStatement ps= con.prepareStatement(sql);
					ps.setInt(1, userId);
					ps.setString(2, userImg);
					inserted = ps.executeUpdate();


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

}
