package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.MessageDTO;
import com.internousdev.bulletinboard.dto.UserDTO;
import com.internousdev.util.db.mysql.MySqlConnector;

public class GroupDAO {

	/**
	 * グループ一覧をリスト化するメソッド
	 * @param userId
	 * @return
	 */
	  public ArrayList<MessageDTO> groupGet(int userId){
		  Connection con = new MySqlConnector("openconnect").getConnection();
		  Connection con2 = new MySqlConnector("openconnect").getConnection();
		  ArrayList<MessageDTO> groupList = new ArrayList<MessageDTO>();

		  String sql = "select * from members join groups on members.group_id=groups.group_id where user_id=?";
		  String sql2 = "select * from messages where group_id=? order by message_id desc limit 1";
		  String sql3 = "select * from messages where group_id=? and sender_id != ? order by message_id desc";
		  String sql4 = "select * from read_flg where message_id=? and user_id=?";

		  try{
		    	PreparedStatement ps = con.prepareStatement(sql);
		    	ps.setInt(1,userId);

		    	ResultSet rs = ps.executeQuery();
		    	while(rs.next()){
		    		MessageDTO dto = new MessageDTO();
		    		dto.setGroupId(rs.getInt("group_id"));
		    		dto.setGroupIcon(rs.getString("group_icon"));
		    		dto.setGroupName(rs.getString("group_name"));
		    		groupList.add(dto);

		    		PreparedStatement ps2 = con.prepareStatement(sql2);
			    	ps2.setInt(1,dto.getGroupId());
			    	ResultSet rs2 = ps2.executeQuery();
			    	while(rs2.next()){
			    		dto.setText(rs2.getString("text"));
			    		dto.setCreatedAt(rs2.getString("created_at"));
			    	}
			    	PreparedStatement ps3 = con2.prepareStatement(sql3);
			    	ps3.setInt(1,dto.getGroupId());
			    	ps3.setInt(2,userId);
			    	ResultSet rs3 = ps3.executeQuery();
			    	while(rs3.next()){
			    		dto.setNotRead(dto.getNotRead()+1);
			    		PreparedStatement ps4 = con.prepareStatement(sql4);
			    		ps4.setInt(1,rs3.getInt("message_id"));
			    		ps4.setInt(2, userId);
			    		ResultSet rs4 = ps4.executeQuery();
			    		while(rs4.next()){
			    			dto.setNotRead(dto.getNotRead()-1);
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
		     return groupList;
		  }



	/**
	 * グループマスターにグループを追加するメソッド
	 * @param userId
	 * @param groupName
	 * @return
	 */
	public int groupmasterAdd(String groupName){
		int inserted = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "insert into groups (group_name) values (?)";

		try{
	    	PreparedStatement ps = con.prepareStatement(sql);
	    		ps.setString(1,groupName);

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

	/**
	 * グループ情報にグループID、投稿情報に「グループを新設しました」とインサートするメソッド
	 * @param userId
	 * @param groupName
	 * @return
	 */
	public int createGroup(int userId, String groupName){
		int inserted = 0;
		int groupId = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "select group_id from groups where group_name=? order by created_at desc limit 1";
		String sql2 = "insert into members (user_id,group_id) values (?,?)";
		String sql3 = "insert into messages (sender_id,group_id,text) values (?,?,?)";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, groupName);
			ResultSet rs = ps.executeQuery();
	    	while(rs.next()){
	    		groupId = rs.getInt("group_id");
	    	}
	    		PreparedStatement ps2 = con.prepareStatement(sql2);
	    		ps2.setInt(1, userId);
	    		ps2.setInt(2, groupId);

	    		inserted = ps2.executeUpdate();
	    		PreparedStatement ps3 = con.prepareStatement(sql3);
	    		ps3.setInt(1, userId);
	    		ps3.setInt(2, groupId);
	    		ps3.setString(3, "グループを新設しました");


	    		inserted = ps3.executeUpdate();
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
	 * すでにグループに入っている人を除外した、フォローしている人のリストを作成するメソッド
	 * @param userId
	 * @return
	 */
	public ArrayList<UserDTO> followGet(int userId, int groupId){
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "select * from follow where do=? and not exists(select user_id from members where group_id =? and members.user_id=follow.done)";
		String sql2 = "select * from users where user_id=?";


		  try{
		    	PreparedStatement ps = con.prepareStatement(sql);
		    	ps.setInt(1,userId);
		    	ps.setInt(2, groupId);

		    	ResultSet rs = ps.executeQuery();
		    	while(rs.next()){
		    		UserDTO dto = new UserDTO();
		    		dto.setUserId(rs.getInt("done"));
		    		userList.add(dto);
		    		if(userList.size()!=0){
			    		PreparedStatement ps2 = con.prepareStatement(sql2);
				    	ps2.setInt(1,dto.getUserId());
				    	ResultSet rs2 = ps2.executeQuery();
				    	while(rs2.next()){
				    		dto.setUserName(rs2.getString("user_name"));
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
		     return userList;
		  }

	/**
	 * もしグループマスター情報のインサートには成功したが、グループ情報のインサートに失敗した場合、
	 * インサートしたグループマスター情報を削除するメソッド
	 * @param groupName
	 * @return
	 */
	public int groudmasterDelete(String groupName){
		int deleted = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "delete from groups where group_name = ? order by created_at desc limit 1";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, groupName);
			deleted = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleted;
	}


/*	*//**
	 * グループが重複してないかを確認するメソッド
	 * @param groupName
	 * @return
	 *//*
	public boolean selectGroups(String groupName){
		Connection con = new MySqlConnector("openconnect").getConnection();
		ArrayList<PostDTO> groupMasterList = new ArrayList<PostDTO>();
		ArrayList<PostDTO> contentsList = new ArrayList<PostDTO>();
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();

		String sql = "select * from groups where group_name = ?";
		String sql2 = "select text from messages where group_id = ?";
		String sql3 = "select * from members where group_id = ?";

		  try{
		    	PreparedStatement ps = con.prepareStatement(sql);
		    	ps.setString(1,groupName);

		    	ResultSet rs = ps.executeQuery();
		    	while(rs.next()){
		    		PostDTO dto = new PostDTO();
		    		dto.setGroupId(rs.getInt("group_id"));
		    		groupMasterList.add(dto);
			    	}
		    	//同じ名前のグループが1つ以上あるか
		    	if(groupMasterList.size() >= 1){
		    		PreparedStatement ps2 = con.prepareStatement(sql2);
			    	ps2.setInt(1,groupMasterList.get(0).getGroupId());
			    	ResultSet rs2 = ps2.executeQuery();
			    	while(rs2.next()){
			    		PostDTO dto2 = new PostDTO();
			    		dto2.setPostContents(rs2.getString("text"));
			    		contentsList.add(dto2);
			    	}
			    	if(contentsList.size() == 1){
			    		PreparedStatement ps3 = con.prepareStatement(sql3);
				    	ps3.setInt(1,groupMasterList.get(0).getGroupId());
				    	ResultSet rs3 = ps3.executeQuery();
				    	while(rs3.next()){
				    		UserDTO dto3 = new UserDTO();
				    		dto3.setUserId(rs3.getInt("user_id"));
				    		userList.add(dto3);
				    	}
			    		if(userList.size() == 1){
			    			groupList = groupMasterList;
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
		     return groupList;
		  }*/

	/**
	 * メンバー情報をインサートするメソッド
	 * @param groupId
	 * @param memberList
	 * @return
	 */
	public int memberAdd(int groupId, ArrayList<Integer> memberList){
		int inserted = 0;
		int[] intMemberList = new int[memberList.size()];
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "insert into members(user_id,group_id) values(?,?)";

		try{
	    	PreparedStatement ps = con.prepareStatement(sql);
	    	for(int i = 0;i<memberList.size();i++){
	    		intMemberList[i] = memberList.get(i);
	    		ps.setInt(1, intMemberList[i]);
	    		ps.setInt(2, groupId);
	    		inserted= ps.executeUpdate();
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

	/**
	 * メンバー追加時「○○さんを追加しました」と表示させるメソッド
	 * @param groupId
	 * @param memberList
	 * @param userId
	 * @return
	 */
	public int memberPost(int groupId, ArrayList<Integer> memberList, int userId){
		int inserted = 0;
		String names = "";
		int[] intMemberList = new int[memberList.size()];
		Connection con = new MySqlConnector("openconnect").getConnection();
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();

		String sql = "select * from users where user_id=?";
		String sql2 = "insert into messages(sender_id,group_id,text) values(?,?,?)";

		  try{
		    	PreparedStatement ps = con.prepareStatement(sql);
		    	for(int i = 0;i<memberList.size();i++){
		    		intMemberList[i] = memberList.get(i);
		    		ps.setInt(1, intMemberList[i]);
			    	ResultSet rs = ps.executeQuery();
			    	while(rs.next()){
			    		UserDTO dto = new UserDTO();
			    		dto.setUserId(rs.getInt("user_id"));
			    		dto.setUserName(rs.getString("user_name"));
			    		userList.add(dto);
				    	}
			    	names += userList.get(i).getUserName()+"さん";
			    	if(i != (memberList.size()-1)){
			    		names += "、";
			    	}
		    	}
		    	PreparedStatement ps2 = con.prepareStatement(sql2);
		    	ps2.setInt(1, userId);
		    	ps2.setInt(2, groupId);
		    	ps2.setString(3, names+"をグループに追加しました");

		    	inserted= ps2.executeUpdate();

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
	 * メンバーをグループから削除するメソッド
	 * @param userId
	 * @param groupId
	 * @return
	 */
	public int memberRemove(int userId, int groupId){
		int deleted = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "delete from members where user_id = ? and group_id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, groupId);
			deleted = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleted;
	}

	public int memberRemoveSend(int userId, int groupId){
		int inserted = 0;
		Connection con = new MySqlConnector("openconnect").getConnection();

		String sql = "insert into messages(sender_id,group_id,text) values(?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, groupId);
			ps.setString(3, "グループから脱退しました");
			inserted = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return inserted;
	}


}