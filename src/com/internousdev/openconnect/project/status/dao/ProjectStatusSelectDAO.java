/**
 *
 */
package com.internousdev.openconnect.project.status.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.internousdev.openconnect.project.status.dto.ProjectStatusDTO;
import com.internousdev.util.DBConnector;

/**
 * DBからリリース状況の情報を取得し表示する為のクラス
 * @author KOHEI NITABARU
 * @since 2016/09/04
 * @version 1.0
 */
public class ProjectStatusSelectDAO {

	/**
	 * 実行メソッド DBからリリース状況の情報を取得
	 * @author MINORI SUNAGAWA
	 * @param searchString
	 * @return projectStatusList
	 */
	public ArrayList<ProjectStatusDTO> select(String searchString){

		Connection con = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql").getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		ArrayList<ProjectStatusDTO> projectStatusList = new ArrayList<ProjectStatusDTO>();

		try{
			String sql = "select * from projects join project_status on projects.project_id = project_status.project_id where projects.project_name like '%" + searchString + "%'";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProjectStatusDTO dto = new ProjectStatusDTO();
				dto.setProjectId( rs.getInt( "project_id") );
				dto.setProjectName( rs.getString( "project_name") );
				try{ dto.setAEnvStart( sdf.format( rs.getDate("a_envstart") ).toString() ); }catch( Exception e ){}
				try{ dto.setAEnvEnd( sdf.format( rs.getDate("a_envend") ).toString() ); }catch( Exception e ){}
				try{ dto.setBEnvStart( sdf.format( rs.getDate("b_envstart") ).toString() ); }catch( Exception e ){}
				try{ dto.setBEnvEnd( sdf.format( rs.getDate("b_envend") ).toString() ); }catch( Exception e ){}
				try{ dto.setREnvStart( sdf.format( rs.getDate("r_envstart") ).toString() ); }catch( Exception e ){}
				try{ dto.setREnvEnd( sdf.format( rs.getDate("r_envend") ).toString() ); }catch( Exception e ){}
				dto.setAwsStatus( rs.getString( "aws_status" ) );
				dto.setNote( rs.getString( "note" ) );
				dto.setStatusId( rs.getInt( "status_id" ) );

				projectStatusList.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return projectStatusList;
	}

}
