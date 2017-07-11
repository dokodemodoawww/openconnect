package com.internousdev.openconnect.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.dao.GetAddressDAO;
import com.internousdev.openconnect.dto.GetAddressDTO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 管理者画面にてサイト情報を取得する
 * @author GENKI ARIMA
 * @author MAIKI OKANO
 * @since 2015/06/16
 * @since 2015/07/25
 * @version 1.1
 */
public class GetAddressAdminAction extends ActionSupport {
	/**
	 * シリアルバージョンIDの生成
	 */
	private static final long serialVersionUID = -375236489777102919L;
	/**
	 * サイト情報一覧
	 */
	private List<GetAddressDTO> siteInfoList = new ArrayList<GetAddressDTO>();
	/**
	 * 取得した情報をListに格納し、resultを返すメソッド
	 * @author GENKI ARIMA
	 * @since 2015/06/16
	 * @return result データベースから情報を取得できたらSUCCESS、失敗したらERROR
	 */
	public String execute(){
		String result = ERROR;
		GetAddressDAO dao = new GetAddressDAO();
			if(!(siteInfoList == null)){
				siteInfoList = dao.select();
				result = SUCCESS;
			}
		return result;
	}
	/**
	 * リスト取得メソッド
	 * @author GENKI ARIMA
	 * @since 2015/06/16
	 * @return siteInfoList 取得するサイトリスト
	 */
	public List<GetAddressDTO> getSiteInfoList() {
		return siteInfoList;
	}

}
