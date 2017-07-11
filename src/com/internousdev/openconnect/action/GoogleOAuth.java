package com.internousdev.openconnect.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.scribe.builder.ServiceBuilder;
import org.scribe.model.Token;
import org.scribe.oauth.OAuthService;

import com.opensymphony.xwork2.ActionSupport;

public class GoogleOAuth extends ActionSupport implements ServletResponseAware,ServletRequestAware{
	private static final long serialVersionUID = 9003709578956580769L;

	private static final String NETWORK_NAME = "Google";
//    private static final String PROTECTED_RESOURCE_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
    private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.profile";
    private static final Token EMPTY_TOKEN = null;
	private HttpServletResponse response;
	private HttpServletRequest request;

	public String execute() throws Exception {

		RequestToken();

		return SUCCESS;
	}

	public void RequestToken() throws IOException{



        String apiKey = "537839423978-l0guqh38qvai0urkq4vuht0tofko25rk.apps.googleusercontent.com";
        String apiSecret = "M6hOWDPIN-E8GN_uU1O8hO90";
        String callbackUrl = "http://www.internousdev.com:8080/openconnect/GoogleOAuth2.action";

        OAuthService service = new ServiceBuilder()
        						.provider(Google2Api.class)
        						.apiKey(apiKey)
        						.apiSecret(apiSecret)
        						.callback(callbackUrl)
        						.scope(SCOPE)
        						.build();

        System.out.println("=== " + NETWORK_NAME + "'s OAuth Workflow ===");
        System.out.println();




//        Token accessToken = new Token("ACCESS_TOKEN", "REFRESH_TOKEN");

            // Obtain the Authorization URL
            System.out.println("Fetching the Authorization URL...");
            String authorizationUrl = service.getAuthorizationUrl(EMPTY_TOKEN);
            System.out.println("Got the Authorization URL!");
            System.out.println("Now go and authorize Scribe here:");
            System.out.println(authorizationUrl);
            System.out.println("And paste the authorization code here");


            HttpSession session = request.getSession();
            session.setAttribute("SERVICE", service);



            System.out.println();
            response.sendRedirect(authorizationUrl);

	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;

	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;

	}



}
