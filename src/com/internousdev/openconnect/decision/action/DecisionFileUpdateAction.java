/**
 *
 */
package com.internousdev.openconnect.decision.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.decision.dao.DecisionDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Jun kikuchi
 * @since 2017/06/08
 * @version 1.0
 */
public class DecisionFileUpdateAction extends ActionSupport implements SessionAware{

	 private File myFile;
	   private String myFileContentType;
	   private String myFileFileName;
	   private String destPath;
	/**
	 * 実施起案者ID
	 */
	private int jDrafterId;

	/**
	 * セッション情報
	 */
	private Map<String,Object> session;


	/**
	 * 起案者Id
	 */
	private int decisionId;

	/**
	 * 資料名
	 */
	private String documentName;

	/**
	 * エラーメッセージ
	 */
	public String resultString = "追加できませんでした";

	/**
	 * 資料情報を追加する
	 * @author Kota Miyazato
	 * @since 2017/06/27
	 * @version 1.0
	 */
	public String execute()throws Exception{
		String result = ERROR;

		 /* Copy file to a safe location */
	      destPath = "C:/Users/internousdev.U103163798/Desktop/";

	      try{
	     	 System.out.println("Src File name: " + myFile);
	     	 System.out.println("Dst File name: " + myFileFileName);

	     	 File destFile  = new File(destPath, myFileFileName);
	    	 FileUtils.copyFile(myFile, destFile);

	      }catch(IOException e){
	         e.printStackTrace();
	      }
			int inserted=0;
			DecisionDAO dao = new DecisionDAO();

			inserted=dao.insert(myFileFileName,documentName,decisionId);

			if(inserted>0){
				result = SUCCESS;
			}

		resultString="追加しました。";
		return result;
	}

	/**
	 * 取得メソッド
	 * sessionを取得
	 * @author Jun kikuchi
	 * @return session セッション
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * 格納メソッド
	 * sessionを格納
	 * @author Jun kikuchi
	 * @param session セッション
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	/**
	* 取得メソッド を取得
	* @return decisionId
	*/
	public int getDecisionId() {
		return decisionId;
	}

	/**
	* 設定メソッド を設定
	* @param decisionId
	*/
	public void setDecisionId(int decisionId) {
		this.decisionId = decisionId;
	}

	/**
	 * 取得メソッド
	 * userIdを取得
	 * @author KOHEI NITABARU
	 * @return documentName 資料名
	 */
	public String getDocumentName() {
		return documentName;
	}

	/**
	 * 格納メソッド
	 * userIdを格納
	 * @author KOHEI NITABARU
	 * @param userId ユーザーＩＤ
	 */
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	/**
	* 取得メソッド を取得
	* @return resultString
	*/
	public String getResultString() {
		return resultString;
	}

	/**
	* 設定メソッド を設定
	* @param resultString
	*/
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	/**
	* 取得メソッド を取得
	* @return jDrafterId
	*/
	public int getJDrafterId() {
		return jDrafterId;
	}

	/**
	* 設定メソッド を設定
	* @param jDrafterId
	*/
	public void setJDrafterId(int jDrafterId) {
		this.jDrafterId = jDrafterId;
	}

	/**
	* 取得メソッド を取得
	* @return myFile
	*/
	public File getMyFile() {
		return myFile;
	}

	/**
	* 設定メソッド を設定
	* @param myFile
	*/
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	/**
	* 取得メソッド を取得
	* @return myFileContentType
	*/
	public String getMyFileContentType() {
		return myFileContentType;
	}

	/**
	* 設定メソッド を設定
	* @param myFileContentType
	*/
	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	/**
	* 取得メソッド を取得
	* @return myFileFileName
	*/
	public String getMyFileFileName() {
		return myFileFileName;
	}

	/**
	* 設定メソッド を設定
	* @param myFileFileName
	*/
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	/**
	* 取得メソッド を取得
	* @return destPath
	*/
	public String getDestPath() {
		return destPath;
	}

	/**
	* 設定メソッド を設定
	* @param destPath
	*/
	public void setDestPath(String destPath) {
		this.destPath = destPath;
	}


}
