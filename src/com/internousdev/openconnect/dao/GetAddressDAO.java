package com.internousdev.openconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.dto.GetAddressDTO;
import com.internousdev.util.DBConnector;

/**
* GetAddressDAO
* サイトテーブルに接続する為のクラス
* @author MAIKI OKANO
* @since 2016/07/25
* @version 1.0
*/
public class GetAddressDAO {

	/**
	 * 抽出メソッド
	 * ログインのした際にDBからサイト情報をリスト化して抽出し、DTOに格納する
	 * @author MAIKI OKANO
	 * @return siteInfoList 抽出に成功したらSUCCESS、失敗したらERROR
	 */
	public List<GetAddressDTO> select(){
		List<GetAddressDTO> siteInfoList = new ArrayList<GetAddressDTO>();
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		try {
			String sql = "select * from site";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				GetAddressDTO dto = new GetAddressDTO();
				dto.setSiteId(rs.getInt(1));
				dto.setSiteName(rs.getString(2));
				dto.setSiteUrl(rs.getString(3));
				dto.setGenre(rs.getString(5));
				siteInfoList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		 }finally {
	            try{
	                con.close();
	            }catch(SQLException e){
	                e.printStackTrace();
	            }
	        }
		return siteInfoList;
	}
}