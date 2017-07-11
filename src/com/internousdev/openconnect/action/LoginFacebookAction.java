package com.internousdev.openconnect.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
//import java.util.HashMap;
import java.util.Map;
//import java.util.Properties;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.simple.JSONValue;

import com.opensymphony.xwork2.ActionSupport;

public class LoginFacebookAction extends ActionSupport implements SessionAware, ServletResponseAware,ServletRequestAware {
    private static final long serialVersionUID = -3790015155289726636L;

    static final String NETWORK_NAME = "Facebook";
    public Map<String, Object> sessionMap;
//    private static final String PROTECTED_RESOURCE_URL = "https://graph.facebook.com/me";
    private HttpServletRequest request;
    private HttpServletResponse response;
    private String appId = "615149158588201";
    private String appSecret = "00592e4a87370c659a9441937b904c65";
    private Map<?, ?> me;


    public String execute() throws Exception {

        getOauthParam(request, response);
        System.out.println(String.valueOf(me.get("id")));
        sessionMap.put("service", "Facebook");
        sessionMap.put("userId", String.valueOf(me.get("id")));
        sessionMap.put("user", me.get("name"));
        request.getSession().setAttribute("loginUser", sessionMap);

        response.sendRedirect(request.getContextPath() + "/");

        return SUCCESS;
    }


    protected void getOauthParam
    (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String callbackURL = request.getRequestURL().toString();
        final String code = request.getParameter("code");
        final String accessTokenURL =
            "https://graph.facebook.com/oauth/access_token?client_id="
                + appId
                + "&redirect_uri="
                + URLEncoder.encode(callbackURL, "UTF-8")
                + "&client_secret="
                + appSecret
                + "&code="
                + URLEncoder.encode(code, "UTF-8");
        final String accessTokenResult = getHttpRequest(new URL(accessTokenURL));
        // 結果のパース
        String accessToken = null;
        String[] pairs = accessTokenResult.split("&");
        for (String pair : pairs) {
            String[] kv = pair.split("=");
            if (kv.length != 2) {
                throw new RuntimeException("Unexpected auth response");
            } else {
                if (kv[0].equals("access_token")) {
                    accessToken = kv[1];
                }
            }
        }

        /*
         * APIの実行
         */
        final String apiURL =
            "https://graph.facebook.com/me?access_token=" + URLEncoder.encode(accessToken, "UTF-8");
        final String apiResult = getHttpRequest(new URL(apiURL));
        me = (Map<?, ?>) JSONValue.parse(apiResult);
    }

    private String getHttpRequest(URL url) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setUseCaches(false);
        conn.setRequestMethod("GET");
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = null;
        String response = "";
        while ((line = reader.readLine()) != null) {
            response += line;
        }
        reader.close();
        conn.disconnect();
        return response;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request=request;
    }



    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response=response;
    }


    public Map<String, Object> getSessionMap() {
        return sessionMap;
    }


    public void setSessionMap(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }


    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
}
