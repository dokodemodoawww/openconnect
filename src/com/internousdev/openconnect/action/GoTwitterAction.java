package com.internousdev.openconnect.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import twitter4j.TwitterException;

import com.internousdev.openconnect.twitter.TwitterRequestToken;
import com.opensymphony.xwork2.ActionSupport;

/**
 * GoTwitterAction
 * ゴーツイッターアクションクラス
 * @author 北山知輝
 * @since 2015/03/16
 * @version 1.0
 */

public class GoTwitterAction extends ActionSupport implements ServletResponseAware,ServletRequestAware{
    private static final long serialVersionUID = 3491867450777971874L;

    private String result="success";
    public Map<String, Object> sessionMap;
    private HttpServletResponse response;
    private HttpServletRequest request;

    /**
     * 実行メソッド
     * @author 北山知輝
     * @since 2015/03/16
     * @return result 結果
     */
    public String execute(){

        TwitterRequestToken a = new TwitterRequestToken();
        try {
            result=a.loginOAuth(response,request);
        } catch (TwitterException e) {

            e.printStackTrace();

        } catch (IOException e) {

            e.printStackTrace();
        }

        return result;
    }

    /**
     * レスポンス格納メソッド
     * @author 北山知輝
     * @since 2015/03/16
     * @param response httpレスポンス
     */
    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }
    /**
     * リクエスト格納メソッド
     * @author 北山知輝
     * @since 2015/03/16
     * @param request httpリクエスト
     */
    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request=request;
    }
}
