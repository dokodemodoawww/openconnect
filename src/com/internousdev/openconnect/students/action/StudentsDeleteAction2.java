package com.internousdev.openconnect.students.action;

import com.internousdev.openconnect.students.dao.StudentsDeleteDAO2;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBから受講生を削除するクラス
 * @author KOHEI NITABARU
 * @since 2016/09/07
 */
public class StudentsDeleteAction2 extends ActionSupport {

    /**
     * シリアル番号
     */
    private static final long serialVersionUID = -310066990893410510L;
    /**
     * ユーザーID
     */
    private int userId;
    /**
     * 開始月
     */
    private String month;
    /**
     * 退会フラグ
     */
    private Boolean userDelflg;


    /**
     * 結果文字
     */
    private String resultString = "この受講生は削除できません。";

    /**
     * 実行メソッド 受講生の情報をDBから削除
     * @author KOHEI NITABARU
     * @return result
     */
    public String execute() {
        StudentsDeleteDAO2 dao = new StudentsDeleteDAO2();
        String result = ERROR;
        int count = 0;
        count = dao.delete2(month);
        if (count > 0) {
            result = SUCCESS;
            resultString = "非表示に成功しました。";
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
    * 取得メソッド ユーザーIDを取得
    * @author TATSUHIRO SAITO
    * @return month
    */
    public String getMonth() {
        return month;
    }

    /**
    * 設定メソッド ユーザーIDを設定
    * @author KOHEI NITABARU
    * @param userId
    */
    public void setMonth(String month) {
        this.month = month;
    }
    /**
    * 取得メソッド ユーザーIDを取得
    * @author TATSUHIRO SAITO
    * @return userdelflg
    */
    public Boolean getuserDelflg() {
        return userDelflg;
    }

    /**
    * 設定メソッド ユーザーIDを設定
    * @author KOHEI NITABARU
    * @param userId
    */
    public void setuserDelflg(Boolean userDelflg) {
        this.userDelflg = userDelflg;
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
