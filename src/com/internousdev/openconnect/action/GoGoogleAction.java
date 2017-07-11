package com.internousdev.openconnect.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.google.GoGoogleOAuth;
import com.opensymphony.xwork2.ActionSupport;

public class GoGoogleAction extends ActionSupport implements ServletResponseAware,ServletRequestAware,SessionAware {
    private static final long serialVersionUID = 8472024550875297219L;
    private Map<String,Object> session;
    private HttpServletResponse response;
    private HttpServletRequest request;

    public String execute()  throws Exception{
        GoGoogleOAuth googleOauth = new GoGoogleOAuth();
        if(!googleOauth.RequestToken(request,response)) {
            return ERROR;
        }
        return SUCCESS;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }
}
