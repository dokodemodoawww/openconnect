package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.PostDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

/**
 * タイムライン取得、格納に関するクラス
 *
 * @author Ryo Maeda
 * @since 2017/06/05
 * @version 1.0
 *
 */
public class TimelineDAO {
	int userId;

	public TimelineDAO(int userId) {
		this.userId = userId;
	}

	public ArrayList<PostDTO> selectTimeline() {
		Connection con = new MySqlConnector("openconnect").getConnection();
		ArrayList<PostDTO> timeline = new ArrayList<PostDTO>();


		String sql = ""
				+"SELECT p.*, re_sender_id, re_user_name, re_sns_id, re_user_icon, re_text, re_created_at FROM("
				+	"SELECT post_id, sender_id, user_name, sns_id, user_icon, text, like_count, created_at, re_post_id FROM ("
				+		"SELECT post_id, sender_id, text, like_count, created_at, re_post_id FROM posts "
				+		"WHERE sender_id IN ("
				+			"SELECT done FROM follow WHERE do = ? "
				+			"UNION "
				+			"SELECT ? AS done "
				+		")"
				+	") AS p "
				+	"INNER JOIN ( "
				+		"SELECT user_id, user_name, sns_id, user_icon FROM users "
				+		"WHERE user_id IN ("
				+			"SELECT done FROM follow WHERE do = ? "
				+			"UNION "
				+			"SELECT ? AS done "
				+		")"
				+	") AS u "
				+	"ON p.sender_id = u.user_id"
				+") AS p "
				+"LEFT JOIN ("
				+	"SELECT post_id, sender_id AS re_sender_id, user_name AS re_user_name, sns_id AS re_sns_id, "
				+	"user_icon AS re_user_icon, text AS re_text, created_at AS re_created_at FROM ("
				+		"SELECT post_id, sender_id, text, created_at FROM posts "
				+		"WHERE post_id IN ("
				+			"SELECT re_post_id FROM posts WHERE sender_id IN("
				+				"SELECT done FROM follow WHERE do = ? "
				+				"UNION "
				+				"SELECT ? AS done "
				+			")"
				+		")"
				+	") AS p "
				+	"INNER JOIN ("
				+		"SELECT user_id, user_name, sns_id, user_icon FROM users "
				+		"WHERE user_id IN ("
				+			"SELECT sender_id FROM posts WHERE post_id IN ("
				+				"SELECT re_post_id FROM posts WHERE sender_id IN("
				+					"SELECT done FROM follow WHERE do = ? "
				+					"UNION "
				+					"SELECT ? AS done "
				+				")"
				+			")"
				+		")"
				+	") AS u "
				+	"ON p.sender_id = u.user_id "
				+") AS r "
				+"ON p.re_post_id = r.post_id "
				+"ORDER BY p.post_id DESC";

		System.out.println(sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, userId);
			ps.setInt(3, userId);
			ps.setInt(4, userId);
			ps.setInt(5, userId);
			ps.setInt(6, userId);
			ps.setInt(7, userId);
			ps.setInt(8, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				LikeDAO like = new LikeDAO();
				PostDTO dto = new PostDTO();
				dto.setPostId(rs.getInt("post_id"));			// ポストID
				dto.setSenderId(rs.getInt("sender_id"));		// 投稿者のユーザーID
				dto.setText(rs.getString("text"));				// 投稿内容
//				dto.setImg(rs.getString("img"));				// 添付画像
				dto.setCreatedAt(rs.getString("created_at"));	// 投稿日時
				dto.setUserName(rs.getString("user_name")); 	// 投稿者の名前
				dto.setSnsId(rs.getString("sns_id")); 			// 投稿者のSNS用ID
				dto.setUserIcon(rs.getString("user_icon")); 		// 投稿者のアイコン
				dto.setLikeCount(rs.getInt("like_count")); 		// ポイント
				dto.setIsLiked(like.isLiked(userId, dto.getPostId()));	// いいねをしたかどうか
				dto.setRePostId(rs.getInt("re_post_id")); 		// 返信先のポストID
				if (dto.getRePostId() != 0) {
					dto.setReUserId(rs.getInt("re_sender_id"));			// 返信先のユーザーID
					dto.setReUserName(rs.getString("re_user_name"));	// 返信先の名前
					dto.setReSnsId(rs.getString("re_sns_id"));			// 返信先のSNS用ID
					dto.setReUserIcon(rs.getString("re_user_icon"));			// 返信先のアイコン
					dto.setReText(rs.getString("re_text"));				// 返信先の投稿内容
					dto.setReCreatedAt(rs.getString("re_created_at"));	// 返信先の投稿日時
				}
				timeline.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return timeline;
	}

	/**
	 * 投稿する情報をタイムライン投稿情報テーブルにインサートするメソッド
	 *
	 * @param userId
	 * @param text
	 * @param img
	 * @return
	 */
	public int insertPost(String text, int rePostId) {
		int inserted = 0;

		Connection con = new MySqlConnector("openconnect").getConnection();
		String sql = "insert into posts (sender_id, text, re_post_id) values (?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, text);
			ps.setInt(3, rePostId);

			inserted = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return inserted;
	}

	/**
	 * 投稿するとポイントが50加算するメソッド
	 *
	 * @param userId
	 * @param
	 */
	public int pointPlus(int userId) {
		int senderId = 0;

		LvDAO Lv = new LvDAO();

		Connection con = new MySqlConnector("openconnect").getConnection();
		int inserted = 0;

		String sql = "update users set point = point+20 where user_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			inserted = ps.executeUpdate();

			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// 経験値が1000以上だった場合にレベルUP
		senderId = userId;
		Lv.Lv_up(senderId);
		return inserted;

	}

	/**
	 * タイムラインの投稿を削除するメソッド
	 *
	 * @param postId
	 * @return
	 */
	public int deletePost(int postId) {
		int deleted = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "delete from posts where post_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, postId);
			deleted = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return deleted;
	}

	/**
	 * いいね情報を削除するメソッド
	 *
	 * @param postId
	 * @return
	 */
	public int deleteLike(int postId) {
		int deleted = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "delete from like_count where post_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, postId);
			deleted = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return deleted;
	}

	/**
	 * いいね情報を削除するメソッド
	 *
	 * @param postId
	 * @return
	 */

	/**
	 * 最新のタイムライン投稿情報をDTOにセットするメソッド
	 *
	 * @param userId
	 * @return
	 */
	public PostDTO selectLastPost() {
		PostDTO dto = new PostDTO();
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "select text from posts where sender_id = ? order by created_at desc limit 1";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setText(rs.getString("text"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;

	}

}
