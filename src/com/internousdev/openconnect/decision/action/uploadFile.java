/**
 *
 */
package com.internousdev.openconnect.decision.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author internousdev
 *
 */
/**
 * サーバーにファイルをアップデートするクラス
 * @author Akitomo MIyauchi
 * @since 2017/06/22
 * @version 1.0
 */
public class uploadFile extends ActionSupport{
   private File myFile;
   private String myFileContentType;
   private String myFileFileName;
   private String destPath;

   public String execute()
   {
      /* Copy file to a safe location */
      destPath = "/opt/tomcat8/webapps/openconnect/file_up/";

      try{
     	 System.out.println("Src File name: " + myFile);
     	 System.out.println("Dst File name: " + myFileFileName);

     	 File destFile  = new File(destPath, myFileFileName);
    	 FileUtils.copyFile(myFile, destFile);

      }catch(IOException e){
         e.printStackTrace();
         return ERROR;
      }

      return SUCCESS;
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


