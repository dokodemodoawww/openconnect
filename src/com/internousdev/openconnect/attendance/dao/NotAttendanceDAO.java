/**
 *
 */
package com.internousdev.openconnect.attendance.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.function.UnaryOperator;

import com.internousdev.openconnect.attendance.dto.AttendanceDTO;
import com.internousdev.util.DBConnector;

/**
 * 連絡なしをリーダーがDBに追加するクラス
 * @author Kawamura
 * @since 7/5
 * @version 1.0.0
 */
public class NotAttendanceDAO {

	/* sql文 */
	private String sql = null;
	/* ステートメント */
	private Statement statement = null;
	/* 勤怠のuserIdを格納 */
	private ArrayList<AttendanceDTO> attendanceIdList = new ArrayList<AttendanceDTO>();
	/* ユーザーのuserIdを格納 */
	private ArrayList<AttendanceDTO> usersIdList = new ArrayList<AttendanceDTO>();

	/**
	 * 勤怠状況を検索してuserIdを取得するメソッド
	 * @param atYear
	 * @param atMonth
	 * @param atDay
	 * @return attendanceIdList
	 */
	public ArrayList<AttendanceDTO> select(int atYear, int atMonth, int atDay){
		DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con =db.getConnection();

		ArrayList<AttendanceDTO> attendanceIdList = new ArrayList<AttendanceDTO>();

		/* sql文 */
		sql = "select * from attendance where at_year="+atYear+" and at_month="+atMonth+" and at_day="+atDay;


		try{
			statement = con.createStatement();
			ResultSet rs = statement.executeQuery(sql);

			while(rs.next()){
				AttendanceDTO dto = new AttendanceDTO();
				dto.setUserId(rs.getInt("user_id"));
				attendanceIdList.add(dto);
			}

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
				statement.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return attendanceIdList;
	}

	/**
	 * usersテーブルからattendanceIdListのuser_id以外とteamNameで検索するメソッド
	 * @param attendanceIdList
	 * @param teamName
	 * @return usersIdList
	 */
	public ArrayList<AttendanceDTO> select2( List<AttendanceDTO> attendanceIdList, String teamName){
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root", "mysql");
		Connection con = db.getConnection();
		String idWhereState = "";

		ArrayList<AttendanceDTO> usersIdList = new ArrayList<AttendanceDTO>();

		Function<Integer,String> gen_stateExpression = (id ) -> {
			return "user_id != " +id.toString();
		};
		for (AttendanceDTO dto: attendanceIdList){
			idWhereState += " AND ";
			idWhereState += gen_stateExpression.apply(dto.getUserId());
		}

		sql = "select * from users where team_name='"+teamName +"'" +idWhereState +";";
		System.out.println(sql);

		try{
			statement = con.createStatement();
			ResultSet rs = statement.executeQuery(sql);

			while(rs.next()){
				AttendanceDTO dto = new AttendanceDTO();
				dto.setUserId(rs.getInt("user_id"));
				usersIdList.add(dto);
			}

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
				statement.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return usersIdList;
	}

	/**
	 * 取得したuser_idをすべてinsertするメソッド
	 * @param atYear
	 * @param atMonth
	 * @param atDay
	 * @param atDate
	 * @param userId
	 * @param attendance
	 * @return ret
	 */
	public int insert(int atYear, int atMonth, int atDay, ArrayList<AttendanceDTO> usersIdList, String attendance){
		DBConnector db=new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con =db.getConnection();
		int ret = 0;

		// Util func
		UnaryOperator<String> presetIfNull = (attend) -> { return ( attend == null ? "'連絡なし'" : attend ); };

		/*
		/* valuesの後に続くsql文 */
		String valueState = "";
		Function<Integer,String> gen_stateExpr = (userId ) -> {
			String[] array = {
					Integer.toString(atYear),
					Integer.toString(atMonth),
					Integer.toString(atDay),
					Integer.toString(userId),
					presetIfNull.apply(attendance)
					};
			return "(" + String.join(",", array) +")";
		};

		for (AttendanceDTO userId : usersIdList){
			if (!valueState.equals("")){
				valueState += ",";
			}
			valueState += gen_stateExpr.apply(userId.getUserId());
		}
		/* valueStateに値が入っているとき */
		if(!((valueState).equals(""))){
			sql = "insert into attendance (at_year,at_month,at_day,user_id,attendance) values "+valueState;
			System.out.println(sql);
		}

		try{
			PreparedStatement ps = con.prepareStatement(sql);

			ret = ps.executeUpdate(sql);

		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return ret;
	}

	/**
	 * attendanceIdListを取得します。
	 * @return attendanceIdList
	 */
	public ArrayList<AttendanceDTO> getAttendanceIdList() {
		return attendanceIdList;
	}

	/**
	 * attendanceIdListを設定します。
	 * @param attendanceIdList attendanceIdList
	 */
	public void setAttendanceIdList(ArrayList<AttendanceDTO> attendanceIdList) {
		this.attendanceIdList = attendanceIdList;
	}

	/**
	 * usersIdListを取得します。
	 * @return usersIdList
	 */
	public ArrayList<AttendanceDTO> getUsersIdList() {
		return usersIdList;
	}

	/**
	 * usersIdListを設定します。
	 * @param usersIdList usersIdList
	 */
	public void setUsersIdList(ArrayList<AttendanceDTO> usersIdList) {
		this.usersIdList = usersIdList;
	}
}

