package com.internousdev.openconnect.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.dao.GetAddressDAO;
import com.internousdev.openconnect.dto.GetAddressDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * GetAddressAction アプリ一覧画面に遷移するクラス
 *
 * @author MAIKI OKANO
 * @since 2016/07/22
 * @version 1.1
 */
public class GetAddressAction extends ActionSupport implements SessionAware {

	/**
	 * シリアルバージョンIDの生成
	 */
	private static final long serialVersionUID = -2760124519770339664L;
	/**
     * データベースに格納されているアプリリスト
     */
    private List<GetAddressDTO> siteInfoList;
    /**
     * セッション
     */
    private Map<String, Object> session;
    /**
     * ログインエラーメッセージ
     */
    private String notLoginMsg;

    /**
     * DAOからサイトリストを取得し、結果を返す
     *
     * @author MAIKI OKANO
     * @return result
     */
    public String execute(){
        String result = ERROR;
        Boolean user;

        GetAddressDAO dao = new GetAddressDAO();
        user = session.containsKey("user");

        if(user){
        	siteInfoList = dao.select();
            result = SUCCESS;

        }else
            setNotLoginMsg("ログイン後に表示します。");

        return result;
    }

    /**
     * 取得メソッド サイトリストを取得
     *
     * @author MAIKI OKANO
     * @return siteInfoList
     */
    public List<GetAddressDTO> getSiteInfoList() {
        return siteInfoList;
    }
    /**
     * 格納メソッド サイトリストを格納
     *
     * @author MAIKI OKANO
     * @param siteInfoList 格納するサイトリスト
     */
    public void setSiteInfoList(List<GetAddressDTO> siteInfoList) {
		this.siteInfoList = siteInfoList;
	}
    /**
     * 取得メソッド セッションを取得
     *
     * @author MAIKI OKANO
     * @return session 取得するセッション
     */
    public Map<String, Object> getSession() {
        return session;
    }
	/**
     * 格納メソッド セッションを格納
     *
     * @author MAIKI OKANO
     * @param session 格納するセッション
     */
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    /**
     * 取得メソッド ログインエラーメッセージを取得
     *
     * @author MAIKI OKANO
     * @return notLoginMsg 取得するログインエラーメッセージ
     */
    public String getNotLoginMsg() {
        return notLoginMsg;
    }
    /**
     * 格納メソッド ログインエラーメッセージを格納
     *
     * @author MAIKI OKANO
     * @param notLoginMsg 格納するログインエラーメッセージ
     */
    public void setNotLoginMsg(String notLoginMsg) {
        this.notLoginMsg = notLoginMsg;
    }

}
