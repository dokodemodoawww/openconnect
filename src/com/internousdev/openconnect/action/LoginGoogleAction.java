package com.internousdev.openconnect.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.google.LoginGoogleOAuth;
import com.opensymphony.xwork2.ActionSupport;

public class LoginGoogleAction extends ActionSupport implements
ServletRequestAware, SessionAware {
    private static final long serialVersionUID = -3158008174281273068L;
    private Map<String, Object> session;
    private HttpServletRequest request;
    private String result;

    public String execute() throws Exception{
        result = ERROR;

        LoginGoogleOAuth googleOauth = new LoginGoogleOAuth();
        Map<String, String> userMap = googleOauth.getAccessToken(request);
        if (userMap == null) {
            return result;
        }
        session.put("service", "google");
        session.put("userId", String.valueOf(userMap.get("id")));
        session.put("user", userMap.get("name"));

        result = SUCCESS;
        return result;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }
}
