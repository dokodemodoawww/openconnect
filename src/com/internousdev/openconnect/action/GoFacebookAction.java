package com.internousdev.openconnect.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

import facebook4j.Facebook;
import facebook4j.FacebookFactory;
import facebook4j.auth.AccessToken;

public class GoFacebookAction  extends ActionSupport implements ServletResponseAware,ServletRequestAware {
    private static final long serialVersionUID = 1905917490952848955L;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private String appId = "615149158588201";
    private String appSecret = "00592e4a87370c659a9441937b904c65";
    private String token     = "0b17f5a55678ce98de7e55e0608434dc";

    public String execute() throws Exception {
        doGet(request, response);
        return SUCCESS;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Facebook facebook = new FacebookFactory().getInstance();
        request.getSession().setAttribute("facebook", facebook);
        facebook.setOAuthAppId(appId, appSecret);
        // Get an access token from:
        // https://developers.facebook.com/tools/explorer
        // Copy and paste it below.
        String accessTokenString = appId + "|" + token;
        AccessToken at = new AccessToken(accessTokenString);
        // Set access token.
        facebook.setOAuthAccessToken(at);

        StringBuffer callbackURL = request.getRequestURL();
        int index = callbackURL.lastIndexOf("/");
        callbackURL.replace(index, callbackURL.length(), "").append("/LoginFacebookAction");
        response.sendRedirect(facebook.getOAuthAuthorizationURL(callbackURL.toString()));
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request=request;
    }

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response=response;
    }
}