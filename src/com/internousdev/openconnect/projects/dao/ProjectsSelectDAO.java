package com.internousdev.openconnect.projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.projects.dto.ProjectsSelectDTO;
import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.internousdev.util.DBConnector;


/**
 * 検索したＤＢ情報をリスト化して抽出し、ＤＴＯに格納するクラス
 *
 * @author YUICHI KIRIU
 * @since 2016/09/07
 */

public class ProjectsSelectDAO {

	/**
	 * 検索したＤＢ情報をリスト化して抽出し、ＤＴＯに格納する
	 *
	 * @author YUICHI KIRIU TATUHUMI ITO
	 * @param search
	 * @return  searchList
	 */
	public List<ProjectsSelectDTO> searchList = new ArrayList<ProjectsSelectDTO>();

	public List<ProjectsSelectDTO> select(String search) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		try {
			String sql = "SELECT*FROM projects inner join users on projects.manager_id = users.user_id WHERE project_name LIKE '%" + search + "%'";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

			while (rs.next()) {
				ProjectsSelectDTO dto = new ProjectsSelectDTO();

				dto.setProjectId(rs.getInt("project_id"));
				dto.setProjectName(rs.getString("project_name"));
				try { dto.setStartDate(sdf.format(rs.getDate("start_date")).toString()); }catch(Exception e){}
				try { dto.setEndDate(sdf.format(rs.getDate("end_date")).toString()); }catch(Exception e){}
				dto.setNote(rs.getString("note"));
				dto.setManagerId(rs.getInt("manager_id"));
				dto.setSubManagerId(rs.getInt("sub_manager_id"));
				dto.setMemberNumber(rs.getInt("member_number"));
				dto.setManagerFamilyNameKanji(rs.getString("family_name_kanji"));
				dto.setManagerGivenNameKanji(rs.getString("given_name_kanji"));
				searchList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return searchList;
	}



	public ProjectsSelectDTO selectId(int userId) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		ProjectsSelectDTO dto = new ProjectsSelectDTO();
		try {
			String sql = "SELECT * FROM users  where user_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				dto.setSubManagerFamilyNameKanji(rs.getString("family_name_kanji"));
				dto.setSubManagerGivenNameKanji(rs.getString("given_name_kanji"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public ArrayList<StudentsDTO> search(String search) {
        DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
                "mysql");
        Connection con = db.getConnection();

        ArrayList<StudentsDTO> searchList = new ArrayList<StudentsDTO>();

        String sql;

        sql="select * from users";

        try {


            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

            while (rs.next()) {
                StudentsDTO dto = new StudentsDTO();
                dto.setUserId(rs.getInt("user_id"));
                dto.setPassword(rs.getString("password"));

                dto.setFamilyNameKanji(rs.getString("family_name_kanji"));
                dto.setFamilyNameKana(rs.getString("family_name_kana"));
                dto.setGivenNameKanji(rs.getString("given_name_kanji"));
                dto.setGivenNameKana(rs.getString("given_name_kana"));
                dto.setPostal(rs.getString("postal"));
                dto.setAddress(rs.getString("address"));
                dto.setPhoneNumber(rs.getString("phone_number"));
                dto.setPhoneEmail(rs.getString("phone_email"));
                dto.setMobileNumber(rs.getString("mobile_number"));
                dto.setMobileEmail(rs.getString("mobile_email"));
                dto.setSex(rs.getString("sex"));
                try {
                    dto.setBirthday(sdf.format(rs.getDate("birthday")).toString());
                } catch (Exception e) {
                }
                try {
                    dto.setRegisterDay(sdf2.format(rs.getTimestamp("register_day")).toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    dto.setUpdateDay(sdf2.format(rs.getTimestamp("update_day")).toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                dto.setUserdelFlg(rs.getBoolean("userdel_flg"));
                dto.setLoginFlg(rs.getBoolean("login_flg"));
                dto.setUserFlg(rs.getInt("user_flg"));
                dto.setYear(rs.getString("year"));
                dto.setMonth(rs.getString("month"));

                searchList.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return searchList;
    }
}



