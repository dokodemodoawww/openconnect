/**
 *
 */
package com.internousdev.openconnect.books.action;

import java.util.ArrayList;

import com.internousdev.openconnect.books.dao.BooksDAO;
import com.internousdev.openconnect.books.dto.BooksDTO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 書籍名を、DBのプロジェクト名から検索する為のクラス
 * @author TATSUYA HOSHI, SOSHI AZUMA
 */
public class BooksSelectAction extends ActionSupport {
	/**
	 * シリアルバージョンID
	 */
	private static final long serialVersionUID = -75847044350L;
	/**
	 * サーチ
	 */
	private String search = "";
	/**
	 * サーチリスト
	 */
	private ArrayList<BooksDTO> searchList = new ArrayList<BooksDTO>();
	/**
	 * ブックリスト
	 */
	private ArrayList<BooksDTO> bookList = new ArrayList<BooksDTO>();



	/**
	 * エラーメッセージ
	 */
	private String resultSelect;

	/**
	 *	ページネーションする全体のページ数
	 */
	private int pageCount;

	/**
	 *	ページネーションする全体のページ数の配列
	 */
	private int[] arrayPageCount;

	/**
	 *	ページネーションでの現在のページ
	 */
	private int currentPage;

	/**
	 *	1ページに表示する上限(初期値20コ分)
	 */
	private int pageLimit = 20;

	/**
	 *	ページネーションの左側のボタンの数
	 */
	private int leftPage;

	/**
	 *	ページネーションの右側のボタンの数
	 */
	private int rightPage;




	/**
	 * DAOに入力されたデータを渡して、結果を返す
	 * @return result データベースに格納できたらSUCCESS、失敗したらERROR
	 */
	public String execute() {
		String result = ERROR;
		BooksDAO dao = new BooksDAO();

		if(search != null || search != null) {

			bookList = dao.select(search);



			pageCount = bookList.size()/pageLimit;
			if(bookList.size()%pageLimit != 0){
				pageCount++;
			}
			arrayPageCount =new int[pageCount];
			for(int i=0;i<pageCount;i++){
				arrayPageCount[i] = i+1;
			}
			int rowNumber = pageLimit * currentPage;
			for(int j=0 ; j < bookList.size() ; j++){
				if( j >= rowNumber){
					BooksDTO dto = bookList.get(j);
					searchList.add(dto);
				}
				if( searchList.size()==pageLimit){
					break;
				}
			}
			if(currentPage==pageCount-1){
				leftPage=4;
				rightPage=0;
			}else if(currentPage==pageCount-2){
				leftPage=3;
				rightPage=1;
			}else if(currentPage==0){
				leftPage=0;
				rightPage=4;
			}else if(currentPage==1){
				leftPage=1;
				rightPage=3;
			}else{
				leftPage=2;
				rightPage=2;
			}


			result = SUCCESS;
		} if (searchList.size() == 0) {
			resultSelect = "該当する書籍は存在しません";
		}

		return result;
	}


	/**
	 * 検索取得メソッド
	 * @return search
	 */
	public String getSearch() {
		return search;
	}
	/**
	 * 検索設定メソッド
	 * @param search
	 */
	public void setSearch(String search) {
		this.search = search;
	}
	/**
	 * 検索リスト取得メソッド
	 * @return searchList
	 */
	public ArrayList<BooksDTO> getSearchList() {
		return searchList;
	}
	/**
	 * 検索リスト設定メソッド
	 * @param searchList
	 */
	public void setSearchList(ArrayList<BooksDTO> searchList) {
		this.searchList = searchList;
	}

	/**
	* 取得メソッド を取得
	* @return bookList
	*/
	public ArrayList<BooksDTO> getBookList() {
		return bookList;
	}
	/**
	* 設定メソッド を設定
	* @param bookList
	*/
	public void setBookList(ArrayList<BooksDTO> bookList) {
		this.bookList = bookList;
	}
	/**
	 * エラーメッセージ取得メソッド
	 * @return resultSelect
	 */
	public String getResultSelect() {
		return resultSelect;
	}
	/**
	 * エラーメッセージ設定メソッド
	 * @param resultSelect
	 */
	public void setResultSelect(String resultSelect) {
		this.resultSelect = resultSelect;
	}


	/**
	 * ページネーションする全体のページ数取得メソッド
	 * @return pageCount　ページネーションする全体のページ数
	 */
	public int getPageCount() {
		return pageCount;
	}

	/**
	 * ページネーションする全体のページ数格納メソッド
	 * @param pageCount セットする pageCount
	 */
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	/**
	 * ページネーションする全体のページ数の配列取得メソッド
	 * @return arrayPageCount　ページネーションする全体のページ数の配列
	 */
	public int[] getArrayPageCount() {
		return arrayPageCount;
	}

	/**
	 * ページネーションする全体のページ数の配列格納メソッド
	 * @param arrayPageCount セットする arrayPageCount
	 */
	public void setArrayPageCount(int[] arrayPageCount) {
		this.arrayPageCount = arrayPageCount;
	}

	/**
	 * ページネーションでの現在のページ取得メソッド
	 * @return currentPage　ページネーションでの現在のページ
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * ページネーションでの現在のページ格納メソッド
	 * @param currentPage セットする currentPage
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * 1ページに表示する上限取得メソッド
	 * @return pageLimit　1ページに表示する上限
	 */
	public int getPageLimit() {
		return pageLimit;
	}

	/**
	 * 1ページに表示する上限格納メソッド
	 * @param pageLimit セットする pageLimit
	 */
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	/**
	 * ページネーションの左側のボタンの数取得メソッド
	 * @return leftPage　ページネーションの左側のボタンの数
	 */
	public int getLeftPage() {
		return leftPage;
	}

	/**
	 * ページネーションの左側のボタンの数格納メソッド
	 * @param leftPage セットする leftPage
	 */
	public void setLeftPage(int leftPage) {
		this.leftPage = leftPage;
	}

	/**
	 * ページネーションの右側のボタンの数取得メソッド
	 * @return rightPage　ページネーションの右側のボタンの数
	 */
	public int getRightPage() {
		return rightPage;
	}

	/**
	 * ページネーションの右側のボタンの数格納メソッド
	 * @param rightPage セットする rightPage
	 */
	public void setRightPage(int rightPage) {
		this.rightPage = rightPage;
	}

}
