package com.internousdev.openconnect.students.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.util.DBConnector;

/**
 * DBの情報から受講生情報を削除する為のDAOクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class StudentsDeleteDAO2 {

    /**
     * 実行メソッド DBから受講生の情報を削除
    * @param users_id
    * @return count
    */
    public int delete2(String month) {
        int count = 0;
        DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
                "mysql");
        Connection con = db.getConnection();
        String sql = "update users set userdel_flg=true where month = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, month);
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
