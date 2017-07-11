package com.internousdev.openconnect.students.action;

import java.sql.SQLException;

import com.internousdev.openconnect.students.dao.StudentsUpdateDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBの受講生の情報を更新するクラス
 * @author KOHEI NITABARU
 * @author TATSUHIRO SAITO
 * @since 2016/09/04
 * @version 1.0
 */
public class StudentsUpdateAction extends ActionSupport {

    /**
     * シリアル番号
     */
    private static final long serialVersionUID = 8587637642584563442L;
    /**
     * ユーザーID
     */
    private int userId;

    /**
     * 姓(漢字)
     */
    private String familyNameKanji;

    /**
     * 名(漢字)
     */
    private String givenNameKanji;
    /**
     * チーム名
     */
    private String teamName;
    /**
     * ユーザー名
     */
    private String userName;

    /**
     * 姓(ふりがな)
     */
    private String familyNameKana;

    /**
     * 名(ふりがな)
     */
    private String givenNameKana;





	/**
     * ユーザーフラグ
     */
    private int userFlg;


    /**
     * 結果文字
     */
    private String resultString = "更新に失敗しました。";

    /**
     * 実行メソッド DBの受講生情報を更新
     * @author KOHEI NITABARU
     * @author TATSUHIRO SAITO
     * @return result
     */
    public String execute() throws SQLException {

        String result = ERROR;
        userName = familyNameKanji + givenNameKanji;
        StudentsUpdateDAO dao = new StudentsUpdateDAO();
        int count = 0;
        count = dao.update(familyNameKanji,givenNameKanji,teamName,userFlg,userName,familyNameKana,givenNameKana,userId);
        if (count != 0) {

            result = SUCCESS;
            resultString = "更新に成功しました。";
        }
        return result;
    }

    /**
     * 取得メソッド ユーザーIDを取得
     * @author KOHEI NITABARU
     * @return userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * 設定メソッド ユーザーIDを設定
     * @author KOHEI NITABARU
     * @param userId
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * 取得メソッド 受講年を取得
     * @author KOHEI NITABARU
     * @return year
     */


    /**
     * 取得メソッド 姓(漢字)を取得
     * @author KOHEI NITABARU
     * @return familyNameKanji
     */
    public String getFamilyNameKanji() {
        return familyNameKanji;
    }

    /**
     * 設定メソッド 姓(漢字)を設定
     * @author KOHEI NITABARU
     * @param familyNameKanji
     */
    public void setFamilyNameKanji(String familyNameKanji) {
        this.familyNameKanji = familyNameKanji;
    }



    /**
     * 取得メソッド 名(漢字)を取得
     * @author KOHEI NITABARU
     * @return givenNameKanji
     */
    public String getGivenNameKanji() {
        return givenNameKanji;
    }

    /**
     * 設定メソッド 名(漢字)を設定
     * @author KOHEI NITABARU
     * @param givenNameKanji
     */
    public void setGivenNameKanji(String givenNameKanji) {
        this.givenNameKanji = givenNameKanji;
    }
    /**
     * 取得メソッド チーム名を取得
     * @author KOHEI NITABARU
     * @return temamName
     */
    public String getTeamName() {
        return teamName;
    }

    /**
     * 設定メソッド チーム名を設定
     * @author KOHEI NITABARU
     * @param TeamName
     */
    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
    /**
     * 取得メソッド チーム名を取得
     * @author KOHEI NITABARU
     * @return temamName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 設定メソッド チーム名を設定
     * @author KOHEI NITABARU
     * @param TeamName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }



    /**
     * 取得メソッド ユーザーフラグを取得
     * @author KOHEI NITABARU
     * @return userFlg
     */
    public int getUserFlg() {
        return userFlg;
    }

    /**
     * 設定メソッド ユーザーフラグを設定
     * @author KOHEI NITABARU
     * @param userFlg
     */
    public void setUserFlg(int userFlg) {
        this.userFlg = userFlg;
    }



    /**
     * 取得メソッド 結果文字リストを取得
     * @author KOHEI NITABARU
     * @return resultString
     */
    public String getResultString() {
        return resultString;
    }

    /**
     * 設定メソッド 結果文字リストを設定
     * @author KOHEI NITABARU
     * @param resultString
     */
    public void setResultString(String resultString) {
        this.resultString = resultString;
    }


    /**
     * 取得メソッド シリアル番号を取得
     * @author KOHEI NITABARU
     * @return serialVersionUID
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
   	* 取得メソッド を取得
   	* @return familyNameKana
   	*/
   	public String getFamilyNameKana() {
   		return familyNameKana;
   	}

   	/**
   	* 設定メソッド を設定
   	* @param familyNameKana
   	*/
   	public void setFamilyNameKana(String familyNameKana) {
   		this.familyNameKana = familyNameKana;
   	}

   	/**
   	* 取得メソッド を取得
   	* @return givenNameKana
   	*/
   	public String getGivenNameKana() {
   		return givenNameKana;
   	}

   	/**
   	* 設定メソッド を設定
   	* @param givenNameKana
   	*/
   	public void setGivenNameKana(String givenNameKana) {
   		this.givenNameKana = givenNameKana;
   	}


}