package com.internousdev.openconnect.students.action;

import com.internousdev.openconnect.students.dao.StudentsDeleteDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBから受講生を削除するクラス
 * @author KOHEI NITABARU
 * @since 2016/09/07
 */
public class StudentsDeleteAction extends ActionSupport {

    /**
     * シリアル番号
     */
    private static final long serialVersionUID = -310066990893410510L;
    /**
     * ユーザーID
     */
    private int userId;
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
        StudentsDeleteDAO dao = new StudentsDeleteDAO();
        String result = ERROR;
        int count = 0;
        count = dao.delete(userId);
        if (count > 0) {
            result = SUCCESS;
            resultString = "削除に成功しました。";
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
