package com.internousdev.openconnect.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * DBの受講生の情報を更新する為のクラス
 * @author KOHEI NITABARU
 * @author TATSUHIRO SAITO
 * @since 2016/09/04
 * @version 1.0
 */
public class StudentsUpdateDAO {

    /**
     * 実行メソッド 受講生の情報をDBから削除
     * @author KOHEI NITABARU
     * @param userId

     * @param familyName
     * @param givenName
     * @param familyNameKanji

     * @param givenNameKanji

     * @param userFlg

     */
    public int update(String familyNameKanji,String givenNameKanji,String teamName,int userFlg,String userName,String familyNameKana,String givenNameKana,int userId) {


        DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/", "openconnect","root","mysql");
        Connection con = db.getConnection();
        int result = 0;
        String sql = "update users set family_name_kanji=?,given_name_kanji=?,team_name=?,user_flg=?,user_name=?,family_name_kana=?,given_name_kana=? where user_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, familyNameKanji);
            ps.setString(2, givenNameKanji);
            ps.setString(3, teamName);
            ps.setInt(4, userFlg);
            ps.setString(5, userName);
            ps.setString(6, familyNameKana);
            ps.setString(7, givenNameKana);
            ps.setInt(8, userId);

            result = ps.executeUpdate();
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

        return result;
    }

}
