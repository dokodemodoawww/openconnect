package com.internousdev.bulletinboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.StampDTO;
import com.internousdev.util.db.mysql.MySqlConnector;



public class StampDAO {

	  public ArrayList<StampDTO> stampGet(int userId){

		  Connection con = new MySqlConnector("openconnect").getConnection();
		    ArrayList<StampDTO> stampList = new ArrayList<StampDTO>();

		    String sql1= "select lv from users where user_id=?";
		    String sql2="select * from stamp where lv <= ?";

		    /////////

		    try{
		    	PreparedStatement ps1 = con.prepareStatement(sql1);
		    	ps1.setInt(1,userId);
		    	ResultSet rs1 = ps1.executeQuery();
		    	while(rs1.next()){
		    		PreparedStatement ps2=con.prepareStatement(sql2);
		    		ps2.setInt(1,rs1.getInt("lv"));
		    		ResultSet rs2= ps2.executeQuery();
		    		while (rs2.next()){
		    			StampDTO dto = new StampDTO();
		    			dto.setStampId(rs2.getInt("stamp_id"));
		    			dto.setTypeId(rs2.getInt("type_id"));
		    			dto.setLv(rs2.getInt("lv"));
		    			dto.setUrl(rs2.getString("url"));
		    			stampList.add(dto);
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
		     return stampList;
		  }



}
