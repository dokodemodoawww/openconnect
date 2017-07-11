/**
 *
 */
package com.internousdev.openconnect.books.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.openconnect.books.dto.BooksDTO;
import com.internousdev.util.DBConnector;
/**
 * 表示したい内容を、DBから取り出しDTOへ転送する為のクラス
 * @author TATSUYA HOSHI, SOSHI AZUMA
 */
public class BooksDAO {

	ArrayList<BooksDTO> bookList = new ArrayList<BooksDTO>();

	/**
	 * 検索結果情報をリスト化して抽出し、DTOに格納する
	 */
	ArrayList<BooksDTO> searchList = new ArrayList<BooksDTO>();



	/**
	 * 表示メソッド  表示したい内容を、DBから取り出しDTOへ転送する為のメソッド
	 */
	public ArrayList<BooksDTO> select(String search) {
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root","mysql");
		Connection con = null;
		con = db.getConnection();
		String sql = "select @num :=@num + 1 as no, books.* from (select @num := 0) as no, books where status_flg!=1";
		if (!search.equals("")) {
			sql = sql + " " + "and title like \"%" + search + "%\"";
		}
		sql = sql + " " + "order by title";

		try {

			PreparedStatement ps = null;
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();


			while (rs.next()) {
				BooksDTO dto = new BooksDTO();
				dto.setBookId(rs.getInt("book_id"));
				dto.setTitle(rs.getString("title"));
				dto.setSubTitle(rs.getString("sub_title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setPubDay(rs.getString("publish_day"));
				dto.setInitial(rs.getString("initial"));
				dto.setStatusFlg(rs.getString("status_flg"));
				dto.setRegDay(rs.getString("regist_day"));
				dto.setUpdDay(rs.getString("updated_day"));
				dto.setNo(rs.getInt("no"));


				bookList.add(dto);
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
		return bookList;
	}



	 /**
     * 更新情報を、DBへ転送し、更新する為のメソッド
     */
	public int update(String title, String subTitle, String author, String publisher, String pubDay, String statusFlg, int book_id) {

		int count = 0;
		DBConnector db = new DBConnector("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/", "openconnect", "root",
				"mysql");
		Connection con = db.getConnection();

		String sql = "UPDATE books SET title = ?, sub_title = ?, author = ?, publisher = ?, publish_day = ?, status_flg =? where book_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, subTitle);
			ps.setString(3, author);
			ps.setString(4, publisher);
			ps.setString(5, pubDay);
			ps.setString(6, statusFlg);
			ps.setInt(7, book_id);
			count =ps.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}

		return count;
	}

	/**
	 * 書籍画面から受け取ったタイトルの追加情報を、DBへ転送し、反映する為のメソッド
	 */
	public int insert(String title, String subTitle, String author, String publisher, String pubDay, String initial) {

		int count = 0 ;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn = db.getConnection();
		String sql = "INSERT INTO books(title, sub_title, author, publisher, publish_day, initial)VALUES(?, ?, ?, ?, ?, ?)";
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,title);
			ps.setString(2,subTitle);
			ps.setString(3,author);
			ps.setString(4,publisher);
			ps.setString(5,pubDay);
			ps.setString(6,initial);

			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return count;

	}



	 /**
     * 削除メソッド DBのbook_statusの情報を変更する為のメソッド
     */
	public int delete(int bookId){

		int count =0 ;

		DBConnector db = new DBConnector("com.mysql.jdbc.Driver","jdbc:mysql://localhost/","openconnect","root","mysql");
		Connection conn = db.getConnection();

		String sql = "update books set status_flg=1 where book_Id = ?";

		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bookId);
			count = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		return count;
	}



}
