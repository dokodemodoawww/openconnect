package com.internousdev.openconnect.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.schedule.dto.ScheduleDTO;
import com.internousdev.util.DBConnector;


/**
 * スケジュール一覧をActionから受け取った検索文を検索するクラス。
 * @author MASAHIRO KEDSUKA
 * @since 2016/09/07
 */
public class ScheduleSelectDAO {

	/**
	 * リスト形式のスケジュール一覧
	 * @author MASAHIRO KEDSUKA
	 */
	public List<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();

	public List<ScheduleDTO> teamList = new ArrayList<ScheduleDTO>();


	/**
	 * スケジュール一覧を検索するメソッド。
	 * @author MASAHIRO KEDSUKA
	 * @param search
	 * @return schedulelist
	 */
	public List<ScheduleDTO> select(String search){

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn = db.getConnection();
		/*id名やtitleも含めて検索したい場合はこっち
		 * String sql = "select * from schedule where id LIKE '%" + search + "%' OR title LIKE '%" + search + "%'"
				+ " OR team_name LIKE '%" + search + "%'";*/

		/*チーム名のみで検索*/
		String sql = "SELECT * FROM schedule WHERE team_name LIKE '%" + search + "%'";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				dto.setId(rs.getInt("id"));
				try{
					dto.setStartDay(sdf.format(rs.getDate("start_day")).toString()); 
					}catch(Exception e){}
				
				try { dto.setEndDay(sdf.format(rs.getDate("end_day")).toString());
				}catch(Exception e){}
				dto.setTitle(rs.getString("title"));
				dto.setTeamName(rs.getString("team_name"));
				scheduleList.add(dto);

			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return scheduleList;

	}

	public List<ScheduleDTO> select2(){
		//全グループのリストを格納するためのメソッド
		DBConnector db2 = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn2 = db2.getConnection();
		//DISTINCTは重複したグループがあったときそれを統一するsql文
		String sql2 = "SELECT DISTINCT team_name FROM users ORDER BY team_name ASC";

		try {
			PreparedStatement ps2 = conn2.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();

			while(rs2.next()) {
				ScheduleDTO dto2 = new ScheduleDTO();
				dto2.setTeamName(rs2.getString("team_name"));
				teamList.add(dto2);

			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				conn2.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return teamList;
	}

}
