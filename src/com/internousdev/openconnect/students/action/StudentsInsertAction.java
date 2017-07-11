package com.internousdev.openconnect.students.action;

import com.internousdev.openconnect.students.dao.StudentsInsertDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBに受講生の情報を追加するクラス
 * @author KOHEI NITABARU
 * @since 2016/09/07
 */
public class StudentsInsertAction extends ActionSupport {

    /**
     * シリアル番号
     */
    private static final long serialVersionUID = -2877294813706334535L;
    /**
     * パス輪d－
     */
    private String password;
    /**
     * 姓(英語)
     */
    private String familyName;
    /**
     * 名(英語)
     */
    private String givenName;
    /**
     * 姓(漢字)
     */
    private String familyNameKanji;
    /**
     * 名(漢字)
     */
    private String givenNameKanji;
    /**
     * メールアドレス
     */
    private String phoneEmail;
    /**
     * 性別
     */
    private String sex;
    /**
     * ユーザーフラグ
     */
    private int userFlg;
    /**
     * 受講年
     */
    private String year;
    /**
     * 受講開始月
     */
    private String month;
    /**
     * 結果文字
     */
    private String resultString = "追加に失敗しました。";

    /**
     * 実行メソッド DBに受講生の情報を追加
     * @author KOHEI NITABARU
     * @return result
     */
    public String execute() {
        String result = ERROR;
        StudentsInsertDAO dao = new StudentsInsertDAO();
        int count = 0;
        count = dao.insert(password, familyName, givenName, familyNameKanji, givenNameKanji, phoneEmail, sex, userFlg,
                year, month);
        if (count > 0) {
            result = SUCCESS;
            resultString = "追加に成功しました。";
        }

        return result;
    }

    /**
    * 取得メソッド パスワードを取得
    * @author KOHEI NITABARU
    * @return password
    */
    public String getPassword() {
        return password;
    }

    /**
    * 設定メソッド パスワードを設定
    * @author KOHEI NITABARU
    * @param password
    */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
    * 取得メソッド 姓(英語)を取得
    * @author KOHEI NITABARU
    * @return familyName
    */
    public String getFamilyName() {
        return familyName;
    }

    /**
    * 設定メソッド 姓(英語)を設定
    * @author KOHEI NITABARU
    * @param familyName
    */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
    * 取得メソッド 名(英語)を取得
    * @author KOHEI NITABARU
    * @return givenName
    */
    public String getGivenName() {
        return givenName;
    }

    /**
    * 設定メソッド 名(英語)を設定
    * @author KOHEI NITABARU
    * @param givenName
    */
    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

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
    * 取得メソッド メールアドレスを取得
    * @author KOHEI NITABARU
    * @return phoneEmail
    */
    public String getPhoneEmail() {
        return phoneEmail;
    }

    /**
    * 設定メソッド メールアドレスを設定
    * @author KOHEI NITABARU
    * @param phoneEmail
    */
    public void setPhoneEmail(String phoneEmail) {
        this.phoneEmail = phoneEmail;
    }

    /**
    * 取得メソッド 性別を取得
    * @author KOHEI NITABARU
    * @return sex
    */
    public String getSex() {
        return sex;
    }

    /**
    * 設定メソッド 性別を設定
    * @author KOHEI NITABARU
    * @param sex
    */
    public void setSex(String sex) {
        this.sex = sex;
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
    * 取得メソッド 受講年を取得
    * @author KOHEI NITABARU
    * @return year
    */
    public String getYear() {
        return year;
    }

    /**
    * 設定メソッド 受講年を設定
    * @author KOHEI NITABARU
    * @param year
    */
    public void setYear(String year) {
        this.year = year;
    }

    /**
    * 取得メソッド 受講開始月を取得
    * @author KOHEI NITABARU
    * @return month
    */
    public String getMonth() {
        return month;
    }

    /**
    * 設定メソッド 受講開始月を設定
    * @author KOHEI NITABARU
    * @param month
    */
    public void setMonth(String month) {
        this.month = month;
    }

    /**
    * 取得メソッド 結果文字を取得
    * @author KOHEI NITABARU
    * @return resultString
    */
    public String getResultString() {
        return resultString;
    }

    /**
    * 設定メソッド 結果文字を設定
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

}