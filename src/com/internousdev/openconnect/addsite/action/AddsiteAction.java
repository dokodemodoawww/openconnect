/**
 * 
 */
package com.internousdev.openconnect.addsite.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.addsite.dao.AddsiteDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBにサイト情報を追加するためのクラス
 * @author AkitomoMiyauchi
 * @since 2017/06/19
 * @version 1.0
 */
public class AddsiteAction extends ActionSupport implements SessionAware{
	
	   private File myFile;
	   private String myFileContentType;
	   private String myFileFileName;
	   private String destPath;

/*	*//**
	 * ユーザID
	 *//*
	private int userId;*/

	/**
	 * セッション情報
	 */
	private Map<String,Object> session;

	/**
	 * タイトル名
	 * @author Akitomo Miyauchi
     * @since 2017/06/05
     * @version 1.0
     */


	private int siteId;


	private String siteName;



	private String siteUrl;




	private String picture;



	private int year;


	public String Image;


	public String execute() throws Exception {
		String result =ERROR;
		
		 /* Copy file to a safe location */
	      destPath = "/opt/tomcat8/webapps/internousdev/Upload/SiteImage/";

	      try{
	     	 System.out.println("Src File name: " + myFile);
	     	 System.out.println("Dst File name: " + myFileFileName);
	     	    	 
	     	 File destFile  = new File(destPath, myFileFileName);
	    	 FileUtils.copyFile(myFile, destFile);
	  
	      }catch(IOException e){
	         e.printStackTrace();
	      }

		int inserted=0;
		AddsiteDAO dao= new AddsiteDAO();

			inserted=dao.insert(siteName,siteUrl,myFileFileName,year);

			if(inserted>0){
				result = SUCCESS;
			}

		return result;
	}




	public int getSiteId() {
		return siteId;
	}




	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}




	public String getSiteName() {
		return siteName;
	}




	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}




	public String getSiteUrl() {
		return siteUrl;
	}




	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}




	public String getPicture() {
		return picture;
	}




	public void setPicture(String picture) {
		this.picture = picture;
	}



	/**
	 * セッション取得メソッド
	 *
	 * @author MAO ERIKSSON
	 * @return session セッション
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * セッション格納メソッド
	 *
	 * @author MAO ERIKSSON
	 * @param session
	 *            セッション
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}




	public int getYear() {
		return year;
	}




	public void setYear(int year) {
		this.year = year;
	}




	public String getImage() {
		return Image;
	}




	public void setImage(String image) {
		Image = image;
	}

	
	   public File getMyFile() {
		      return myFile;
		   }
		   public void setMyFile(File myFile) {
		      this.myFile = myFile;
		   }
		   public String getMyFileContentType() {
		      return myFileContentType;
		   }
		   public void setMyFileContentType(String myFileContentType) {
		      this.myFileContentType = myFileContentType;
		   }
		   public String getMyFileFileName() {
		      return myFileFileName;
		   }
		   public void setMyFileFileName(String myFileFileName) {
		      this.myFileFileName = myFileFileName;
		   }

}