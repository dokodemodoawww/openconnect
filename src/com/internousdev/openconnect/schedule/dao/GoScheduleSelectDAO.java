package com.internousdev.openconnect.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.schedule.dto.ScheduleDTO;
import com.internousdev.util.DBConnector;

public class GoScheduleSelectDAO{

	public List<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();
	public List<ScheduleDTO> teamList = new ArrayList<ScheduleDTO>();

	private int teamName;

	/*public List<ScheduleDTO> select(int userId)
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost","openconnect","root","mysql");
		Connection con = db.getConnection();
		ArrayList<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String sql = "SELECT * FROM users INNER JOIN schedule ON users.team_name = schedule.team_name WHERE users.user_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ScheduleDTO dto = new ScheduleDTO();
				dto.setId(rs.getInt("id"));
				try { dto.setStartDay(sdf.format(rs.getDate("start_day")).toString()); }catch(Exception e){}
				try { dto.setEndDay(sdf.format(rs.getDate("end_day")).toString()); }catch(Exception e){}
				dto.setTitle(rs.getString("title"));
				dto.setTeamName(rs.getString("team_name"));
				scheduleList.add(dto);
			}

			ps.close();
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return scheduleList;
	}*/


		public List<ScheduleDTO> select2(int userId){

			DBConnector db2 = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
			Connection conn2 = db2.getConnection();
			//DISTINCTは重複した情報があったときにそれを統一するsql文
			String sql = "SELECT DISTINCT team_name FROM users WHERE user_id = ?  ORDER BY team_name ASC";

			try {
				PreparedStatement ps2 = conn2.prepareStatement(sql);
				ps2.setInt(1,userId);
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


		/**
		 * scheduleListを取得します。
		 * @return scheduleList
		 */
		public List<ScheduleDTO> getScheduleList() {
		    return scheduleList;
		}


		/**
		 * scheduleListを設定します。
		 * @param scheduleList scheduleList
		 */
		public void setScheduleList(List<ScheduleDTO> scheduleList) {
		    this.scheduleList = scheduleList;
		}


		/**
		 * teamListを取得します。
		 * @return teamList
		 */
		public List<ScheduleDTO> getTeamList() {
		    return teamList;
		}


		/**
		 * teamListを設定します。
		 * @param teamList teamList
		 */
		public void setTeamList(List<ScheduleDTO> teamList) {
		    this.teamList = teamList;
		}


		/**
		 * teamNameを取得します。
		 * @return teamName
		 */
		public int getTeamName() {
		    return teamName;
		}


		/**
		 * teamNameを設定します。
		 * @param teamName teamName
		 */
		public void setTeamName(int teamName) {
		    this.teamName = teamName;
		}



}

