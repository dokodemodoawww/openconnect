package com.internousdev.openconnect.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * DBのに受講生情報を追加する為のDAOクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class StudentsInsertDAO {

    /**
     * 実行メソッド DBに受講生の情報を追加
     * @param password
     * @param familyName
     * @param givenName
     * @param familyNameKanji
     * @param givenNameKanji
     * @param phoneEmail
     * @param sex
     * @param userFlg
     * @param year
     * @param month
     * @return count
     */
    public int insert(String password, String familyName, String givenName, String familyNameKanji,
            String givenNameKanji, String phoneEmail, String sex, int userFlg, String year, String month) {
        int count = 0;
        DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
                "mysql");
        Connection con = db.getConnection();
        String sql = "INSERT INTO users( password, family_name, given_name, family_name_kanji, given_name_kanji, phone_email, sex, user_flg, year, month )"
                + "VALUES(?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, familyName);
            ps.setString(3, givenName);
            ps.setString(4, familyNameKanji);
            ps.setString(5, givenNameKanji);
            ps.setString(6, phoneEmail);
            ps.setString(7, sex);
            ps.setInt(8, userFlg);
            ps.setString(9, year);
            ps.setString(10, month);

            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }
}